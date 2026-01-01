#!/bin/bash

###############################################################################
# Life OS Setup Script
# Automates installation and configuration of Life OS components
###############################################################################

set -e  # Exit on error

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration
LIFE_OS_DIR="${HOME}/life_OS"
CLAUDE_CONFIG_DIR=""

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     OS_TYPE=Linux;;
    Darwin*)    OS_TYPE=Mac;;
    *)          OS_TYPE="UNKNOWN:${OS}"
esac

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        Life OS Setup Script           ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo
echo -e "${YELLOW}Detected OS: ${OS_TYPE}${NC}"
echo

# Function to print section headers
print_section() {
    echo
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
}

# Function to check if command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Function to prompt yes/no
prompt_yes_no() {
    local prompt="$1"
    local default="${2:-n}"

    if [ "$default" = "y" ]; then
        prompt="${prompt} [Y/n]: "
    else
        prompt="${prompt} [y/N]: "
    fi

    read -p "$prompt" response
    response=${response:-$default}

    case "$response" in
        [yY][eE][sS]|[yY]) return 0 ;;
        *) return 1 ;;
    esac
}

# Detect Claude Desktop config location
detect_claude_config() {
    if [ "$OS_TYPE" = "Mac" ]; then
        CLAUDE_CONFIG_DIR="${HOME}/Library/Application Support/Claude"
    elif [ "$OS_TYPE" = "Linux" ]; then
        CLAUDE_CONFIG_DIR="${HOME}/.config/Claude"
    fi

    if [ ! -d "$CLAUDE_CONFIG_DIR" ]; then
        echo -e "${YELLOW}⚠ Claude Desktop config directory not found${NC}"
        echo -e "${YELLOW}  Expected: ${CLAUDE_CONFIG_DIR}${NC}"
        echo -e "${YELLOW}  Please install Claude Desktop first${NC}"
        return 1
    fi

    echo -e "${GREEN}✓ Found Claude Desktop config: ${CLAUDE_CONFIG_DIR}${NC}"
    return 0
}

# Install Docker (if needed)
setup_docker() {
    print_section "Docker Setup"

    if command_exists docker; then
        echo -e "${GREEN}✓ Docker already installed${NC}"
        docker --version
        return 0
    fi

    if prompt_yes_no "Docker not found. Install Docker?"; then
        if [ "$OS_TYPE" = "Mac" ]; then
            echo "Please install Docker Desktop from: https://www.docker.com/products/docker-desktop"
            echo "Press Enter after installation..."
            read
        elif [ "$OS_TYPE" = "Linux" ]; then
            echo "Installing Docker..."
            curl -fsSL https://get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            sudo usermod -aG docker $USER
            echo -e "${GREEN}✓ Docker installed${NC}"
            echo -e "${YELLOW}⚠ Please log out and back in for group changes to take effect${NC}"
        fi
    fi
}

# Setup Firefly III
setup_firefly() {
    print_section "Firefly III Setup"

    if prompt_yes_no "Set up Firefly III for financial management?" "y"; then
        cd "$LIFE_OS_DIR"

        if [ -f "docker-compose.yml" ]; then
            echo "Starting Firefly III..."
            docker compose up -d

            echo -e "${GREEN}✓ Firefly III started${NC}"
            echo -e "${BLUE}→ Access at: http://localhost:8080${NC}"
            echo -e "${YELLOW}→ First-time setup: Create admin account${NC}"
        else
            echo -e "${RED}✗ docker-compose.yml not found${NC}"
        fi
    fi
}

# Setup Notion MCP
setup_notion_mcp() {
    print_section "Notion MCP Setup"

    if ! detect_claude_config; then
        return 1
    fi

    echo "To set up Notion MCP, you need a Notion integration token."
    echo
    echo "Steps:"
    echo "1. Go to: https://www.notion.so/my-integrations"
    echo "2. Click 'New integration'"
    echo "3. Name: 'Claude Life OS'"
    echo "4. Select your workspace"
    echo "5. Copy the 'Internal Integration Token'"
    echo

    if prompt_yes_no "Have you created the integration?"; then
        read -p "Paste your Notion integration token: " notion_token

        # Backup existing config
        config_file="${CLAUDE_CONFIG_DIR}/claude_desktop_config.json"
        if [ -f "$config_file" ]; then
            cp "$config_file" "${config_file}.backup"
            echo -e "${GREEN}✓ Backed up existing config${NC}"
        fi

        # Create or update config
        cat > "$config_file" << EOF
{
  "mcpServers": {
    "notion": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-notion"],
      "env": {
        "NOTION_API_KEY": "${notion_token}"
      }
    }
  }
}
EOF

        echo -e "${GREEN}✓ Notion MCP configured${NC}"
        echo -e "${YELLOW}⚠ Please restart Claude Desktop${NC}"
        echo
        echo -e "${BLUE}Next: Share your Notion databases with the integration${NC}"
        echo "  1. Open each database in Notion"
        echo "  2. Click '•••' → 'Connections' → 'Add connection'"
        echo "  3. Select 'Claude Life OS'"
    fi
}

