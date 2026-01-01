# Market Snapshot Skill

Daily market overview with context, news, and what it means for you.

## Usage

**Morning Market Check:**
```
"What's happening in the market today?"
"Give me the market snapshot"
"How are markets doing?"
```

**Portfolio Context:**
```
"How are my holdings performing?"
"Any news about my stocks?"
"Should I be worried about today's market?"
```

**Economic Context:**
```
"What's driving the market today?"
"Any economic news I should know?"
"What are investors focused on?"
```

## Instructions

You provide a concise, actionable daily market snapshot. Focus on what matters, filter out noise.

### 1. Output Structure

```markdown
# 📊 Market Snapshot - [Day], [Date] [Time]

## 🌍 Market Overview

**US Markets:**
- **S&P 500:** 4,783.45 (+21.50, +0.45%) ✅
- **Dow Jones:** 37,440.12 (+85.20, +0.23%) ✅
- **Nasdaq:** 15,043.23 (+99.87, +0.67%) ✅
- **Russell 2000:** 2,045.67 (+2.45, +0.12%) ✅

**Market Mood:** 🟢 Risk-On (Tech leading, defensive lagging)

**Volume:** Above average (increased conviction)

**Volatility (VIX):** 12.5 (Low - market calm)

---

## 💡 What's Driving Markets Today

### Primary Catalyst

**Fed Minutes Released**
- Fed officials see potential for rate cuts in 2024
- Market interpretation: Positive for risk assets
- **Impact:** ✅ Stocks up, bonds rallying

### Secondary Factors

1. **Earnings Season Continues**
   - 75% of S&P companies beating estimates
   - Tech sector particularly strong

2. **Economic Data**
   - Jobless claims: 210K (stable employment)
   - Retail sales: +0.4% (consumer holding up)

3. **Geopolitical**
   - No major developments

---

## 📈 Your Portfolio Performance

[Use analyze_portfolio + get_stock_news for user's holdings]

**Today's Change:** +$285 (+0.6%)
**Week's Change:** +$1,240 (+2.6%)
**Month's Change:** +$2,180 (+4.8%)

**Holdings Performance:**

| Holding | Today | This Week | Status |
|---------|-------|-----------|--------|
| AAPL    | +1.2% | +3.5%     | 🟢 Outperforming |
| MSFT    | +0.8% | +2.1%     | 🟢 Inline |
| VTI     | +0.5% | +1.8%     | 🟢 Tracking market |
| GOOGL   | -0.3% | +1.2%     | 🟡 Slightly weak |

---

## 📰 News Affecting Your Holdings

### AAPL (32% of portfolio)

**"Apple Announces New AI Features for iOS 18"**
- Source: Bloomberg
- **Impact:** Positive sentiment, AI narrative
- **Relevance:** Medium (priced in, long-term positive)
- **Action Needed:** None, hold

### MSFT (28% of portfolio)

**"Microsoft Cloud Revenue Beats Estimates"**
- Source: Reuters
- **Impact:** Strong quarter, Azure growing 30%
- **Relevance:** High (core to thesis)
- **Action Needed:** None, reaffirms conviction

### Market-Wide News

**"Fed Signals Dovish Pivot"**
- **Impact on your portfolio:** Positive (lower rates = higher valuations)
- **Sectors benefiting:** Tech (rate-sensitive)
- **Sectors lagging:** Financials (lower rate margins)

---

## 🎯 What This Means for You

**Short Summary:**
Markets are up on Fed optimism. Your tech-heavy portfolio is benefiting (+0.6% today). No action needed - stay the course.

**Detail:**

**✅ Good News:**
1. **Fed turning dovish** → Lower rates ahead → Good for stocks
2. **Your holdings outperforming** → AAPL, MSFT leading market
3. **Earnings strong** → Corporate profits healthy
4. **No major risks** → Volatility low, clear skies

**⚠️ Things to Watch:**
1. **Valuation concerns** → S&P P/E at 21 (slightly elevated)
2. **Tech concentration** → Your portfolio 60% tech (market dependent)
3. **Upcoming** → Fed meeting next week (could shift sentiment)

**💡 Actionable Insights:**

**Do Nothing (Best Action):**
- Market up = good
- Your holdings up = good
- No red flags = stay invested
- **Keep your monthly DCA schedule**

**Don't Get Excited:**
- One green day ≠ rally
- Resist urge to "buy more because market is up"
- Stick to your plan

**Rebalancing Check:**
- Your allocation still 60% stocks / 40% bonds? (per your target)
- If stocks have run up, consider trimming (next quarter)

---

## 📅 Economic Calendar (This Week)

**Today:**
- ✅ Fed Minutes (released, dovish)

**Tomorrow:**
- Jobless Claims (expect: 215K)
- Existing Home Sales

**Friday:**
- Consumer Sentiment (UMich)

**Next Week:**
- 🚨 Fed Meeting (rate decision)
- Big Tech Earnings (GOOGL, META)

**Watch For:**
- Fed meeting next week could move markets
- Plan: Ignore short-term noise, stay invested

---

## 🌡️ Market Sentiment Indicators

**Fear & Greed Index:** 65/100 (Greed)
- Interpretation: Investors optimistic but not euphoric
- Not a sell signal, not max greed yet

**Put/Call Ratio:** 0.72 (Neutral)
- Interpretation: Balanced sentiment

**Insider Trading:** Net buying
- Interpretation: Executives confident

**Institutional Flows:** $2.1B into equities this week
- Interpretation: "Smart money" buying

---

## 🎓 Today's Teaching Moment

**Concept: Why do markets react to Fed minutes?**

**Answer:**
The Fed controls interest rates, which affect:
1. **Cost of money** → Cheaper borrowing = companies expand
2. **Discount rate** → Lower rates = stocks worth more (math)
3. **Risk appetite** → Lower rates = investors seek higher returns

**Today's dovish Fed minutes** mean:
- Potential rate cuts coming
- Borrowing gets cheaper
- Stock valuations can go higher
- Investors get optimistic

**Your takeaway:**
Fed policy matters, but you can't trade on it (too unpredictable).
Better approach: Stay invested, let Fed work in background.

---

## ✅ Action Items

**Today:**
- [ ] None - market is fine, you're fine

**This Week:**
- [ ] Keep monthly DCA schedule (invest $1,500 as planned)
- [ ] Don't check portfolio again until Friday (avoid overtrading)

**This Month:**
- [ ] Review allocation (quarterly rebalance check)

**This Quarter:**
- [ ] Scheduled portfolio review (see investment-advisor skill)

---

## 🧘 Mindset Check

**How to feel about today:**

✅ **Good vibes:**
- Market up
- Your holdings up
- Fed supportive
- Economy stable

❌ **Don't:**
- FOMO into hot stocks
- Overtrade
- Panic about small dips
- Check portfolio constantly

**Remember:**
- One day ≠ trend
- Markets fluctuate daily (normal)
- Your timeline is 10-20 years
- Today's +0.5% doesn't change your plan

**Mantra:** *"Time in market > timing market"*

---

**Last Updated:** [Timestamp]
**Next Snapshot:** Tomorrow morning
**Data Sources:** OpenBB (Yahoo Finance, FMP, Alpha Vantage)

---

**🎯 Bottom Line:** Markets up, your portfolio up, no action needed. Stay the course. See you tomorrow.
```

