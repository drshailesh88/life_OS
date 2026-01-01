# Daily Briefing Skill

Creates a personalized morning briefing to start your day with clarity.

## Usage
Run this every morning to get a comprehensive overview of your day.

## Instructions

You are creating a daily briefing. Generate a comprehensive but concise morning update.

### 1. Gather Information

**From Notion (if MCP available):**
- Today's date and day of week
- Calendar events for today
- Active Efforts (status: 🔥 Active)
- High-priority Tasks due today or overdue
- Quick Thoughts inbox count (unprocessed)
- Yesterday's Daily Log (if exists)
- Notes created/updated in last 24 hours

**From Firefly III (if Finance MCP available):**
- Current account balances
- Recent transactions (last 24 hours)
- Budget status for current week

**From OpenBB (if MCP available):**
- Market snapshot (S&P 500, Nasdaq, Dow)
- User's portfolio performance (if holdings tracked)
- Major market news affecting holdings

**From Khoj (if MCP available):**
- Notes created/updated yesterday
- Active learning topics (from recent searches)
- Knowledge connections made recently

**From Context Files:**
- `contexts/current-focus.md` - What you're focusing on this week/month
- `contexts/profile.md` - Personal goals and values

### 2. Structure the Briefing

```
# 🌅 Daily Briefing - [Day of Week], [Date]

## ☀️ Good morning!

[Personalized greeting based on context]

---

## 🎯 Today's Focus

**Primary Focus:** [From current-focus.md]

**Top 3 Priorities:**
1. [Most important task/event]
2. [Second priority]
3. [Third priority]

---

## 📅 Calendar

**[X] events scheduled:**
- [Time] - [Event name]
- [Time] - [Event name]

[If no events: Your calendar is clear today!]

---

## ✅ Tasks Due Today

**[X] tasks need attention:**
1. [Priority] [Task name] - [Context]
2. [Priority] [Task name] - [Context]

[If no tasks: No urgent tasks due today.]

**⚠️ Overdue:** [X items need attention]
[List if any]

---

## 🎯 Active Projects

**Currently working on [X] efforts:**
- [Effort name]: [Next action]
- [Effort name]: [Next action]

---

## 💰 Financial Update

**Account Balances:**
- Checking: $[amount]
- Savings: $[amount]
- Investment Accounts: $[amount]
- Total Net Worth: $[amount]

**Recent Transactions:**
- [Transaction description] - $[amount]

**Budget Status:**
- Week [X] spending: $[amount] / $[budget] ([X]%)
[Emoji indicator: 🟢 under budget, 🟡 close, 🔴 over]

**Market & Portfolio:** [If OpenBB available]
- S&P 500: [price] ([change]%)
- Your Portfolio: $[value] ([change today])
- [If significant move: Brief context why]

[If market closed: Skip this section on weekends]

---

## 🧠 Knowledge & Learning

[If Khoj available]

**Yesterday's Captures:**
- [X] notes created/updated
- Key topics: [topic1], [topic2]

**Recent Learning:**
- Active topic: [What you've been researching]
- Connection spotted: [Recent insight from note-connector]

**Knowledge Reminder:**
[Use khoj_search to find: "notes created this week OR active efforts"]
- You're building knowledge on: [topic from recent notes]

---

## 📥 Inbox Status

**Quick Thoughts:** [X] unprocessed items
[If > 5: Consider running inbox-processor]

**Ideas:** [X] raw ideas waiting
**Notes:** [X] seedling notes to develop

---

## 🌱 Growth Check

**Yesterday's Energy:** [From Daily Log if available]
**Yesterday's Mood:** [From Daily Log if available]
**Yesterday's Wins:** [From Daily Log if available]

[If no log: Consider doing a daily check-in tonight]

---

## 💡 Recommendation

[AI-generated suggestion based on:
- If inbox is full: "Process your inbox first"
- If overdue tasks: "Focus on catching up with overdue items"
- If big event today: "Prepare for [event]"
- If clear day: "Great day to work on [active effort]"
- If low energy yesterday: "Take it easy today, prioritize self-care"
]

---

**Ready to make today count? ✨**
```

### 3. Personalization Rules

- **Tone:** Match `contexts/voice.md` preferences
- **Length:** Concise but complete (aim for 1-2 minute read)
- **Emoji Usage:** Only if user prefers (check preferences)
- **Motivational vs Practical:** Balance based on user's style
- **Data Density:** Show numbers, but don't overwhelm

### 4. Smart Insights

