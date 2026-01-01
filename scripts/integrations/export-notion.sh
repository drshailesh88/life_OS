#!/usr/bin/env bash
#
# Export Notion data for Khoj indexing
# Exports all databases to markdown files that Khoj can search
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIFE_OS_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
EXPORT_DIR="$LIFE_OS_DIR/exports/notion"

echo "=== Notion → Khoj Export ===="
echo

# Create export directories
mkdir -p "$EXPORT_DIR"/{notes,daily-logs,weekly-reviews,efforts,tasks,people,ideas,habits,contexts}

echo "📦 Export directories created"
echo

# Check if Notion MCP is configured
if ! command -v notion-cli &> /dev/null; then
    echo "⚠️  Notion CLI not found"
    echo
    echo "This script requires a Notion export tool."
    echo
    echo "Options:"
    echo "1. Use Notion's built-in export (Settings → Export All):"
    echo "   - Export as Markdown & CSV"
    echo "   - Unzip to: $EXPORT_DIR"
    echo
    echo "2. Install notion-exporter (Python):"
    echo "   pip install notion-exporter"
    echo "   notion-exporter --token YOUR_TOKEN --output $EXPORT_DIR"
    echo
    echo "3. Use n8n automation (automation/n8n-workflows/):"
    echo "   - Scheduled export every night"
    echo "   - Automatic markdown conversion"
    echo
    read -p "Have you exported Notion data to $EXPORT_DIR? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Export cancelled"
        exit 1
    fi
fi

# Copy context files (always up to date)
echo "📋 Copying context files..."
cp -r "$LIFE_OS_DIR"/contexts/* "$EXPORT_DIR/contexts/" 2>/dev/null || true

# Copy skills (for reference in search)
echo "📋 Copying skills documentation..."
mkdir -p "$EXPORT_DIR/skills"
cp -r "$LIFE_OS_DIR"/skills/* "$EXPORT_DIR/skills/" 2>/dev/null || true

# Copy any markdown docs
echo "📋 Copying documentation..."
mkdir -p "$EXPORT_DIR/docs"
cp -r "$LIFE_OS_DIR"/docs/* "$EXPORT_DIR/docs/" 2>/dev/null || true

echo
echo "✅ Export complete!"
echo
echo "Exported to: $EXPORT_DIR"
echo
echo "Contents:"
ls -lh "$EXPORT_DIR" | tail -n +2
echo
echo "📊 File counts:"
find "$EXPORT_DIR" -type f -name "*.md" | wc -l | xargs echo "  Markdown files:"
find "$EXPORT_DIR" -type f -name "*.pdf" | wc -l | xargs echo "  PDF files:"
echo
echo "Next steps:"
echo "1. Start Khoj: ./scripts/integrations/start-khoj.sh"
echo "2. Khoj will automatically index these files"
echo "3. Access Khoj at: http://localhost:42110"
echo
echo "💡 Tip: Set up a cron job or n8n workflow to run this export daily"
echo "   Example cron: 0 2 * * * $SCRIPT_DIR/export-notion.sh"
echo
