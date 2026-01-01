# Life OS Quick Start Guide

Get your complete personal operating system up and running in under 2 hours.

## 🎯 What You'll Have

By the end of this guide:
- ✅ Complete Life OS running locally
- ✅ All 4 MCP servers configured
- ✅ 15 skills ready to use
- ✅ Financial tracking active
- ✅ Knowledge search operational
- ✅ Market intelligence connected
- ✅ Daily/weekly workflows automated

---

## 📋 Prerequisites

### Required
- **Computer:** Mac, Linux, or Windows with WSL
- **Claude Code:** Installed and running
- **Git:** For version control
- **Python 3.8+:** For MCP servers
- **Node.js 18+:** For some integrations
- **Time:** 1-2 hours for complete setup

### Optional (Can Add Later)
- Docker (for Firefly III financial backend)
- Notion account (for central database)
- OpenBB API keys (for enhanced financial data)

---

## 🚀 Step 1: Clone Life OS (5 minutes)

### Get the Repository

```bash
# Navigate to your preferred location
cd ~

# Clone Life OS
git clone https://github.com/YOUR_USERNAME/life_OS.git
cd life_OS

# Check what's here
ls -la
```

**You should see:**
```
skills/                 # 15 Claude Code skills
automation/            # MCP servers and integrations
scripts/               # Setup and helper scripts
contexts/              # Your personal context templates
docs/                  # Comprehensive documentation
docker-compose.yml     # Financial backend (optional)
README.md             # Overview
```

---

## 🧠 Step 2: Setup Digital Brain (Khoj AI) (15 minutes)

### What is Khoj?
Semantic search across ALL your knowledge (notes, journals, documents).

### Installation

```bash
cd ~/life_OS

# Run automated setup
./scripts/integrations/setup-khoj.sh
```

**The script will:**
1. Check for Python 3
2. Install Khoj AI via pip
3. Create directory structure
4. Generate configuration file
5. Create helper scripts

### Manual Installation (if script fails)

```bash
# Create virtual environment
python3 -m venv ~/.khoj/venv
source ~/.khoj/venv/bin/activate

# Install Khoj
pip install khoj-assistant

# Create directories
mkdir -p ~/life_OS/exports/notion
mkdir -p ~/life_OS/exports/documents
```

### Configure Khoj

Create `~/.khoj/khoj.yml`:

```yaml
content-type:
  markdown:
    input-files:
      - ~/life_OS/**/*.md
      - ~/life_OS/contexts/**/*
      - ~/life_OS/skills/**/*
  pdf:
    input-files:
      - ~/life_OS/exports/documents/**/*.pdf

search-type:
  symmetric:
    encoder: "sentence-transformers/all-MiniLM-L6-v2"
```

### Test Khoj

```bash
# Start Khoj server
./scripts/integrations/start-khoj.sh

# Should open browser to http://localhost:42110
```

**✅ Success:** You see Khoj web interface

**❌ If it fails:**
- Check logs: `tail -f ~/.khoj/khoj.log`
- Verify Python: `python3 --version` (need 3.8+)
- Check port: `lsof -i :42110` (should be Khoj)

---

## 📈 Step 3: Setup Financial Intelligence (OpenBB) (20 minutes)

### What is OpenBB?
Real-time market data, stock analysis, portfolio tracking, and investment education.

### Installation

```bash
cd ~/life_OS

# Run automated setup
./scripts/integrations/setup-openbb.sh
```

**The script will:**
1. Create virtual environment
2. Install OpenBB Platform
3. Install free data providers (Yahoo Finance)
4. Configure API keys (optional)
5. Test installation

### API Keys (Optional but Recommended)

Get free API keys for better data:

**1. Financial Modeling Prep (FMP) - FREE**
- Visit: https://site.financialmoderingprep.com/developer/docs
- Sign up for free account
- Get 250 requests/day free
- Provides: Financial statements, analyst estimates

