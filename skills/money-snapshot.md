# Money Snapshot Skill

Quick financial overview - account balances, recent spending, budget status.

## Usage
Run anytime to get instant financial clarity. Great for:
- Morning briefing (financial component)
- Before making purchase decisions
- Weekly financial check-ins
- Month-end reviews

## Instructions

You are providing a money snapshot. Make it clear, concise, and actionable.

### 1. Gather Financial Data

**From Firefly III (if Finance MCP available):**
- All account balances (checking, savings, credit cards)
- Recent transactions (last 3-7 days)
- Budget status for current period
- Spending by category (this week/month)
- Net worth

**If Finance MCP not available:**
- Inform user to set up Firefly III MCP
- Offer to guide them through setup
- Provide manual snapshot template

### 2. Calculate Key Metrics

**Liquidity:**
- Total cash available (checking + savings)
- Credit utilization (if credit cards tracked)

**Spending Velocity:**
- Daily average this week
- vs. Budget: on track, over, under?
- Trend: spending more or less than usual?

**Budget Health:**
- Categories on track (🟢)
- Categories close to limit (🟡)
- Categories over budget (🔴)

**Net Worth:**
- Total assets
- Total liabilities
- Net worth (assets - liabilities)
- Change from last snapshot (if available)

### 3. Structure the Output

```
# 💰 Money Snapshot - [Date/Time]

## 💵 Accounts

**Checking:** $[amount]
**Savings:** $[amount]
**Credit Card:** -$[amount] (if applicable)

**Total Liquid:** $[amount]

---

## 📊 Recent Activity (Last [X] Days)

**Total Spent:** $[amount]
**Daily Average:** $[amount]

**Top Transactions:**
1. [Date] - [Description]: $[amount]
2. [Date] - [Description]: $[amount]
3. [Date] - [Description]: $[amount]

---

## 🎯 Budget Status

**This Week:** $[spent] / $[budget] ([X]%)
[Visual: ████████░░ 80%]

**This Month:** $[spent] / $[budget] ([X]%)
[Visual: ██████░░░░ 60%]

### By Category

| Category | Spent | Budget | Status |
|----------|-------|--------|--------|
| Groceries | $[X] | $[Y] | 🟢 [%] |
| Dining Out | $[X] | $[Y] | 🟡 [%] |
| Transportation | $[X] | $[Y] | 🟢 [%] |
| Entertainment | $[X] | $[Y] | 🔴 [%] |

🟢 = Under 80% | 🟡 = 80-100% | 🔴 = Over 100%

---

## 🏦 Net Worth

**Assets:** $[amount]
**Liabilities:** -$[amount]
**Net Worth:** $[amount]

[If trend available:]
**Change:** [↑/↓] $[amount] from [last period]

---

## 💡 Insights

[AI-generated observations:]
- [Pattern noticed - e.g., "Dining out spending up 40% vs. last week"]
- [Alert - e.g., "Entertainment budget will be exceeded if spending continues"]
- [Positive trend - e.g., "Savings increased by $500 this week"]
- [Suggestion - e.g., "Consider moving excess checking to savings"]

---

## ⚠️ Alerts

[If any issues:]
- 🔴 **[Category] over budget** - $[X] over limit
- 🟡 **Low balance alert** - Checking below $[threshold]
- 🟡 **Large pending transaction** - $[amount] on [date]

[If all good:]
✅ All budgets on track
✅ Accounts healthy

---

## 🎯 This Week's Financial Goal

[From contexts/current-focus.md or inferred:]
- [e.g., "Stay under $500 weekly budget"]
- [e.g., "Add $200 to emergency fund"]

**Progress:** [Status toward goal]

---

## 📅 Upcoming

[If available from Firefly III recurring transactions:]
- [Date] - [Recurring expense]: $[amount]
- [Date] - [Recurring expense]: $[amount]

---

**Snapshot generated:** [Timestamp]
**Next check recommended:** [Suggestion based on user habits]
```

### 4. Smart Insights

Generate AI-powered observations:

**Spending Patterns:**
- "You spend more on weekends" (if data shows this)
- "Grocery spending consistent at ~$[X]/week"
- "Dining out highest on [day of week]"

**Budget Performance:**
- "On track to finish month $[X] under budget"
- "Warning: [Category] will exceed budget by [date] at current rate"
- "Great month - 8/10 categories under budget"

**Opportunities:**
- "Checking account high - consider moving $[X] to savings"
- "Credit card utilization at [X]% - pay down if possible"
- "[Category] spending decreased 30% - nice work!"

