# Khoj AI Integration

Semantic search across your entire Life OS knowledge base using Khoj AI.

## What is Khoj?

Khoj is your AI second brain. It provides:

- **Semantic Search** - Find information by meaning, not just keywords
- **Knowledge Chat** - Ask questions, get answers synthesized from YOUR notes
- **Research Mode** - Combine your personal knowledge with web research
- **Privacy-First** - Runs locally on your machine, no cloud required

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Life OS (Notion)                     │
│  Notes • Daily Logs • Efforts • Tasks • Ideas • Habits  │
└────────────────────┬────────────────────────────────────┘
                     │
                     │ Export (markdown)
                     ▼
┌─────────────────────────────────────────────────────────┐
│              ~/life_OS/exports/notion/                  │
│   • notes/*.md      • daily-logs/*.md                   │
│   • efforts/*.md    • weekly-reviews/*.md               │
│   • contexts/*.md   • skills/*.md                       │
│   • docs/*.md       • documents/*.pdf                   │
└────────────────────┬────────────────────────────────────┘
                     │
                     │ Index (every 15 min)
                     ▼
┌─────────────────────────────────────────────────────────┐
│              Khoj AI Server (localhost:42110)           │
│   • Semantic index   • Vector embeddings                │
│   • Search API       • Chat API                         │
└────────────────────┬────────────────────────────────────┘
                     │
                     │ MCP Protocol
                     ▼
┌─────────────────────────────────────────────────────────┐
│           Khoj MCP Server (khoj_mcp.py)                 │
│   Tools: khoj_search • khoj_chat • khoj_research        │
└────────────────────┬────────────────────────────────────┘
                     │
                     │ Claude Code Integration
                     ▼
┌─────────────────────────────────────────────────────────┐
│                    Claude Code                          │
│   Skills: khoj-search • daily-briefing • weekly-review  │
│   "Search my knowledge: habit formation"                │
└─────────────────────────────────────────────────────────┘
```

## Setup

### Quick Setup (5 minutes)

```bash
cd ~/life_OS

# 1. Install and configure Khoj
./scripts/integrations/setup-khoj.sh

# 2. Export Notion data
./scripts/integrations/export-notion.sh

# 3. Start Khoj server
./scripts/integrations/start-khoj.sh
```

Khoj will open in your browser at http://localhost:42110

### Manual Setup

If you prefer manual setup:

**1. Install Khoj:**
```bash
pip install khoj-assistant
```

**2. Create config:**
```bash
mkdir -p ~/.khoj ~/life_OS/exports/notion
```

Create `~/.khoj/khoj.yml`:
```yaml
content-type:
  markdown:
    input-files:
      - ~/life_OS/exports/notion/**/*.md
      - ~/life_OS/contexts/**/*
      - ~/life_OS/skills/**/*
  pdf:
    input-files:
      - ~/life_OS/exports/notion/documents/**/*.pdf

search-type:
  symmetric:
    encoder: "sentence-transformers/all-MiniLM-L6-v2"
