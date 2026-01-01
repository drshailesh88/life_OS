# Life OS

**Your Personal Operating System for Life, Knowledge, Money, and Habits**

A comprehensive, AI-powered system that manages every aspect of your life through Claude Code automation, Notion databases, and intelligent workflows.

## What Is This?

Life OS is a complete personal management system that:
- 🧠 **Captures and connects knowledge** (notes, ideas, learning)
- 🔍 **Semantic search** (find anything across all your knowledge with AI)
- 💰 **Tracks and optimizes finances** (budgets, spending, net worth)
- 📈 **Teaches investing** (learn with real market data, stock analysis)
- ✅ **Manages projects and tasks** (efforts, priorities, workflows)
- 🎯 **Builds lasting habits** (streaks, patterns, identity-based)
- 📊 **Discovers insights** (correlations, patterns, optimizations)
- 🎤 **Processes voice notes** (transcription, categorization, automation)
- 📝 **Tracks progress** (daily logs, weekly reviews, analytics)

All controlled through natural language conversations with Claude.

---

## ⚡ Quick Start

### One-Command Setup

```bash
cd ~/life_OS
./scripts/setup.sh
```

Installs and configures everything automatically!

### Manual Setup (30 min)

**1. Start Firefly III**
```bash
docker compose up -d
```
Access at: http://localhost:8080

**2. Setup Notion MCP**
See: [QUICKSTART.md](./QUICKSTART.md)

**3. Create Notion Databases**
See: [docs/NOTION_SCHEMAS.md](./docs/NOTION_SCHEMAS.md)

---

## 🚀 What You Can Do

### Daily Workflows

**Morning:**
```
"Give me my daily briefing"
```
→ Calendar, tasks, efforts, money snapshot, AI recommendations

**Throughout Day:**
```
"I just spent $45 on groceries at Whole Foods"
"Mark exercise as done"
"Process this brain dump: [voice transcript or thoughts]"
```

**Evening:**
```
"Daily check-in"
```
→ Reflect on the day, track mood/energy, set tomorrow's focus

**Sunday:**
```
"Run weekly review"
```
→ Comprehensive analysis, insights, planning for next week

### Voice Workflow

1. Record voice note on phone
2. Save to `~/life_OS/voice-inbox/`
3. Automatic transcription (Scriberr)
4. AI processing (brain-dump skill)
5. Tasks, ideas, notes created in Notion

### Financial Management

```
"Show my account balances"
"What did I spend on dining out this week?"
"What's my net worth?"
"Create transaction: spent $87 on groceries"
```

### Knowledge Building

```
"Find connections for my note about compound interest"
"Help me develop this idea: [concept]"
"What patterns do you see in my notes?"
```

### Habit Tracking

```
"Track my habits"
"Show my streaks"
"Analyze my habit patterns"
```

### Life Analytics

```
"Show me my life analytics"
"What correlates with my energy?"
"What patterns do you see?"
```

### Digital Brain

**Semantic Search:**
```
"Search my knowledge: habit formation"
"What have I written about investing?"
"Based on my notes, what works for building habits?"
```

**Investment Learning:**
```
"Teach me about dividend investing"
"Explain P/E ratios with real examples"
"Analyze AAPL stock for me"
"Compare AAPL vs MSFT"
```

**Portfolio Guidance:**
```
"Review my portfolio"
"Should I rebalance?"
"Help me decide between VTI and VOO"
"What's happening in the market today?"
```

---

## 🎯 Skills (15 Total)

### Core Workflows
- **brain-dump** - Process unstructured thoughts → organized entries
- **inbox-processor** - Route Quick Thoughts → proper databases
- **daily-briefing** - Personalized morning overview

### Advanced Analysis
- **weekly-review** - Comprehensive weekly synthesis + planning
- **money-snapshot** - Real-time financial dashboard
- **effort-planner** - Intelligent project planning assistant

### Intelligence Layer
- **note-connector** - Build knowledge graph with smart linking
- **idea-developer** - Socratic questioning for deep thinking
- **daily-check-in** - Evening reflection and wrap-up
- **habit-tracker** - Streak management, pattern detection
- **life-analytics** - Cross-system insights and correlations

### Digital Brain
- **khoj-search** - Semantic search across all your knowledge
- **stock-teacher** - Learn investing with real market data
- **investment-advisor** - Portfolio analysis and investment guidance
- **market-snapshot** - Daily market overview and news

---

## 📦 System Components

### Notion Databases (10+)

**Atlas (Knowledge):**
- 💡 Notes - Atomic knowledge units
- 📍 Maps - Maps of Content (MOCs)
- 📚 Sources - Books, articles, videos
- 👥 People - Personal CRM

**Calendar (Time):**
- 📆 Daily Logs - Daily reflections
- 📋 Weekly Reviews - Weekly synthesis

**Efforts (Action):**
- 🎯 Efforts - Projects by energy state
- ✅ Tasks - Action items

**Capture (Inbox):**
- 💭 Quick Thoughts - Unprocessed captures
- 💡 Ideas - Content/project ideas

**System:**
- 🎯 Habits - Habit tracking (optional)
- 📊 Metrics - Analytics dashboard

### Automation Infrastructure

**MCP Servers:**
- Notion MCP - Official Notion integration
- Finance MCP - Firefly III integration (natural language expense logging)
- Khoj MCP - Semantic search across all your knowledge (search, chat, research)
- OpenBB MCP - Financial intelligence and market data (10 tools for stocks, analysis)

**Voice Processing:**
- Scriberr - Automatic transcription
- File watcher - Automated processing pipeline

