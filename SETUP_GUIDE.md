# Life OS Setup Guide

Step-by-step instructions to get your Life OS running.

## Prerequisites

- [ ] Claude Desktop installed
- [ ] Notion account (free or paid)
- [ ] Docker installed (for Firefly III)
- [ ] Node.js 18+ (for MCP servers)

---

## Phase 0: Foundation Setup

### Step 1: Install Firefly III

**Option A: Using Docker (Recommended)**

```bash
cd ~/life_OS
docker compose up -d
```

Access Firefly III at: http://localhost:8080

**First-time setup:**
1. Create admin account
2. Set up your first asset account (checking account)
3. Add budget categories
4. Configure recurring transactions (rent, subscriptions, etc.)

**Option B: Manual Installation**
See: https://docs.firefly-iii.org/

---

### Step 2: Set Up Notion Workspace

**2.1 Create Notion Workspace**

Create these databases (copy schemas from IMPLEMENTATION_PLAN.md):

1. **Atlas (Knowledge)**
   - 💡 Notes
   - 📍 Maps
   - 📚 Sources
   - 👥 People

2. **Calendar (Time)**
   - 📆 Daily Logs
   - 📋 Weekly Reviews

3. **Efforts (Action)**
   - 🎯 Efforts
   - ✅ Tasks

4. **Capture (Inbox)**
   - 💭 Quick Thoughts
   - 💡 Ideas

5. **System**
   - ⚙️ LLM Context (page with sub-pages)
   - 📊 Metrics Dashboard

**2.2 Import Context Files**

Create these pages under "System > LLM Context":
- Copy content from `contexts/profile.md`
- Copy content from `contexts/current-focus.md`
- Copy content from `contexts/voice.md`
- Copy content from `contexts/workflows.md`

**Customize each with your personal information!**

---

### Step 3: Install Notion MCP Server

**3.1 Get Notion Integration Token**

1. Go to https://www.notion.so/my-integrations
2. Click "New integration"
3. Name: "Claude Life OS"
4. Select your workspace
5. Copy the "Internal Integration Token"

**3.2 Share Databases with Integration**

For each database you created:
1. Open database
2. Click "••• " menu → "Connections" → "Add connection"
3. Select "Claude Life OS"

**3.3 Configure Claude Desktop**

Edit `claude_desktop_config.json`:

**macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
**Windows:** `%APPDATA%\Claude\claude_desktop_config.json`
**Linux:** `~/.config/Claude/claude_desktop_config.json`

Add:
```json
{
  "mcpServers": {
    "notion": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-notion"],
      "env": {
        "NOTION_API_KEY": "your_integration_token_here"
      }
    }
  }
}
```

**3.4 Restart Claude Desktop**

Look for MCP server indicator (🔌 icon)

**3.5 Test Connection**

In Claude Desktop:
```
Read my Notion Quick Thoughts database
```

If it works, you're connected!

---

### Step 4: Build Custom Finance MCP (Optional)

For Firefly III integration:

```bash
cd ~/life_OS/automation
mkdir finance-mcp
cd finance-mcp
npm init -y
npm install @modelcontextprotocol/sdk axios
```

Create `server.js`:
```javascript
#!/usr/bin/env node
import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import axios from 'axios';

const FIREFLY_URL = process.env.FIREFLY_URL || 'http://localhost:8080';
const FIREFLY_TOKEN = process.env.FIREFLY_TOKEN;

const server = new Server({
  name: 'firefly-mcp',
  version: '1.0.0',
}, {
  capabilities: {
    tools: {},
  },
});

// Tool: Get account balances
server.setRequestHandler('tools/list', async () => ({
  tools: [
    {
      name: 'get_balances',
      description: 'Get current account balances',
      inputSchema: { type: 'object', properties: {} }
    },
    {
      name: 'get_recent_transactions',
      description: 'Get recent transactions',
      inputSchema: {
        type: 'object',
        properties: {
          days: { type: 'number', description: 'Number of days back' }
        }
      }
    },
    // Add more tools...
  ]
}));

server.setRequestHandler('tools/call', async (request) => {
  const { name, arguments: args } = request.params;

  // Implement tool handlers...
  // See Firefly III API docs: https://api-docs.firefly-iii.org/
});

const transport = new StdioServerTransport();
server.connect(transport);
```

Add to `claude_desktop_config.json`:
```json
{
  "mcpServers": {
    "notion": { ... },
    "firefly": {
      "command": "node",
      "args": ["/home/user/life_OS/automation/finance-mcp/server.js"],
      "env": {
        "FIREFLY_URL": "http://localhost:8080",
        "FIREFLY_TOKEN": "your_firefly_token_here"
      }
    }
  }
}
```

---

### Step 5: Set Up Voice Processing (Optional)

**Using Scriberr:**