```

**3. Start Khoj:**
```bash
khoj --config ~/.khoj/khoj.yml
```

## MCP Integration

The Khoj MCP server exposes 3 tools to Claude Code:

### 1. khoj_search

Search across all your knowledge.

**Parameters:**
- `query` (string, required) - What to search for
- `limit` (integer, optional) - Number of results (default: 5)

**Example:**
```javascript
{
  "query": "morning routine optimization",
  "limit": 5
}
```

**Returns:** Relevant notes, journal entries, documents with relevance scores

### 2. khoj_chat

Ask questions and get synthesized answers from your knowledge.

**Parameters:**
- `question` (string, required) - Question to ask
- `context` (string, optional) - Additional context for the question

**Example:**
```javascript
{
  "question": "What are my principles for habit formation?",
  "context": "Based on notes, journal entries, and weekly reviews"
}
```

**Returns:** Synthesized answer from YOUR writing, with sources

### 3. khoj_research

Deep research combining personal knowledge + web.

**Parameters:**
- `topic` (string, required) - Topic to research
- `focus` (string, optional) - Specific aspect to focus on

**Example:**
```javascript
{
  "topic": "index fund investing",
  "focus": "how it fits my investment philosophy"
}
```

**Returns:** Combined answer from your notes + web research

## Configuration for Claude Code

Add to your Claude Code MCP configuration:

**~/.config/claude-code/mcp.json** (or platform equivalent):

```json
{
  "mcpServers": {
    "khoj": {
      "command": "python3",
      "args": ["/home/user/life_OS/automation/khoj-integration/khoj_mcp.py"],
      "env": {
        "KHOJ_URL": "http://localhost:42110"
      }
    }
  }
}
```

Restart Claude Code to load the integration.

## Using Khoj in Life OS

### Direct Search (Web UI)

Visit http://localhost:42110 and search directly.

### Claude Code Skill

Use the `khoj-search` skill:

```
"Search my knowledge: habit formation"
"What have I written about investing?"
"Based on my notes, what works for productivity?"
"Research using my knowledge: sustainable investing"
```

See: `skills/khoj-search.md` for full documentation.

### Integration in Other Skills

Khoj enhances existing skills:

**daily-briefing.md:**
```markdown
Use khoj_search to find:
- "notes created yesterday OR updated yesterday"
- "active efforts OR current priorities"

Include in briefing: "You recently captured thoughts on [topic]"
```

**weekly-review.md:**
```markdown
Use khoj_chat to ask:
- "What patterns emerge from this week's daily logs?"
- "What progress did I make on active efforts?"
```

**effort-planner.md:**
```markdown
Use khoj_search when planning new effort:
- "Find related notes for [effort topic]"
- "What have I learned about [domain]?"
```

## Data Flow

### Notion → Khoj Pipeline

**Option 1: Manual Export**
```bash
# Export from Notion (Settings → Export All → Markdown & CSV)
# Unzip to ~/life_OS/exports/notion/
./scripts/integrations/export-notion.sh
```

**Option 2: Automated (n8n)**
```
Cron (daily 2am)
  → n8n workflow
  → Notion API export
  → Convert to markdown
  → Save to exports/notion/
  → Khoj auto-indexes
```

**Option 3: Notion MCP (Future)**
```
Real-time sync using Notion MCP
  → No export needed
  → Always up to date
```

### Index Update Frequency

- **Automatic:** Khoj re-indexes every 15 minutes (configurable)
- **Manual:** Click "Sync" in Khoj web UI
- **On Export:** Run export script, Khoj detects changes

## Files

```
automation/khoj-integration/
├── README.md              # This file
├── khoj_mcp.py           # MCP server (3 tools)
└── requirements.txt      # Python dependencies

scripts/integrations/
├── setup-khoj.sh         # Install and configure
├── export-notion.sh      # Export Notion → markdown
└── start-khoj.sh         # Start Khoj server

skills/
└── khoj-search.md        # Search skill documentation

exports/notion/           # Export directory (created by scripts)
├── notes/
├── daily-logs/
├── weekly-reviews/
├── efforts/
├── contexts/
├── skills/
├── docs/
└── documents/
```

## Troubleshooting

### Khoj won't start

```bash
# Check if already running
lsof -i :42110

# Check logs
tail -f ~/.khoj/khoj.log

# Kill and restart
pkill -f khoj
./scripts/integrations/start-khoj.sh
```

### No search results

**Problem:** Empty index

**Solution:**
1. Export Notion data: `./scripts/integrations/export-notion.sh`
2. Verify files exist: `ls ~/life_OS/exports/notion/`
3. Restart Khoj: `./scripts/integrations/start-khoj.sh`
4. Wait 1-2 minutes for indexing
5. Check index status: http://localhost:42110/config

### Search quality poor

**Problem:** Khoj needs more context

**Tips:**
- Use natural language questions (not keywords)
- Provide context in your notes (full sentences)
- Link related notes (Khoj learns from connections)
- Be specific in search queries

**Example:**
- ❌ "productivity"
- ✅ "what systems have I built for staying productive?"

### MCP connection failed

**Problem:** Claude Code can't reach Khoj MCP

**Check:**
1. Khoj server running: `lsof -i :42110`
2. MCP config correct: `~/.config/claude-code/mcp.json`
3. Python path correct: `which python3`
4. Dependencies installed: `pip list | grep khoj`

**Debug:**
```bash
# Test MCP directly
python3 ~/life_OS/automation/khoj-integration/khoj_mcp.py