**2. Alpha Vantage - FREE**
- Visit: https://www.alphavantage.co/support/#api-key
- Get 500 requests/day free
- Provides: Real-time quotes, technical indicators

**3. FRED (Federal Reserve) - FREE**
- Visit: https://fred.stlouisfed.org/docs/api/api_key.html
- Unlimited requests (fair use)
- Provides: Economic indicators

### Add API Keys

Edit `~/.openbb/user_settings.json`:

```json
{
  "credentials": {
    "fmp_api_key": "YOUR_FMP_KEY_HERE",
    "alpha_vantage_api_key": "YOUR_AV_KEY_HERE",
    "fred_api_key": "YOUR_FRED_KEY_HERE"
  }
}
```

### Test OpenBB

```bash
# Activate environment
source ~/.openbb/venv/bin/activate

# Test in Python
python3 << 'TEST'
from openbb import obb
result = obb.equity.price.quote("AAPL")
print("✅ OpenBB working!" if result else "❌ Failed")
TEST
```

**✅ Success:** Prints "✅ OpenBB working!"

---

## 💰 Step 4: Setup Financial Backend (Firefly III) (15 minutes)

### What is Firefly III?
Self-hosted personal finance manager for tracking spending, budgets, accounts.

### Option A: Docker (Recommended)

```bash
cd ~/life_OS

# Start Firefly III
docker compose up -d

# Wait 30 seconds for startup
sleep 30

# Check status
docker compose ps
```

**Access:** http://localhost:8080

**First-time setup:**
1. Create admin account
2. Add your bank accounts
3. Set up budgets
4. Import transactions (optional)

### Option B: Skip for Now

If Docker not available, you can use Firefly III's cloud hosting or set up later.