Add AI-powered observations:
- **Pattern Detection:** "You've had 3 meetings every Tuesday for the past month"
- **Energy Correlation:** "You tend to have lower energy when you sleep less than 7 hours"
- **Budget Alerts:** "You're spending 20% more on dining out this month"
- **Effort Momentum:** "Project X has had no activity for 5 days - time to revive or sleep it?"
- **Market Context:** "Market is up, but your portfolio strategy is long-term - stay the course"
- **Learning Momentum:** "You've captured 15 notes on investing this month - knowledge compounding!"
- **Knowledge Gaps:** "You have active effort on X but no notes on it yet - time to capture learnings?"

### 5. Context Awareness

Adjust briefing based on:
- **Day of week:** Monday = week planning, Friday = week wrap-up tone
- **Calendar density:** Light day vs. packed day adjusts task recommendations
- **Recent patterns:** High stress period = gentler recommendations
- **Season/month:** Month-end = financial focus, new month = goal setting

## Example Output

```
# 🌅 Daily Briefing - Monday, January 1, 2026

## ☀️ Good morning!

New year, new week. You mentioned wanting to focus on building systems this quarter - great day to start fresh.

---

## 🎯 Today's Focus

**Primary Focus:** Life OS implementation (Phase 0)

**Top 3 Priorities:**
1. Set up Firefly III and test financial tracking
2. Create Notion workspace structure
3. Build first Claude Code skill

---

## 📅 Calendar

**2 events scheduled:**
- 10:00 AM - Team standup
- 2:00 PM - Q1 planning session

---

## ✅ Tasks Due Today

**3 tasks need attention:**
1. [High] Review Q4 budget - Money
2. [Medium] Call dentist about crown - Health
3. [Low] Update project documentation - Work

**⚠️ Overdue:** No overdue tasks (nice!)

---

## 🎯 Active Projects

**Currently working on 2 efforts:**
- Life OS Implementation: Set up foundation infrastructure
- Q1 Planning: Prepare for 2pm planning session

---

## 💰 Financial Update

**Account Balances:**
- Checking: $3,247.18
- Savings: $12,500.00
- Investments: $45,230.00
- Total Net Worth: $60,977.18

**Recent Transactions:**
- Grocery Store - $87.32
- Gas Station - $45.00

**Budget Status:**
- Week 1 spending: $132.32 / $500 (26%) 🟢

**Market & Portfolio:**
- S&P 500: 4,783 (+0.5% today) 🟢
- Your Portfolio: $45,230 (+$285 today, +0.6%)
- Tech stocks leading today (AAPL, MSFT up)

---

## 🧠 Knowledge & Learning

**Yesterday's Captures:**
- 3 notes created/updated
- Key topics: Compound interest, Index fund investing, Morning routines

**Recent Learning:**
- Active topic: Building sustainable investment portfolio
- Connection spotted: Your notes on habits link to investment discipline

**Knowledge Reminder:**
- You're building knowledge on: Long-term investing strategies
- Related effort: Q1 Financial Planning

---

## 📥 Inbox Status

**Quick Thoughts:** 0 unprocessed items ✨
**Ideas:** 3 raw ideas waiting
**Notes:** 5 seedling notes to develop

---

## 🌱 Growth Check

**Yesterday:** No log available yet
Start your daily check-in habit tonight!

---

## 💡 Recommendation

Light task load today - perfect for focused deep work on Life OS setup. Knock out the budget review first (quick win), then dedicate solid blocks to system building between meetings.

---

**Ready to make today count? ✨**
```

## Context Files to Read
- `contexts/current-focus.md`
- `contexts/profile.md`
- `contexts/voice.md`
- `contexts/preferences.md`