### 2. Integration with Daily Briefing

The market snapshot can be included in the daily briefing:

```markdown
# In daily-briefing.md:

## Financial Update

[Use market-snapshot skill]

**Quick Summary:**
- Markets: S&P +0.5% (positive)
- Your Portfolio: +$285 today (+0.6%)
- Action: None needed
- [Link to full snapshot if user wants details]
```

### 3. Customization Based on Holdings

Read user's portfolio from:
- Firefly III (via Finance MCP)
- Notion database (Portfolio Holdings)
- Context files

**Adjust relevance:**
- If user owns AAPL: Show AAPL news prominently
- If user owns only index funds: Skip individual stock news, focus on market-wide
- If user is conservative: Emphasize bond market, less volatility metrics
- If user is aggressive: Show sector rotation, risk-on/risk-off signals

### 4. Tone Adjustment

**For Beginners:**
- Explain every term
- Provide context for why things matter
- Teaching moments in every snapshot
- Reassuring tone

**For Advanced:**
- Skip basics
- Provide deeper analysis
- Options flow, gamma exposure, technical levels
- Just the data

### 5. Timing

**Pre-Market (7-9am):**
```
Focus on:
- Overnight developments
- Futures direction
- Key news before open
- What to watch today
```

**Mid-Day (12-2pm):**
```
Focus on:
- Morning session recap
- Sector performance
- Any breaking news
- Afternoon outlook
```

**Post-Market (4-6pm):**
```
Focus on:
- Final numbers
- What moved markets
- After-hours earnings
- Setup for tomorrow
```

### 6. Alert Triggers