The Life OS will work without it (just won't have financial tracking).

---

## 🔧 Step 5: Configure Claude Code MCP Servers (15 minutes)

### What are MCP Servers?
They give Claude Code access to your tools (Khoj, OpenBB, Firefly III, Notion).

### Find Your MCP Config File

**Mac:**
```bash
~/.config/claude-code/mcp.json
```

**Linux:**
```bash
~/.config/claude-code/mcp.json
```

**Windows (WSL):**
```bash
~/.config/claude-code/mcp.json
```

### Add All MCP Servers

Edit or create `mcp.json`:

```json
{
  "mcpServers": {
    "khoj": {
      "command": "python3",
      "args": ["/home/YOUR_USERNAME/life_OS/automation/khoj-integration/khoj_mcp.py"],
      "env": {
        "KHOJ_URL": "http://localhost:42110"
      }
    },
    "openbb": {
      "command": "/home/YOUR_USERNAME/.openbb/venv/bin/python3",
      "args": ["/home/YOUR_USERNAME/life_OS/automation/openbb-integration/openbb_mcp.py"]
    },
    "finance": {
      "command": "node",
      "args": ["/home/YOUR_USERNAME/life_OS/automation/finance-mcp/server.js"],
      "env": {
        "FIREFLY_URL": "http://localhost:8080",
        "FIREFLY_TOKEN": "YOUR_FIREFLY_API_TOKEN"
      }
    }
  }
}
```

**⚠️ Important:** Replace `YOUR_USERNAME` with your actual username!

**Get Firefly Token:**
1. Open Firefly III: http://localhost:8080
2. Go to Options → Profile → OAuth → Create New Token
3. Copy token and paste into `mcp.json`

### Restart Claude Code

```bash
# Quit Claude Code completely
# Start it again

# Check MCP servers loaded
# Should see: khoj, openbb, finance in available tools
```

---

## 📝 Step 6: Create Your Context Files (10 minutes)

### What are Context Files?
They tell Claude about YOU so everything is personalized.

### Navigate to Contexts

```bash
cd ~/life_OS/contexts
ls
```

**You should see templates:**
- `profile.md` - Who you are
- `current-focus.md` - Current priorities
- `voice.md` - Communication style
- `workflows.md` - Personal processes

### Fill Out profile.md

```bash
# Open in your editor
code profile.md
# or
vim profile.md
```

**Fill in:**
```markdown
# Your Profile

## Identity

**Name:** [Your name]
**Age:** [Age]
**Location:** [City, Country]
**Occupation:** [Job/role]

## Life Areas & Priorities

**1. Health:** [What matters to you here]
**2. Relationships:** [Who/what you prioritize]
**3. Career:** [Goals and values]
**4. Finance:** [Money priorities]
**5. Growth:** [Learning and development]

## Goals

### This Year (2026)
- [Goal 1]
- [Goal 2]
- [Goal 3]

### 5-Year Vision
[Where you want to be by 2031]

### Life Goals
[Long-term dreams and aspirations]

## Values

**Top 5:**
1. [Value 1 + why it matters]
2. [Value 2]
3. [Value 3]
4. [Value 4]
5. [Value 5]

## Financial Profile

**Income:** [Approximate monthly income]
**Savings Rate:** [% or amount saved monthly]
**Investment Strategy:** [Index funds / Dividend growth / etc.]
**Risk Tolerance:** [Conservative / Moderate / Aggressive]
**Financial Goal:** [FIRE / Retirement / House / etc.]
**Timeline:** [Years to goal]

## Background

**Education:** [Relevant education]
**Experience:** [Key experiences shaping you]
**Interests:** [Hobbies, passions, curiosities]
```

### Fill Out current-focus.md

```markdown
# Current Focus

## This Week

**Primary Focus:** [The ONE thing]

**Goals:**
1. [Goal 1]
2. [Goal 2]
3. [Goal 3]

## This Month

**Theme:** [One word or phrase]

**Objectives:**
- [Objective 1]
- [Objective 2]
- [Objective 3]

## This Quarter (Q1 2026)

**Big Rocks:**
1. [Major priority 1]
2. [Major priority 2]
3. [Major priority 3]

**Energy Allocation:**
- Work: [%]
- Personal Projects: [%]
- Learning: [%]
- Health: [%]
- Relationships: [%]
```

### Fill Out voice.md (Optional)

```markdown
# Communication Preferences

## Tone
- [Formal / Casual / Friendly / Professional]
- [Motivational / Practical / Balanced]

## Style
- Sentence length: [Short / Medium / Long]
- Complexity: [Simple / Technical / Mixed]
- Emoji usage: [None / Occasional / Frequent]

## Phrases I Like
- [Examples of phrases that resonate]

## Phrases to Avoid
- [Anything that feels off]
```

---

## 🎯 Step 7: Test Your First Skill (5 minutes)

### Daily Briefing Test

In Claude Code, type:

```
Give me my daily briefing
```

**You should get:**
- ✅ Calendar events (if any)
- ✅ Tasks (if any)
- ✅ Financial update (if Firefly III running)
- ✅ Market snapshot (if OpenBB working)
- ✅ Knowledge insights (if Khoj working)
- ✅ Personalized recommendations

**If sections are missing:**
- Check which MCP servers loaded
- Review MCP config paths
- Ensure services running (Khoj, OpenBB, Firefly)

### Knowledge Search Test

```
Search my knowledge: Life OS setup
```

**You should get:**
- ✅ Finds this guide and related files
- ✅ Semantic search results
- ✅ Khoj integration working

### Market Intelligence Test

```
What's the market doing today?
```

**You should get:**
- ✅ S&P 500, Nasdaq, Dow indices
- ✅ Market mood and context
- ✅ OpenBB integration working

### Investment Learning Test

```
Teach me about dividend investing
```

**You should get:**
- ✅ Complete lesson with real examples
- ✅ Real stock data (JNJ, etc.)
- ✅ Practice questions
- ✅ OpenBB tools being used

---

## 📚 Step 8: Understand Your Skills (10 minutes)

You now have **15 skills** available:

### Core Workflows (Use Daily)
1. **brain-dump** - Process thoughts into organized entries
   ```
   "Process this brain dump: [your thoughts]"
   ```

2. **inbox-processor** - Route captures to right place
   ```
   "Process my inbox"
   ```

3. **daily-briefing** - Morning overview
   ```
   "Give me my daily briefing"
   ```

### Advanced Analysis (Use Weekly)
4. **weekly-review** - Sunday synthesis
   ```
   "Run weekly review"
   ```

5. **money-snapshot** - Financial dashboard
   ```
   "Show me my money snapshot"
   ```

6. **effort-planner** - Project planning
   ```
   "Help me plan [project name]"
   ```

### Intelligence Layer (Use As Needed)
7. **note-connector** - Link related notes
   ```
   "Find connections for my note about [topic]"
   ```

8. **idea-developer** - Deep thinking
   ```
   "Help me develop this idea: [idea]"
   ```

9. **daily-check-in** - Evening reflection
   ```
   "Daily check-in"
   ```

10. **habit-tracker** - Track streaks
    ```
    "Track my habits"
    ```

11. **life-analytics** - Cross-system insights
    ```
    "Show me my life analytics"
    ```

### Digital Brain (Use Anytime)
12. **khoj-search** - Semantic search
    ```
    "Search my knowledge: [topic]"
    ```

13. **stock-teacher** - Learn investing
    ```
    "Teach me about [investing concept]"
    "Analyze [STOCK] for me"
    ```

14. **investment-advisor** - Portfolio guidance
    ```
    "Review my portfolio"
    "Should I buy [STOCK]?"
    ```

15. **market-snapshot** - Daily market overview
    ```
    "What's happening in the market?"
    ```

---

## 🔄 Step 9: Setup Notion (Optional) (30 minutes)

### What is Notion?
Your central database where everything lives.

### Install Notion MCP

```bash
# Install official Notion MCP
npm install -g @notionhq/notion-mcp
```

### Create Notion Workspace

1. Go to https://notion.so
2. Create account / sign in
3. Create new workspace: "Life OS"

### Create Databases

Follow: `docs/NOTION_SCHEMAS.md` for complete schemas

**Quick version - create these pages:**
1. **Notes** - Knowledge database
2. **Tasks** - Action items
3. **Efforts** - Projects
4. **Daily Logs** - Journal
5. **Quick Thoughts** - Inbox
6. **Habits** - Habit tracker

### Get Notion API Key

1. Visit: https://www.notion.so/my-integrations
2. Create new integration: "Life OS"
3. Copy Internal Integration Token
4. Share databases with integration

### Add to MCP Config

Edit `mcp.json`, add:

```json
{
  "mcpServers": {
    "notion": {
      "command": "notion-mcp",
      "env": {
        "NOTION_API_KEY": "YOUR_NOTION_KEY_HERE"
      }
    },
    ...existing servers...
  }
}
```

---

## 🤖 Step 10: Setup Automation (Optional) (20 minutes)

### Daily Briefing Automation

**Option A: Cron Job (Mac/Linux)**

```bash
# Edit crontab
crontab -e

# Add line (runs at 8am daily):
0 8 * * * cd ~/life_OS && echo "Give me my daily briefing" | claude-code
```

**Option B: n8n Workflow**

See: `automation/n8n-workflows/daily-briefing-automation.json`

### Voice Processing Automation

```bash
# Start voice processor
./automation/voice-processor/watch-and-transcribe.sh

# Runs in background
# Drop voice files in ~/life_OS/voice-inbox/
# Automatically transcribes and processes
```

### Khoj Data Export

```bash
# Add to crontab (runs daily at 2am):
0 2 * * * ~/life_OS/scripts/integrations/export-notion.sh
```

---

## ✅ Verification Checklist

Check each item:

### Core System
- [ ] Life OS cloned to `~/life_OS`
- [ ] All 15 skills visible in `skills/` directory
- [ ] Context files filled out (`contexts/profile.md` etc.)

### MCP Servers
- [ ] Khoj running (`http://localhost:42110`)
- [ ] OpenBB installed (test passed)
- [ ] Firefly III running (`http://localhost:8080`) [optional]
- [ ] All servers in Claude Code MCP config

### Skills Testing
- [ ] Daily briefing works
- [ ] Knowledge search works (Khoj)
- [ ] Market data works (OpenBB)
- [ ] At least 3 other skills tested

### Optional Components
- [ ] Notion databases created [optional]
- [ ] Notion MCP configured [optional]
- [ ] Automation set up [optional]

---

## 🎉 You're Done!

### What You Have Now

**Complete Personal Operating System:**
- 🧠 Semantic search across all knowledge
- 💰 Financial tracking and budgeting
- 📈 Market intelligence and investment education
- ✅ Task and project management
- 📊 Life analytics and insights
- 🎯 Habit tracking and formation
- 📝 Daily and weekly workflows

### Daily Workflow

**Morning (5 minutes):**
```
"Give me my daily briefing"
```

**Throughout Day:**
```
"I just spent $45 on groceries"
"Process this brain dump: [thoughts]"
"Mark exercise as done"
```

**Evening (5 minutes):**
```
"Daily check-in"
```

**Sunday (30 minutes):**
```
"Run weekly review"
```

**Anytime:**
```
"Search my knowledge: [anything]"
"Teach me about [topic]"
"What's the market doing?"
"Review my portfolio"
```

---

## 🆘 Troubleshooting

### Khoj Not Working

```bash
# Check if running
lsof -i :42110

# Check logs
tail -f ~/.khoj/khoj.log

# Restart
pkill -f khoj
./scripts/integrations/start-khoj.sh
```

### OpenBB Not Working

```bash
# Activate environment
source ~/.openbb/venv/bin/activate

# Test import
python3 -c "from openbb import obb; print('OK')"

# Reinstall if needed
pip install --upgrade openbb
```

### Firefly III Not Working

```bash
# Check Docker
docker compose ps

# Restart
docker compose restart

# Check logs
docker compose logs firefly
```

### MCP Servers Not Loading

1. Check `mcp.json` syntax (valid JSON?)
2. Check file paths (replace YOUR_USERNAME)
3. Restart Claude Code completely
4. Check Claude Code logs

### Skills Not Working

1. Verify MCP servers loaded
2. Check context files exist and filled out
3. Test individual MCP tools
4. Check skill file syntax

---

## 📚 Next Steps

### 1. Customize Skills
- Edit skills to match your workflow
- Add personal touches to outputs
- Create new skills for specific needs

### 2. Build Knowledge
- Start capturing notes
- Use brain-dump daily
- Let knowledge compound

### 3. Track Finances
- Add all accounts to Firefly III
- Set up budgets
- Track portfolio (if investing)

### 4. Learn Investing
- Use stock-teacher skill
- Build investment knowledge
- Make informed decisions

### 5. Optimize Workflows
- Find your rhythm
- Automate repetitive tasks
- Refine based on what works

---

## 📖 Additional Resources

### Documentation
- **Complete Guide:** `docs/IMPLEMENTATION_PLAN.md`
- **Notion Schemas:** `docs/NOTION_SCHEMAS.md`
- **Habit System:** `docs/HABIT_TRACKING_SYSTEM.md`
- **Digital Brain:** `docs/DIGITAL_BRAIN_INTEGRATION.md`

### Integrations
- **Khoj:** `automation/khoj-integration/README.md`
- **OpenBB:** `automation/openbb-integration/README.md`
- **Finance MCP:** `automation/finance-mcp/README.md`

### Skills Reference
- All 15 skills documented in `skills/` directory
- Each skill has complete usage examples
- Integration points clearly marked

---

## 🎯 Remember

**Life OS is:**
- Your second brain
- Your financial guide
- Your productivity system
- Your knowledge base
- Your decision support
- Your life analytics

**Life OS is not:**
- Magic (you still do the work)
- Automated (you're in control)
- Rigid (customize everything)
- Complex (simple tools, powerful combinations)

---

**Welcome to Life OS. Your life, systematized. 🚀**

Need help? Check docs/ or ask Claude Code anything!
