# Life OS

Personal Life and Business Operating System with financial management.

## Quick Start

### 1. Start Firefly III
```bash
docker-compose up -d
```
Access at: http://localhost:8080

### 2. Setup Notion MCP
Add to your `claude_desktop_config.json`:
```json
{
  "mcpServers": {
    "notion": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-notion"]
    }
  }
}
```

### 3. Directory Structure
```
life_OS/
├── skills/           # Claude Code skills
├── contexts/         # LLM context files
├── automation/       # n8n workflows
├── voice-inbox/      # Voice recordings (auto-processed)
├── docs/            # Documentation
└── IMPLEMENTATION_PLAN.md
```

## Skills Available

- `brain-dump` - Process unstructured thoughts
- `inbox-processor` - Classify and route quick captures
- `daily-briefing` - Morning briefing with context
- `money-snapshot` - Current financial status
- More coming...

## Documentation

See [IMPLEMENTATION_PLAN.md](./IMPLEMENTATION_PLAN.md) for full details.