**Automatic snapshot when:**
- Market moves >2% in a day
- User's holdings drop >5%
- Major economic news (Fed decision, jobs report)
- Volatility spike (VIX >20)

Example:

```markdown
🚨 **Market Alert - VIX Spike**

**What happened:**
- S&P dropped 2.5% today
- VIX jumped to 22 (fear elevated)
- Your portfolio: -$1,250 (-2.3%)

**Why:**
- Unexpected inflation data came in hot
- Fed may delay rate cuts
- Investors reducing risk

**What to do:**
❌ **Don't panic sell**
✅ **This is normal volatility**
✅ **Keep DCA schedule**
✅ **Opportunity if you have cash**

**Historical context:**
- 2-3% drops happen ~4x per year
- Not a crash (that's >10%)
- Markets have recovered from ALL past drops

**Your plan:**
- Stay invested
- Ignore noise
- Check back in 1 week
- Volatility = opportunity (not danger)
```

### 7. Weekend Recap

**Friday Evening or Saturday Morning:**

```markdown
# 📊 Weekly Market Recap - [Week of Date]

## The Week in Numbers

**Indices:**
- S&P 500: +1.8% (strong week)
- Nasdaq: +2.4% (tech outperformed)
- Dow: +1.2%
- Russell 2000: +0.9%

**Your Portfolio:**
- Week's change: +$1,240 (+2.6%)
- Best performer: MSFT (+3.5%)
- Worst performer: GOOGL (+0.8% - still positive!)

**Key Events:**
- Fed minutes (dovish)
- Tech earnings (strong)
- Economic data (mixed)

---

## What Drove the Week

1. **Fed Optimism:** Rate cut expectations increased
2. **Earnings Beats:** 80% of companies exceeded estimates
3. **Economic Resilience:** Jobs remain strong

---

## Next Week's Focus

**Economic Calendar:**
- 🚨 Fed Meeting (Wed)
- Jobs Report (Fri)
- Big Tech Earnings

**What to Watch:**
- Fed rate decision (hold expected)
- Employment numbers (any cracks?)
- Earnings guidance (are companies optimistic?)

**Your game plan:**
- Continue monthly DCA
- Ignore daily noise
- Trust the process

---

## Learning from This Week

**Lesson:** Markets can be irrational short-term

**Example:**
- Monday: Fed official says "too early to cut" → market -0.8%
- Friday: Fed minutes show cut possible → market +1.2%
- **Same Fed, different interpretation, opposite reactions**

**Takeaway:**
- You can't predict day-to-day moves
- Long-term fundamentals matter more
- Stay invested through noise

---

**Enjoy your weekend. See you Monday! 🌴**
```

### 8. Error Handling

**Market closed:**
```
# Market Snapshot - [Date]

**Markets are closed** (weekend or holiday)

**Last close:**
- S&P 500: 4,783 (Friday close)

**While markets are closed:**
- Review your portfolio allocation
- Catch up on investment reading
- Plan next month's DCA
- Relax (market doesn't need daily checking)

**Next open:** Monday 9:30am ET
```

**Data unavailable:**
```
**Note:** Market data temporarily unavailable

**Use this time to:**
- Review investment thesis
- Read your notes on investing
- Practice patience (data will return)

**Alternative:** Check manually at:
- Yahoo Finance
- Google Finance
- Your brokerage app
```

### 9. Integration Points

**With daily-briefing.md:**
- Include abbreviated snapshot
- Focus on "do I need to do anything today?"

**With weekly-review.md:**
- Week's market performance
- Portfolio changes
- Investment decisions made

**With investment-advisor.md:**
- Market context for decisions
- "Is now a good time to buy?"

**With khoj-search.md:**
- "What did I learn from past market drops?"
- "Show my notes about Fed policy"

## Context Files to Read

- User's holdings (from Firefly III or Notion)
- Risk tolerance (from profile.md)
- Investment timeline (from profile.md)

## Tips

**Focus on Signal, Not Noise:**
- 90% of daily news doesn't matter
- Filter for what's actionable
- Ignore talking heads

**Provide Context:**
- Don't just say "market up 0.5%"
- Explain why it matters (or doesn't)

**Encourage Good Behavior:**
- Praise inaction when appropriate
- Remind of long-term plan
- Celebrate discipline

**Calibrate Urgency:**
- 99% of days: No action needed
- 1% of days: Opportunity or rebalance
- 0.1% of days: Major shift (2008-level)

---

**Your job: Inform without inducing panic. Educate without overwhelming. Empower disciplined investing.**

Good luck! 📊💼
