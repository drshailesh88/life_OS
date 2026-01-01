#!/usr/bin/env bash
#
# Start OpenBB MCP server for financial intelligence
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIFE_OS_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
OPENBB_VENV="$HOME/.openbb/venv"
OPENBB_MCP="$LIFE_OS_DIR/automation/openbb-integration/openbb_mcp.py"

echo "=== Starting OpenBB MCP Server ===="
echo

# Check if OpenBB is installed
if [ ! -d "$OPENBB_VENV" ]; then
    echo "❌ OpenBB not installed"
    echo
    echo "Run setup first:"
    echo "  $SCRIPT_DIR/setup-openbb.sh"
    exit 1
fi

# Check if MCP server exists
if [ ! -f "$OPENBB_MCP" ]; then
    echo "❌ OpenBB MCP server not found: $OPENBB_MCP"
    exit 1
fi

echo "✅ OpenBB virtual environment found"
echo "✅ MCP server found"
echo

# Activate OpenBB environment and start MCP server
echo "🚀 Starting OpenBB MCP server..."
echo
echo "This server provides financial intelligence via:"
echo "  • Stock quotes and analysis"
echo "  • Company profiles and financials"
echo "  • Dividend history"
echo "  • Market indices"
echo "  • Portfolio analysis"
echo
echo "Use with Claude Code skills:"
echo "  • stock-teacher.md"
echo "  • investment-advisor.md"
echo "  • market-snapshot.md"
echo
echo "Press Ctrl+C to stop"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

# Activate venv and run MCP server
source "$OPENBB_VENV/bin/activate"
python3 "$OPENBB_MCP"