**Workflows (n8n):**
- Daily briefing automation
- Inbox processing
- Weekly review reminders
- Financial sync

### Context System

AI reads your context files for personalization:
- `profile.md` - Who you are, goals, values
- `current-focus.md` - Current priorities
- `voice.md` - Communication style
- `workflows.md` - Personal processes

---

## 📊 What Makes This Powerful

### 1. AI-Powered Intelligence
- Pattern detection across all life areas
- Correlations (sleep → energy, habits → mood)
- Predictive insights
- Personalized recommendations

### 2. Multi-Channel Capture
- Text (Notion, Quick Thoughts)
- Voice (mobile recordings → auto-processed)
- Brain dumps (unstructured → structured)

### 3. Cross-System Integration
- Habits ↔ Energy ↔ Productivity
- Spending ↔ Mood ↔ Decisions
- Knowledge ↔ Projects ↔ Progress

### 4. Behavior Change Foundation
- Identity-based habits
- Streak tracking & gamification
- Pattern-driven optimization
- Keystone habit identification

### 5. Privacy-First
- Self-hosted (Firefly III, Scriberr)
- Local processing (voice, automation)
- Your data stays yours

---

## 📁 Project Structure

```
life_OS/
├── 📖 QUICKSTART.md              # 30-min setup
├── 📖 SETUP_GUIDE.md             # Comprehensive guide
├── 📖 IMPLEMENTATION_PLAN.md     # Full roadmap
│
├── 🤖 skills/ (11 skills)
│   ├── Core: brain-dump, inbox-processor, daily-briefing
│   ├── Advanced: weekly-review, money-snapshot, effort-planner
│   └── Intelligence: note-connector, idea-developer, daily-check-in,
│                     habit-tracker, life-analytics
│
├── 🧠 contexts/ (4 context files)
│   ├── profile.md               # Identity, goals, values
│   ├── current-focus.md         # Current priorities
│   ├── voice.md                 # Communication style
│   └── workflows.md             # Personal processes
│
├── ⚙️ automation/
│   ├── finance-mcp/             # Firefly III MCP server
│   ├── voice-processor/         # Voice note automation
│   └── n8n-workflows/           # Workflow examples
│
├── 🎤 voice-inbox/              # Drop voice recordings here
│
├── 📚 docs/
│   ├── NOTION_SCHEMAS.md        # All database schemas
│   └── HABIT_TRACKING_SYSTEM.md # Habit framework
│
└── 🔧 scripts/
    └── setup.sh                 # One-command installer
```

---

## 🎓 Documentation

**Getting Started:**
- [QUICKSTART.md](./QUICKSTART.md) - Fastest path to running system
- [SETUP_GUIDE.md](./SETUP_GUIDE.md) - Step-by-step setup
- [IMPLEMENTATION_PLAN.md](./IMPLEMENTATION_PLAN.md) - Full vision & roadmap

**Reference:**
- [docs/NOTION_SCHEMAS.md](./docs/NOTION_SCHEMAS.md) - Database structures
- [docs/HABIT_TRACKING_SYSTEM.md](./docs/HABIT_TRACKING_SYSTEM.md) - Habit framework
- [automation/finance-mcp/README.md](./automation/finance-mcp/README.md) - Finance setup
- [automation/voice-processor/README.md](./automation/voice-processor/README.md) - Voice setup

---

## 💡 Philosophy

Based on proven frameworks:
- **Ideaverse Pro / LYT** - Linking Your Thinking, Maps of Content
- **ACE Framework** - Atlas (knowledge), Calendar (time), Efforts (action)
- **Atomic Habits** - Identity-based behavior change
- **Second Brain** - Capture, organize, distill, express
- **GTD** - Trusted system, mind like water

**Key Principles:**
- Systems > Goals
- Consistency > Perfection
- Identity > Outcomes
- Capture everything, process regularly
- Connect knowledge, don't just collect it

---

## 🔧 Technical Stack

- **UI/Database:** Notion
- **AI:** Claude Code (Sonnet 4.5) + MCP
- **Finance:** Firefly III (self-hosted)
- **Voice:** Scriberr (OpenAI Whisper)
- **Automation:** n8n
- **Infrastructure:** Docker, Node.js, Bash

---

## 📈 Stats

- **11 Skills** - Automating your entire life
- **10+ Databases** - Comprehensive data model
- **2 MCP Servers** - Deep integrations (Notion + Finance)
- **~10,000 lines** - Code + documentation
- **Production Ready** - Use today, expand forever

---

## 🚦 Status

**Current Phase:** Fully operational (Phase 0-3 complete + Intelligence layer)

**What Works Today:**
- ✅ Daily/weekly workflows
- ✅ Financial management
- ✅ Voice processing
- ✅ Habit tracking
- ✅ Knowledge building
- ✅ Pattern detection
- ✅ Project management

**Coming Next:**
- 📱 Clawdis integration (mobile AI interface)
- 🎨 Advanced visualizations
- 🤝 Relationship management
- 📝 Content creation workflows

---

## 🎯 Quick Commands

```bash
# Shortcuts (after running setup.sh)
lifeos       # Go to Life OS directory
briefing     # Get daily briefing
inbox        # Process inbox
review       # Weekly review
money        # Financial snapshot
```

---

## 🆘 Support

- **Issues:** https://github.com/drshailesh88/life_OS/issues
- **Notion MCP:** https://developers.notion.com/docs/mcp
- **Firefly III:** https://docs.firefly-iii.org
- **Claude Code:** https://code.claude.com/docs

---

**Built with Claude Code | Self-hosted | Privacy-first | Infinitely extensible**

Start managing your life today. 🚀