# Test Khoj API
curl -G http://localhost:42110/api/search \
  --data-urlencode 'q=test query'
```

## Performance

### Index Size

Typical Life OS after 1 year:
- ~500 notes
- ~365 daily logs
- ~52 weekly reviews
- ~20 efforts
- ~50 documents

**Index size:** ~50-100 MB
**Index time:** ~2-3 minutes
**Search speed:** <100ms per query

### Resource Usage

- **CPU:** <5% idle, 20-30% during indexing
- **RAM:** ~200-500 MB
- **Disk:** ~100 MB (index) + your markdown files

Khoj is lightweight and runs happily on any modern machine.

## Privacy & Security

**Local-First:**
- Runs entirely on your machine
- No data sent to external servers (unless using research mode)
- No API keys required for basic search

**Research Mode:**
- Uses web search (external queries)
- Only when explicitly requested
- Your personal notes stay local

**Data:**
- Stored in `~/.khoj/`
- Encrypted if your home directory is encrypted
- Delete: `rm -rf ~/.khoj/`

## Advanced Usage

### Custom Content Types

Add more content types to `~/.khoj/khoj.yml`:

```yaml
content-type:
  org-mode:
    input-files:
      - ~/org/**/*.org

  notion:
    input-files:
      - ~/life_OS/exports/notion/**/*.md

  pdf:
    input-files:
      - ~/Documents/**/*.pdf
      - ~/life_OS/exports/documents/**/*.pdf

  plaintext:
    input-files:
      - ~/notes/**/*.txt
```

### API Usage

Use Khoj API directly:

**Search:**
```bash
curl -G http://localhost:42110/api/search \
  --data-urlencode 'q=morning routine' \
  --data-urlencode 'n=5' \
  --data-urlencode 't=markdown'
```

**Chat:**
```bash
curl -X POST http://localhost:42110/api/chat \
  -H "Content-Type: application/json" \
  -d '{"q": "What are my principles for building wealth?"}'
```

**Research:**
```bash
curl -X POST http://localhost:42110/api/chat \
  -H "Content-Type: application/json" \
  -d '{"q": "/research sustainable investing based on my values"}'
```

### Automation

**Daily Export (cron):**
```bash
# Add to crontab: crontab -e
0 2 * * * /home/user/life_OS/scripts/integrations/export-notion.sh
```

**Startup (systemd):**

Create `/etc/systemd/system/khoj.service`:
```ini
[Unit]
Description=Khoj AI Second Brain
After=network.target

[Service]
Type=simple
User=your-username
ExecStart=/usr/local/bin/khoj --config /home/your-username/.khoj/khoj.yml
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Enable:
```bash
sudo systemctl enable khoj
sudo systemctl start khoj
```

## Resources

- **Khoj Documentation:** https://docs.khoj.dev
- **GitHub:** https://github.com/khoj-ai/khoj
- **Life OS Khoj Skill:** `skills/khoj-search.md`
- **Integration Plan:** `docs/DIGITAL_BRAIN_INTEGRATION.md`

## Next Steps

1. ✅ Setup complete
2. Export Notion data (daily/weekly)
3. Use `khoj-search` skill in Claude Code
4. Integrate into daily-briefing and weekly-review
5. Explore Khoj web UI for manual searches
6. (Optional) Set up automated export (cron or n8n)

**Start searching your knowledge:**
```
"Search my knowledge: what am I currently working on?"
```
