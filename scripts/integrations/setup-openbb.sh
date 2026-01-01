#!/usr/bin/env bash
#
# Setup OpenBB Platform for Life OS financial intelligence
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIFE_OS_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo "=== OpenBB Platform Setup ===="
echo
echo "OpenBB provides:"
echo "  • Market data (stocks, crypto, forex)"
echo "  • Technical & fundamental analysis"
echo "  • Economic indicators"
echo "  • News and sentiment"
echo "  • Portfolio analysis"
echo

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is required"
    echo "Install: https://www.python.org/downloads/"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
echo "✅ Python $PYTHON_VERSION"
echo

# Create virtual environment for OpenBB (recommended)
echo "📦 Creating OpenBB virtual environment..."
OPENBB_VENV="$HOME/.openbb/venv"

if [ -d "$OPENBB_VENV" ]; then
    echo "Virtual environment already exists: $OPENBB_VENV"
    read -p "Recreate? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$OPENBB_VENV"
        python3 -m venv "$OPENBB_VENV"
    fi
else
    python3 -m venv "$OPENBB_VENV"
fi

echo "✅ Virtual environment created"
echo

# Activate venv and install OpenBB
echo "📦 Installing OpenBB Platform..."
source "$OPENBB_VENV/bin/activate"

pip install --upgrade pip
pip install openbb

echo
echo "✅ OpenBB Platform installed"
echo

# Install OpenBB extensions
echo "📦 Installing OpenBB extensions..."
echo

echo "Core extensions:"
pip install openbb-yfinance  # Yahoo Finance (free)
pip install openbb-fmp       # Financial Modeling Prep (free tier)
pip install openbb-alpha-vantage  # Alpha Vantage (free tier)

echo
echo "Optional extensions (require API keys):"
echo "  - openbb-polygon (Polygon.io - premium)"
echo "  - openbb-intrinio (Intrinio - premium)"
echo "  - openbb-benzinga (Benzinga - premium)"
echo
read -p "Install optional extensions? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    pip install openbb-polygon openbb-intrinio openbb-benzinga || true
fi

echo
echo "✅ Extensions installed"
echo

# Create OpenBB config directory
mkdir -p "$HOME/.openbb"

# Create user settings (API keys, preferences)
cat > "$HOME/.openbb/user_settings.json" << EOF
{
  "credentials": {
    "fmp_api_key": null,
    "polygon_api_key": null,
    "alpha_vantage_api_key": null,
    "fred_api_key": null,
    "news_api_key": null
  },
  "preferences": {
    "data_directory": "$HOME/.openbb/data",
    "export_directory": "$LIFE_OS_DIR/exports/financial-data",
    "cache_directory": "$HOME/.openbb/cache"
  },
  "output_settings": {
    "chart_style": "light",
    "table_style": "fancy_grid"
  }
}
EOF

echo "📝 Created config: ~/.openbb/user_settings.json"
echo

# Create export directory
mkdir -p "$LIFE_OS_DIR/exports/financial-data"

echo
echo "✅ OpenBB Setup Complete!"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

# API Key instructions
echo "🔑 API Keys (Optional but Recommended)"
echo
echo "OpenBB works without API keys (uses Yahoo Finance), but for better data:"
echo
echo "1. Financial Modeling Prep (FMP) - FREE"
echo "   • Sign up: https://site.financialmodelingprep.com/developer/docs"
echo "   • Get 250 requests/day free"
echo "   • Provides: Financial statements, analyst estimates, company info"
echo
echo "2. Alpha Vantage - FREE"
echo "   • Sign up: https://www.alphavantage.co/support/#api-key"
echo "   • Get 500 requests/day free"
echo "   • Provides: Real-time quotes, technical indicators, forex"
echo
echo "3. FRED (Federal Reserve) - FREE"
echo "   • Sign up: https://fred.stlouisfed.org/docs/api/api_key.html"
echo "   • Unlimited requests (fair use)"
echo "   • Provides: Economic indicators, interest rates, inflation"
echo
echo "4. News API - FREE TIER"
echo "   • Sign up: https://newsapi.org/register"
echo "   • Get 100 requests/day free"
echo "   • Provides: Financial news, sentiment"
echo

read -p "Configure API keys now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo
    echo "Enter API keys (press Enter to skip):"
    echo

    read -p "FMP API Key: " FMP_KEY
    read -p "Alpha Vantage API Key: " AV_KEY
    read -p "FRED API Key: " FRED_KEY
    read -p "News API Key: " NEWS_KEY

    # Update config with API keys
    python3 << PYTHON_SCRIPT
import json

config_path = "$HOME/.openbb/user_settings.json"
with open(config_path, 'r') as f:
    config = json.load(f)

if "$FMP_KEY":
    config['credentials']['fmp_api_key'] = "$FMP_KEY"
if "$AV_KEY":
    config['credentials']['alpha_vantage_api_key'] = "$AV_KEY"
if "$FRED_KEY":
    config['credentials']['fred_api_key'] = "$FRED_KEY"
if "$NEWS_KEY":
    config['credentials']['news_api_key'] = "$NEWS_KEY"

with open(config_path, 'w') as f:
    json.dump(config, f, indent=2)

print("✅ API keys saved")
PYTHON_SCRIPT

fi

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

# Test OpenBB
echo "🧪 Testing OpenBB..."
echo

python3 << 'TEST_SCRIPT'
from openbb import obb
import sys

try:
    # Test basic quote
    result = obb.equity.price.quote("AAPL")
    if result:
        print("✅ OpenBB is working!")
        print(f"   Test: AAPL quote retrieved successfully")
    else:
        print("⚠️  OpenBB installed but test query failed")
        print("   This may be normal if you haven't configured API keys")
except Exception as e:
    print(f"❌ OpenBB test failed: {e}")
    print("   Check installation and API keys")
    sys.exit(1)
TEST_SCRIPT

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

# Create activation script
cat > "$SCRIPT_DIR/activate-openbb.sh" << 'ACTIVATE'
#!/usr/bin/env bash
# Activate OpenBB environment

source "$HOME/.openbb/venv/bin/activate"
echo "OpenBB environment activated"
echo "Try: python3 -c 'from openbb import obb; print(obb)'"
ACTIVATE

chmod +x "$SCRIPT_DIR/activate-openbb.sh"

echo "✅ Setup Complete!"
echo
echo "Next steps:"
echo
echo "1. Test OpenBB:"
echo "   source $OPENBB_VENV/bin/activate"
echo "   python3"
echo "   >>> from openbb import obb"
echo "   >>> obb.equity.price.quote('AAPL')"
echo
echo "2. Start OpenBB MCP server:"
echo "   $SCRIPT_DIR/start-openbb.sh"
echo
echo "3. Try the stock-teacher skill in Claude Code:"
echo "   \"Teach me about dividend investing\""
echo "   \"Analyze AAPL stock for me\""
echo
echo "Documentation:"
echo "  • OpenBB Docs: https://docs.openbb.co"
echo "  • Life OS Integration: $LIFE_OS_DIR/automation/openbb-integration/README.md"
echo