## Timing
Ideal execution: 6:00-8:00 AM (adjust to user's wake time)
Can be triggered by automation or manual command

### 6. Using Digital Brain Tools

**Market Snapshot Integration:**
```
If OpenBB MCP is available and market is open:
1. Use get_market_indices() to get S&P 500, Nasdaq, Dow
2. If user has portfolio tracked:
   - Use analyze_portfolio() for today's performance
   - Use get_stock_news() for holdings if significant moves
3. Keep it brief - full snapshot available via market-snapshot skill
4. Focus on: "Do I need to know/do anything?"
```

**Khoj Search Integration:**
```
If Khoj MCP is available:
1. Use khoj_search with query: "notes created yesterday OR updated yesterday"
2. Identify key themes from recent captures
3. Use khoj_chat to ask: "What topics am I actively learning about?"
4. Connect to active efforts: "Find notes related to [effort name]"
5. Highlight knowledge momentum or gaps
```

**Example Khoj Usage:**
```javascript
// Find yesterday's notes
khoj_search({
  query: "notes created:yesterday",
  limit: 10
})

// Understand learning themes
khoj_chat({
  question: "What topics have I been researching this week?",
  context: "Based on my recent notes and searches"
})

// Connect to efforts
khoj_search({
  query: "notes related to [active effort topic]",
  limit: 3
})
```

**Financial Intelligence Integration:**
```
If both Finance MCP and OpenBB MCP available:
1. Get balances from Firefly III (Finance MCP)
2. Get portfolio value from OpenBB (if tracked)
3. Calculate total net worth
4. If portfolio moved >2%: Brief explanation why
5. If budget concerns: Highlight in recommendation section
```

**Adaptive Content:**
- If market is closed (weekend/holiday): Skip market section
- If no notes created recently: Skip knowledge section or make it aspirational
- If no portfolio tracked: Just show market indices without personal context
- If Khoj not set up: Use Notion data only for knowledge section

### 7. Integration Examples

**Full Integration Example:**

```markdown
## 💰 Financial Update

[From Finance MCP: get_accounts + get_balances]
**Account Balances:**
- Checking: $3,247.18
- Savings: $12,500.00

[From OpenBB MCP: analyze_portfolio if holdings tracked]
- Investments: $45,230.00

[Calculate]
- Total Net Worth: $60,977.18

[From Finance MCP: get_transactions with limit=5, since=yesterday]
**Recent Transactions:**
- Grocery Store - $87.32
- Gas Station - $45.00

[From Finance MCP: get_budgets with current week]
**Budget Status:**
- Week 1 spending: $132.32 / $500 (26%) 🟢

[From OpenBB MCP: get_market_indices]
**Market & Portfolio:**
- S&P 500: 4,783 (+0.5% today) 🟢

[From OpenBB MCP: analyze_portfolio]
- Your Portfolio: $45,230 (+$285 today, +0.6%)

[If move >2%, use get_stock_news to explain]
- Tech stocks leading today (AAPL, MSFT up on AI news)

---

## 🧠 Knowledge & Learning

[From Khoj MCP: khoj_search({query: "notes created:yesterday", limit: 10})]
**Yesterday's Captures:**
- 3 notes created/updated
- Key topics: Compound interest, Index fund investing, Morning routines

[From Khoj MCP: khoj_chat({question: "What am I learning about?"})]
**Recent Learning:**
- Active topic: Building sustainable investment portfolio
- Connection spotted: Your notes on habits link to investment discipline

[From Khoj MCP: khoj_search({query: "notes created this week"})]
**Knowledge Reminder:**
- You're building knowledge on: Long-term investing strategies
- Related effort: Q1 Financial Planning
```

**Graceful Degradation:**

If services unavailable, adapt:

```markdown
## 💰 Financial Update

[If Finance MCP unavailable]
**Account Balances:** Not available (Finance MCP offline)
Quick check: Log into Firefly III at http://localhost:8080

[If OpenBB MCP unavailable but Finance works]
**Market & Portfolio:** Not available (OpenBB MCP offline)
Check markets at: finance.yahoo.com

[If both unavailable]
**Financial Update:** Services offline
- Check manually: Firefly III + Yahoo Finance
- Everything should be back soon!
```

### 8. Performance Optimization

**Keep It Fast:**
- Parallel API calls when possible (Finance + OpenBB + Khoj simultaneously)
- Cache market data (don't fetch every 5 minutes, once per morning is enough)
- Limit Khoj searches (max 3 searches per briefing)
- Set timeouts (if service doesn't respond in 3 seconds, skip it)

**Prioritization:**
1. Core briefing (calendar, tasks, efforts) - always include
2. Financial data - include if <1 second to fetch
3. Market data - include if market open and <2 seconds to fetch
4. Knowledge insights - include if Khoj responds <3 seconds
5. Skip sections that timeout (better fast briefing than slow one)

## Advanced Features

### Morning Intelligence Loop

**Workflow:**
```
1. Daily Briefing (this skill) - Overview
2. If market interesting → market-snapshot skill - Details
3. If learning momentum → khoj-search skill - Deep dive
4. If portfolio needs attention → investment-advisor skill - Analysis
```

**Trigger Points:**
- Market moved >2%: Suggest "Want full market snapshot?"
- New notes on active effort: "Want to see connections?"
- Portfolio question in briefing: "Need portfolio review?"

### Weekly First-Day Enhancement

**Monday Briefings Include:**
- Week ahead preview
- Last week's progress summary
- Weekly goals from current-focus.md
- Weekend knowledge captures (if any)

**Implementation:**
```javascript
if (dayOfWeek === 'Monday') {
  // Add week preview
  weekAheadPreview = getCalendarEvents({daysAhead: 7})
  
  // Last week summary
  lastWeekProgress = summarizeWeek({weeksAgo: 1})
  
  // Knowledge from weekend
  weekendNotes = khoj_search({query: "notes created:saturday OR created:sunday"})
}
```

