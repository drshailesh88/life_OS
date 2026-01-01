# Life OS Quick Start

Get your Life OS running in 30 minutes.

## ⚡ Speed Run Setup

### 1. Install Notion MCP (5 min)

```bash
# Get your Notion token from:
# https://www.notion.so/my-integrations

# Edit Claude config
# macOS: ~/Library/Application Support/Claude/claude_desktop_config.json
# Linux: ~/.config/Claude/claude_desktop_config.json

# Add:
{
  "mcpServers": {
    "notion": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-notion"],
      "env": {
        "NOTION_API_KEY": "secret_your_token_here"
      }
    }
  }
}

# Restart Claude Desktop
```

### 2. Create Notion Databases (15 min)

Open `docs/NOTION_SCHEMAS.md` and create:

**Minimum viable setup:**
- ✅ Tasks
- 💭 Quick Thoughts
- 📆 Daily Logs
- 🎯 Efforts

**Share each with your Notion integration!**

### 3. Test Your First Skill (5 min)

In Claude Desktop:

```
Use the brain-dump skill on this text:

"Need to review budget tomorrow. Also thinking about starting a side project for personal finance tracking. Spent $45 on groceries."
```

Expected: Claude extracts tasks, ideas, and categorizes spending.

### 4. Customize Contexts (5 min)

Edit these files with YOUR info:
- `contexts/profile.md`
- `contexts/current-focus.md`

Copy to Notion under "System > LLM Context"

---

## 🎯 Your First Day

### Morning (5 min)

In Claude Desktop:
```
Give me a daily briefing
```

### During Day

Capture thoughts in Notion Quick Thoughts database (mobile or desktop).

### Evening (5 min)

In Claude Desktop:
```
Process my Quick Thoughts inbox
```

---

## 🚀 Week 1 Goals

- [ ] Daily briefing habit (7/7 days)
- [ ] Capture 20+ thoughts in Quick Thoughts
- [ ] Process inbox at end of each day
- [ ] Create 3+ Efforts (projects you're working on)
- [ ] Log 10+ tasks

---

## 📚 Next Steps

After Week 1:
1. Read full `SETUP_GUIDE.md`
2. Install Firefly III for money tracking
3. Add voice processing (Scriberr)
4. Build weekly review habit
5. Expand to full database set

---

## 🆘 Troubleshooting

**Notion MCP not working:**
- Check token is correct
- Restart Claude Desktop
- Verify databases are shared with integration

**Skills not responding:**
- Make sure skill files are in `~/life_OS/skills/`
- Check context files exist in `~/life_OS/contexts/`

**Need help:**
- Full setup: `SETUP_GUIDE.md`
- Database schemas: `docs/NOTION_SCHEMAS.md`
- Implementation plan: `IMPLEMENTATION_PLAN.md`

---

**You're ready! Start with daily briefing tomorrow morning.**
