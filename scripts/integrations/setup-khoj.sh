#!/bin/bash

###############################################################################
# Khoj AI Integration Setup
# Sets up Khoj for semantic search across your Life OS knowledge base
###############################################################################

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

LIFE_OS_DIR="${HOME}/life_OS"
KHOJ_DATA_DIR="${HOME}/.khoj"

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Khoj AI - Second Brain Setup      ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo

# Check Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Python 3 is required but not installed${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Python 3 found${NC}"

# Install Khoj
echo -e "${BLUE}Installing Khoj AI...${NC}"
pip install khoj-assistant --quiet

echo -e "${GREEN}✓ Khoj installed${NC}"
echo

# Create data directories
echo -e "${BLUE}Setting up data directories...${NC}"
mkdir -p "${LIFE_OS_DIR}/exports/notion"
mkdir -p "${LIFE_OS_DIR}/exports/documents"
mkdir -p "${KHOJ_DATA_DIR}"

echo -e "${GREEN}✓ Directories created${NC}"
echo

# Configure Khoj
echo -e "${BLUE}Configuring Khoj...${NC}"

cat > "${KHOJ_DATA_DIR}/khoj.yml" << 'EOF'
# Khoj Configuration for Life OS

content-type:
  org:
    input-files:
      - ${HOME}/life_OS/exports/notion/**/*
      - ${HOME}/life_OS/exports/documents/**/*
    input-filter: null
    compressed-jsonl: ${HOME}/.khoj/content/org/org.jsonl.gz
    embeddings-file: ${HOME}/.khoj/content/org/org_embeddings.pt

  markdown:
    input-files:
      - ${HOME}/life_OS/**/*.md
      - ${HOME}/life_OS/contexts/**/*
      - ${HOME}/life_OS/skills/**/*
    input-filter:
      - "!node_modules"
      - "!.git"
    compressed-jsonl: ${HOME}/.khoj/content/markdown/markdown.jsonl.gz
    embeddings-file: ${HOME}/.khoj/content/markdown/markdown_embeddings.pt

  pdf:
    input-files:
      - ${HOME}/life_OS/exports/documents/**/*.pdf
    input-filter: null
    compressed-jsonl: ${HOME}/.khoj/content/pdf/pdf.jsonl.gz
    embeddings-file: ${HOME}/.khoj/content/pdf/pdf_embeddings.pt

search-type:
  symmetric:
    encoder: "sentence-transformers/all-MiniLM-L6-v2"
    cross-encoder: "cross-encoder/ms-marco-MiniLM-L-6-v2"

processor:
  conversation:
    openai:
      api-key: ${OPENAI_API_KEY}
      chat-model: "gpt-3.5-turbo"
    enable-offline-chat: false

app:
  host: "127.0.0.1"
  port: 42110
  should-log-telemetry: false
EOF

echo -e "${GREEN}✓ Khoj configured${NC}"
echo

# Create Notion export script
cat > "${LIFE_OS_DIR}/scripts/integrations/export-notion.sh" << 'EXPORT_EOF'
#!/bin/bash

# Export Notion data for Khoj indexing
# Run this weekly or after significant Notion updates

EXPORT_DIR="${HOME}/life_OS/exports/notion"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "Exporting Notion data to ${EXPORT_DIR}..."

# Instructions for user
cat << 'INSTRUCTIONS'
═══════════════════════════════════════════════════
Notion Export Instructions
═══════════════════════════════════════════════════

1. Open Notion in browser
2. Go to Settings & Members
3. Click "Settings" tab
4. Scroll to "Export content"
5. Click "Export all workspace content"
6. Format: Markdown & CSV
7. Include: Everything
8. Click "Export"
9. Download will start
10. Extract the ZIP to: ${HOME}/life_OS/exports/notion/

After extraction, run:
  khoj --regenerate

This will reindex all your Notion content for search.

═══════════════════════════════════════════════════
INSTRUCTIONS

# Wait for user
read -p "Press Enter after you've extracted the Notion export to exports/notion/..."

# Check if files exist
if [ -d "${EXPORT_DIR}" ] && [ "$(ls -A ${EXPORT_DIR})" ]; then
    echo "✓ Export found, triggering Khoj reindex..."
    khoj --regenerate
    echo "✓ Notion data indexed!"
else
    echo "⚠ No files found in ${EXPORT_DIR}"
    echo "Please extract your Notion export there"
fi
EXPORT_EOF

chmod +x "${LIFE_OS_DIR}/scripts/integrations/export-notion.sh"

echo -e "${GREEN}✓ Export script created${NC}"
echo

# Create startup script
cat > "${LIFE_OS_DIR}/scripts/integrations/start-khoj.sh" << 'START_EOF'
#!/bin/bash

# Start Khoj server

echo "Starting Khoj AI server..."
echo "Access at: http://localhost:42110"
echo

khoj --anonymous-mode
START_EOF

chmod +x "${LIFE_OS_DIR}/scripts/integrations/start-khoj.sh"

echo -e "${GREEN}✓ Startup script created${NC}"
echo

# Initial indexing
echo -e "${BLUE}Do you want to run initial indexing now?${NC}"
echo -e "${YELLOW}(You can also do this later by running: khoj --regenerate)${NC}"
read -p "Index now? [y/N]: " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Indexing Life OS data...${NC}"

    # Index markdown files (skills, contexts, docs)
    khoj --regenerate

    echo -e "${GREEN}✓ Initial indexing complete${NC}"
fi

# Summary
echo
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${GREEN}Khoj AI Setup Complete!${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo
echo "Next steps:"
echo
echo "1. Export Notion data:"
echo "   ${LIFE_OS_DIR}/scripts/integrations/export-notion.sh"
echo
echo "2. Start Khoj server:"
echo "   ${LIFE_OS_DIR}/scripts/integrations/start-khoj.sh"
echo
echo "3. Access Khoj:"
echo "   http://localhost:42110"
echo
echo "4. Use in Claude Code:"
echo "   \"Search my knowledge: [query]\""
echo
echo "Files indexed:"
echo "  - All .md files in Life OS"
echo "  - Context files"
echo "  - Skills"
echo "  - Notion exports (after you export)"
echo "  - Documents (PDFs)"
echo
echo -e "${BLUE}═══════════════════════════════════════${NC}"