**Anomalies:**
- "Unusual transaction: $[amount] at [merchant]"
- "Spending spike: $[amount] on [date] (normally $[X]/day)"
- "No transactions in 3 days (unusual for you)"

### 5. Context-Aware Adjustments

**Time of Day:**
- Morning: Show day ahead preview
- Evening: Show day wrap-up
- End of week: Include weekly totals
- End of month: Include monthly review

**User Situation:**
- If over budget: Supportive tone, actionable tips
- If under budget: Acknowledge, encourage consistency
- If unusual activity: Highlight without alarm
- If on track: Brief, affirm and move on

**Financial Goals:**
- Reference goals from `contexts/profile.md`
- Track progress toward savings targets
- Celebrate milestones

### 6. Action Recommendations

Based on snapshot, suggest:

**If overspending:**
- "Consider no-spend day today"
- "Review [category] transactions for opportunities to cut"
- "Move [category] from Active spending"

**If underspending:**
- "Opportunity to add extra $[X] to savings goal"
- "Budget cushion available for [planned purchase]"

**If balance anomalies:**
- "Transfer $[X] from checking to savings?"
- "Pay down credit card with checking surplus?"

**If approaching payday:**
- "Payday in [X] days - budget remaining: $[amount]"

## Integration Points

**With Daily Briefing:**
Provide condensed version:
```
## 💰 Money Snapshot

Liquid: $[X] | Spent this week: $[X] ([X]% of budget)
Budget status: [🟢/🟡/🔴]
Alert: [If any]
```

**With Weekly Review:**
Provide full week analysis:
- Week over week trends
- Category breakdowns
- Budget hit rate
- Savings rate

**With Effort Planning:**
If effort has financial implications:
- Budget available: $[amount]
- Suggested allocation: $[X] from [category]

## Context Files to Read
- `contexts/current-focus.md` - Check financial goals
- `contexts/profile.md` - Understand money values/priorities
- `contexts/workflows.md` - Financial check frequency

## Error Handling

**If Finance MCP not connected:**
```
# 💰 Money Snapshot

⚠️ **Finance MCP Not Connected**

To enable money tracking:
1. Install Firefly III: `docker compose up -d`
2. Set up Finance MCP (see: automation/finance-mcp/README.md)
3. Add to Claude Desktop config

**Manual Snapshot Template:**

Current balances:
- Checking: $______
- Savings: $______
- Credit: $______

This week's spending: $______
Budget for week: $______
Status: [On track / Over / Under]

[I can provide insights once Finance MCP is connected]
```

## Example Output

```
# 💰 Money Snapshot - Jan 8, 2026, 9:15 AM

## 💵 Accounts

**Checking:** $3,247.18
**Savings:** $12,500.00
**Credit Card:** -$847.32

**Total Liquid:** $14,899.86

---

## 📊 Recent Activity (Last 3 Days)

**Total Spent:** $132.47
**Daily Average:** $44.16

**Top Transactions:**
1. Jan 7 - Grocery Store: $87.32
2. Jan 6 - Gas Station: $45.15
3. Jan 5 - Coffee Shop: $12.50

---

## 🎯 Budget Status

**This Week:** $132 / $500 (26%) 🟢
[Visual: ██░░░░░░░░ 26%]

**This Month:** $1,247 / $3,500 (36%) 🟢
[Visual: ███░░░░░░░ 36%]

### By Category

| Category | Spent | Budget | Status |
|----------|-------|--------|--------|
| Groceries | $87 | $400 | 🟢 22% |
| Dining Out | $48 | $200 | 🟢 24% |
| Transportation | $45 | $300 | 🟢 15% |
| Shopping | $180 | $300 | 🟡 60% |

---

## 🏦 Net Worth

**Assets:** $15,747.18
**Liabilities:** -$847.32
**Net Worth:** $14,899.86

**Change:** ↑ $487 from last week

---

## 💡 Insights

- Grocery spending on track at $87 (target: ~$100/week)
- Credit card balance up $120 - consider payment before interest hits
- Net worth increased by $487 this week - nice savings momentum!
- Checking balance elevated - opportunity to move $1,000 to high-yield savings?

---

## ⚠️ Alerts

✅ All budgets on track
✅ Accounts healthy

---

## 🎯 This Week's Financial Goal

**Goal:** Stay under $500 weekly budget
**Progress:** $132 spent (26%) - ✅ On track!

---

## 📅 Upcoming

- Jan 15 - Rent: $1,800
- Jan 15 - Internet: $79
- Jan 20 - Gym Membership: $45

---

**Snapshot generated:** Jan 8, 2026, 9:15 AM
**Next check recommended:** End of day (evening check-in)
```