```bash
# Install via Docker
docker run -d \
  --name scriberr \
  -p 3000:3000 \
  -v ~/life_OS/voice-inbox:/watch \
  -v scriberr-data:/data \
  rishikanthc/scriberr:latest
```

Configure folder watcher:
- Watch: `~/life_OS/voice-inbox/`
- On new audio file → Auto-transcribe
- Output to: `~/life_OS/voice-inbox/transcripts/`

**Create automation:**
- New transcript → Trigger Claude Code skill `brain-dump`
- Result → Notion Quick Thoughts

---

## Phase 1: First Workflows

### Test Skill: Brain Dump

1. Create test file:
```bash
echo "Need to call dentist tomorrow. Also thinking about starting a newsletter about personal finance. Spent $85 on groceries today." > test-dump.txt
```

2. In Claude Desktop:
```
Use the brain-dump skill on this text:
[paste content]
```

3. Verify output categorization

---

### Test Skill: Inbox Processor

1. Add items to Quick Thoughts in Notion (3-5 items)

2. In Claude Desktop:
```
Run the inbox-processor skill
```

3. Check that items were:
   - Categorized correctly
   - Created in target databases
   - Marked as processed

---

### Test Skill: Daily Briefing

1. Add some data to Notion:
   - 2-3 tasks with due dates
   - 1-2 active Efforts
   - A few Quick Thoughts

2. In Claude Desktop:
```
Give me my daily briefing
```

3. Review output for completeness

---

## Phase 2: Make It Your Own

### Customize Context Files

**Required customization:**
- [ ] `contexts/profile.md` - Fill in your info
- [ ] `contexts/current-focus.md` - Set current priorities
- [ ] `contexts/voice.md` - Add your writing samples
- [ ] `contexts/workflows.md` - Document your routines

**Copy to Notion:**
After customizing, copy each to Notion under "System > LLM Context"

---

### Create Your First Effort

In Notion Efforts database:
1. Create new entry
2. Name: "Life OS Implementation"
3. Status: 🔥 Active
4. Area: Admin
5. Outcome: "Fully functional Life OS with daily/weekly workflows"
6. Next Action: "Complete Phase 1 setup"

---

### Log Your First Transactions

In Firefly III:
1. Add 5-10 recent transactions
2. Categorize them
3. Set up a budget for this month
4. Test the `money-snapshot` skill (if Finance MCP built)

---

### Establish First Habit

**Daily Briefing:**
1. Set calendar reminder for 8:00 AM
2. Each morning, open Claude Desktop
3. Type: "daily briefing"
4. Review and start your day

**Weekly Review:**
1. Set calendar reminder for Sunday 6:00 PM
2. Type: "weekly review" (when skill is built)
3. Reflect and plan next week

---

## Phase 3: Advanced Features

### Multi-Channel Access (Clawdis)

See: https://github.com/steipete/clawdis

**Setup overview:**
1. Clone Clawdis repo
2. Configure messaging integrations
3. Deploy Gateway
4. Install mobile apps
5. Test voice capture → Notion workflow

---

### Workflow Automation (n8n)

**Install n8n:**
```bash
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n
```

**Example workflows:**
- Daily email digest → Notion
- Bank CSV → Firefly III import
- Weekly review report → Email

---

### Bank Integration

**Option 1: Manual CSV**
- Export from bank weekly
- Import to Firefly III manually

**Option 2: Email Parsing**
- Forward bank emails to n8n
- Parse transactions
- Auto-import to Firefly III

**Option 3: Plaid API (Paid)**
- Sign up: https://plaid.com
- Integrate with Firefly III
- Automatic daily sync

---

## Troubleshooting

### Notion MCP Not Connecting
- [ ] Check token is correct
- [ ] Verify databases shared with integration
- [ ] Restart Claude Desktop
- [ ] Check MCP server logs

### Skills Not Working
- [ ] Verify skill file syntax
- [ ] Check context files are accessible
- [ ] Ensure Notion MCP connected
- [ ] Read error messages carefully

### Firefly III Issues
- [ ] Check Docker containers running: `docker ps`
- [ ] View logs: `docker logs firefly_iii`
- [ ] Verify database connection
- [ ] Check APP_KEY is set

---

## Next Steps

After basic setup:

1. **Week 1-2:** Use daily briefing + inbox processor daily
2. **Week 3:** Add weekly review habit
3. **Week 4:** Start financial tracking seriously
4. **Month 2:** Build custom skills for your specific needs
5. **Month 3:** Add multi-channel access (voice, mobile)

**Remember:** Start small, build habits, then expand!

---

## Getting Help

- **Issues:** https://github.com/drshailesh88/life_OS/issues
- **Notion MCP Docs:** https://developers.notion.com/docs/mcp
- **Firefly III Docs:** https://docs.firefly-iii.org
- **Claude Code Docs:** https://code.claude.com/docs

---

**You're ready to build your Life OS!**
