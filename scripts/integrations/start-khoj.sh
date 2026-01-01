#!/usr/bin/env bash
#
# Start Khoj AI server for semantic search
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIFE_OS_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
KHOJ_CONFIG="$HOME/.khoj/khoj.yml"

echo "=== Starting Khoj AI ===="
echo

# Check if Khoj is installed
if ! command -v khoj &> /dev/null; then
    echo "❌ Khoj not installed"
    echo
    echo "Run setup first:"
    echo "  $SCRIPT_DIR/setup-khoj.sh"
    exit 1
fi

# Check if config exists
if [ ! -f "$KHOJ_CONFIG" ]; then
    echo "❌ Khoj config not found: $KHOJ_CONFIG"
    echo
    echo "Run setup first:"
    echo "  $SCRIPT_DIR/setup-khoj.sh"
    exit 1
fi

# Check if export directory has content
EXPORT_DIR="$LIFE_OS_DIR/exports/notion"
if [ ! -d "$EXPORT_DIR" ] || [ -z "$(ls -A "$EXPORT_DIR" 2>/dev/null)" ]; then
    echo "⚠️  Export directory is empty: $EXPORT_DIR"
    echo
    echo "Export Notion data first:"
    echo "  $SCRIPT_DIR/export-notion.sh"
    echo
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo "📂 Config: $KHOJ_CONFIG"
echo "📂 Data: $EXPORT_DIR"
echo

# Check if Khoj is already running
if lsof -Pi :42110 -sTCP:LISTEN -t >/dev/null 2>&1 ; then
    echo "⚠️  Khoj is already running on port 42110"
    echo
    read -p "Restart Khoj? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Stopping existing Khoj..."
        pkill -f "khoj" || true
        sleep 2
    else
        echo "Opening browser..."
        command -v open >/dev/null && open http://localhost:42110 || \
        command -v xdg-open >/dev/null && xdg-open http://localhost:42110 || \
        echo "Visit: http://localhost:42110"
        exit 0
    fi
fi

echo "🚀 Starting Khoj server..."
echo

# Start Khoj in background
nohup khoj --config "$KHOJ_CONFIG" > "$HOME/.khoj/khoj.log" 2>&1 &
KHOJ_PID=$!

echo "Khoj PID: $KHOJ_PID"
echo

# Wait for server to start
echo "Waiting for server to start..."
for i in {1..30}; do
    if curl -s http://localhost:42110/api/health > /dev/null 2>&1; then
        echo
        echo "✅ Khoj is running!"
        echo
        echo "🌐 Web Interface: http://localhost:42110"
        echo "📊 API: http://localhost:42110/api"
        echo "📋 Logs: tail -f $HOME/.khoj/khoj.log"
        echo
        echo "💡 Quick test:"
        echo "   curl -G http://localhost:42110/api/search --data-urlencode 'q=productivity'"
        echo
        echo "To stop Khoj:"
        echo "   pkill -f khoj"
        echo "   or kill $KHOJ_PID"
        echo

        # Open browser
        if command -v open >/dev/null; then
            open http://localhost:42110
        elif command -v xdg-open >/dev/null; then
            xdg-open http://localhost:42110
        fi

        exit 0
    fi
    echo -n "."
    sleep 1
done

echo
echo "❌ Khoj failed to start"
echo
echo "Check logs:"
echo "  tail -f $HOME/.khoj/khoj.log"
echo
exit 1
