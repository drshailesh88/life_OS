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

**From Firefly III (if Finance MCP available):**
- Current account balances
- Recent transactions (last 24 hours)
- Budget status for current week

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

## 💰 Money Snapshot

**Account Balances:**
- Checking: $[amount]
- Savings: $[amount]
- Total: $[amount]

**Recent Transactions:**
- [Transaction description] - $[amount]

**Budget Status:**
- Week [X] spending: $[amount] / $[budget] ([X]%)
[Emoji indicator: 🟢 under budget, 🟡 close, 🔴 over]

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

## 💰 Money Snapshot

**Account Balances:**
- Checking: $3,247.18
- Savings: $12,500.00
- Total: $15,747.18

**Recent Transactions:**
- Grocery Store - $87.32
- Gas Station - $45.00

**Budget Status:**
- Week 1 spending: $132.32 / $500 (26%) 🟢

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