# Setup Finance MCP
setup_finance_mcp() {
    print_section "Finance MCP Setup"

    if ! detect_claude_config; then
        return 1
    fi

    echo "Finance MCP connects Claude to Firefly III."
    echo

    if prompt_yes_no "Set up Finance MCP?"; then
        cd "${LIFE_OS_DIR}/automation/finance-mcp"

        echo "Installing dependencies..."
        npm install

        echo
        echo "To complete setup, you need a Firefly III access token."
        echo
        echo "Steps:"
        echo "1. Open Firefly III: http://localhost:8080"
        echo "2. Go to Options → Profile → OAuth"
        echo "3. Create new Personal Access Token"
        echo "4. Copy the token"
        echo

        if prompt_yes_no "Have you created the token?"; then
            read -p "Paste your Firefly III token: " firefly_token

            # Update Claude config
            config_file="${CLAUDE_CONFIG_DIR}/claude_desktop_config.json"

            # Read existing config
            existing_config=$(cat "$config_file" 2>/dev/null || echo '{"mcpServers":{}}')

            # Add finance MCP (using jq if available, otherwise manual)
            if command_exists jq; then
                echo "$existing_config" | jq \
                    --arg token "$firefly_token" \
                    '.mcpServers.firefly = {
                        "command": "node",
                        "args": ["'${LIFE_OS_DIR}'/automation/finance-mcp/server.js"],
                        "env": {
                            "FIREFLY_URL": "http://localhost:8080",
                            "FIREFLY_TOKEN": $token
                        }
                    }' > "$config_file"
            else
                echo -e "${YELLOW}⚠ jq not installed. Please manually add to config:${NC}"
                echo '
    "firefly": {
      "command": "node",
      "args": ["'${LIFE_OS_DIR}'/automation/finance-mcp/server.js"],
      "env": {
        "FIREFLY_URL": "http://localhost:8080",
        "FIREFLY_TOKEN": "'$firefly_token'"
      }
    }
'
            fi

            echo -e "${GREEN}✓ Finance MCP configured${NC}"
            echo -e "${YELLOW}⚠ Please restart Claude Desktop${NC}"
        fi
    fi
}

# Setup Voice Processing
setup_voice_processor() {
    print_section "Voice Processing Setup"

    mkdir -p "${LIFE_OS_DIR}/voice-inbox"
    mkdir -p "${LIFE_OS_DIR}/voice-inbox/transcripts"
    mkdir -p "${LIFE_OS_DIR}/voice-inbox/processed"

    echo "Voice processing watches for audio files and transcribes them."
    echo

    if prompt_yes_no "Install Scriberr for transcription?" "y"; then
        echo "Starting Scriberr container..."
        docker run -d \
            --name scriberr \
            -p 3000:3000 \
            -v "${LIFE_OS_DIR}/voice-inbox:/watch" \
            -v scriberr-data:/data \
            rishikanthc/scriberr:latest

        echo -e "${GREEN}✓ Scriberr installed${NC}"
        echo -e "${BLUE}→ Access at: http://localhost:3000${NC}"
    fi

    echo
    echo -e "${BLUE}Voice inbox ready: ${LIFE_OS_DIR}/voice-inbox${NC}"
    echo "Drop audio files there for automatic processing."
}

# Create desktop shortcuts/aliases
setup_shortcuts() {
    print_section "Shortcuts Setup"

    # Create shell aliases
    shell_rc="${HOME}/.bashrc"
    if [ "$OS_TYPE" = "Mac" ]; then
        shell_rc="${HOME}/.zshrc"
    fi

    cat >> "$shell_rc" << 'EOF'

# Life OS Shortcuts
alias lifeos='cd ~/life_OS'
alias briefing='echo "Give me my daily briefing" | claude code'
alias inbox='echo "Process my Quick Thoughts inbox" | claude code'
alias review='echo "Run weekly-review skill" | claude code'
alias money='echo "Show my money snapshot" | claude code'
EOF

    echo -e "${GREEN}✓ Shell aliases added to ${shell_rc}${NC}"
    echo "  - lifeos   : Go to Life OS directory"
    echo "  - briefing : Get daily briefing"
    echo "  - inbox    : Process inbox"
    echo "  - review   : Weekly review"
    echo "  - money    : Financial snapshot"
    echo
    echo -e "${YELLOW}Restart your terminal or run: source ${shell_rc}${NC}"
}

# Summary and next steps
show_summary() {
    print_section "Setup Complete!"

    echo -e "${GREEN}✓ Life OS is ready!${NC}"
    echo
    echo "Next steps:"
    echo "1. Create Notion databases (see: docs/NOTION_SCHEMAS.md)"
    echo "2. Customize context files (contexts/)"
    echo "3. Restart Claude Desktop"
    echo "4. Test: Run 'briefing' command"
    echo
    echo "Quick start guide: ${LIFE_OS_DIR}/QUICKSTART.md"
    echo "Full setup guide: ${LIFE_OS_DIR}/SETUP_GUIDE.md"
    echo
    echo -e "${BLUE}Happy organizing! 🚀${NC}"
}

# Main installation flow
main() {
    # Change to Life OS directory
    if [ ! -d "$LIFE_OS_DIR" ]; then
        echo -e "${RED}Error: ${LIFE_OS_DIR} not found${NC}"
        echo "Please clone the repository first."
        exit 1
    fi

    cd "$LIFE_OS_DIR"

    # Run setup steps
    setup_docker
    setup_firefly
    setup_notion_mcp
    setup_finance_mcp
    setup_voice_processor
    setup_shortcuts

    # Show summary
    show_summary
}

# Run main
main
