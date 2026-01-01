# Portfolio Tracker Skill

Track your investment portfolio, monitor performance, and maintain optimal allocation.

## Usage

**Track Portfolio:**
```
"Track my portfolio"
"Show my holdings"
"Portfolio status"
```

**Add/Remove Holdings:**
```
"I bought 10 shares of AAPL at $195"
"I sold 5 shares of MSFT"
"Add to portfolio: 100 shares VTI"
```

**Rebalancing:**
```
"Should I rebalance my portfolio?"
"Show me my current allocation"
"How far off target am I?"
```

**Performance Tracking:**
```
"Portfolio performance this month"
"How is my portfolio doing?"
"Show gains/losses"
```

## Instructions

You help users maintain a healthy, well-balanced investment portfolio aligned with their goals.

### 1. Portfolio Data Structure

**Store Portfolio in:** Notion database (Portfolio Holdings) or Firefly III

**Each Holding:**
```javascript
{
  symbol: "AAPL",           // Ticker symbol
  shares: 50,               // Number of shares owned
  costBasis: 150.00,        // Average purchase price
  currentPrice: 195.50,     // Current market price
  value: 9775.00,           // shares × currentPrice
  gainLoss: 2275.00,        // value - (shares × costBasis)
  gainLossPercent: 30.33,   // (gainLoss / cost) × 100
  assetClass: "US Stocks",  // Asset classification
  sector: "Technology",      // For stocks
  allocation: 32.5,         // % of total portfolio
  targetAllocation: 10.0,   // Desired %
  drift: 22.5,              // allocation - targetAllocation
  lastUpdated: "2026-01-01"
}
```

### 2. Portfolio View

When user asks "Track my portfolio" or "Show my holdings":

```markdown
# 📊 Portfolio Tracker - [Date]

## Total Portfolio Value: $30,000

**Today's Change:** +$285 (+0.95%)
**Total Gain/Loss:** +$4,250 (+16.5%)
**Cost Basis:** $25,750

---

## Holdings

| Symbol | Shares | Price | Value | Gain/Loss | % of Portfolio |
|--------|--------|-------|-------|-----------|----------------|
| AAPL   | 50     | $195.50 | $9,775 | +$2,275 (+30.3%) | 32.6% |
| MSFT   | 25     | $378.90 | $9,472 | +$1,722 (+22.2%) | 31.6% |
| VTI    | 45     | $245.00 | $11,025 | +$625 (+6.0%) | 36.7% |
| SCHD   | 40     | $80.50 | $3,220 | +$140 (+4.5%) | 10.7% |
| Cash   | —      | —     | $1,508 | —  | 5.0% |

**Total** | — | — | **$30,000** | **+$4,762** | **100%** |

---

## Asset Allocation

**Current vs. Target:**

| Asset Class | Current | Target | Drift |
|-------------|---------|--------|-------|
| US Stocks   | 64.2%   | 60%    | +4.2% ⚠️ |
| Dividend Stocks | 10.7% | 15% | -4.3% ⚠️ |
| International | 0%    | 20%    | -20% ❌ |
| Bonds       | 0%      | 10%    | -10% ⚠️ |
| Cash        | 5.0%    | 5%     | 0% ✅ |

**Assessment:** ⚠️ Portfolio needs rebalancing

---

## Sector Diversification

| Sector | Allocation | Status |
|--------|------------|--------|
| Technology | 64.2% | ❌ Over-concentrated |
| Consumer Discretionary | 10.7% | ✅ Reasonable |
| Broad Market | 36.7% | ✅ Diversified |
| Cash | 5.0% | ✅ Appropriate |

**Issue:** 64% in technology sector (target: <30%)

---

## Performance Metrics

**Returns:**
- Today: +0.95%
- This Week: +2.4%
- This Month: +3.8%
- This Quarter: +12.1%
- This Year: +16.5%

**Comparison to Benchmarks:**
- S&P 500 (YTD): +14.2% → **You're outperforming** ✅
- Nasdaq (YTD): +18.5% → **You're underperforming** ⚠️

**Risk Metrics:**
- Beta: 1.15 (more volatile than market)
- Sharpe Ratio: 1.8 (good risk-adjusted returns)
- Max Drawdown: -12% (largest peak-to-valley drop)

---

## Top Performers

**This Month:**
1. AAPL: +8.2%
2. MSFT: +5.3%
3. VTI: +3.1%

**Worst Performers:**
1. SCHD: +1.2% (lagging but stable)

---

## Rebalancing Recommendations

**Priority Actions:**

**1. SELL:** 35 shares AAPL (trim from 32.6% → 10%)
- Current: $9,775
- Target: $3,000
- Action: Sell ~$6,775 worth (35 shares @ $195.50)

**2. BUY:** VXUS (International exposure)
- Current: $0 (0%)
- Target: $6,000 (20%)
- Action: Buy $6,000 of VXUS

**3. BUY:** BND (Bond allocation)
- Current: $0 (0%)
- Target: $3,000 (10%)
- Action: Buy $3,000 of BND

**4. BUY:** SCHD (increase dividend allocation)
- Current: $3,220 (10.7%)
- Target: $4,500 (15%)
- Action: Buy $1,280 of SCHD

**Tax Considerations:**
- AAPL sale will trigger capital gains (held >1 year = long-term)
- Estimated taxes: ~$455 (20% of $2,275 gain)
- Net proceeds after tax: $6,320

---

## Portfolio Health Score: B- (73/100)

**Strengths ✅:**
- Good total returns (+16.5%)
- Low cash drag (5%)
- Quality holdings (all solid companies/funds)
- Consistent contributions

**Concerns ⚠️:**
- Over-concentrated in tech (64% vs target 30%)
- Missing international exposure (0% vs target 20%)
- No bond allocation (0% vs target 10%)
- Single-stock risk (AAPL at 32%)

**Action Required:**
Rebalance within next 30 days to improve health score to A-.

---

**Next Review:** [30 days from now]
**Last Rebalanced:** [Date if tracked]
```

### 3. Adding Holdings

```markdown
User: "I bought 10 shares of NVDA at $495"

[Use OpenBB: get_stock_quote to get current price]

Adding to portfolio...

# New Holding Added: NVDA

**Purchase Details:**
- Symbol: NVDA
- Shares: 10
- Cost Basis: $495/share
- Total Cost: $4,950

**Current Status:**
- Current Price: $510
- Current Value: $5,100
- Unrealized Gain: +$150 (+3.0%)

**Portfolio Impact:**
- Old Portfolio Value: $30,000
- New Portfolio Value: $34,950
- NVDA Allocation: 14.6% of portfolio

**Sector Impact:**
- Technology: 64.2% → 78.8% ❌ **ALERT: Extreme tech concentration**

---

## Recommendation

⚠️ **Warning:** This purchase increases tech exposure to 78.8%!

**Suggested Actions:**
1. **Consider:** Is this strategic or emotional?
2. **Risk:** Very high concentration in single sector
3. **Alternative:** Could you buy VTI instead for diversification?

**If you proceed:**
- Set strict position limit (NVDA <10% of portfolio)
- Plan to rebalance soon (reduce AAPL + MSFT)
- Accept higher volatility risk

**Better approach might be:**
- Trim existing tech (AAPL, MSFT) first
- Then add NVDA as replacement (not addition)
- Maintains tech exposure, swaps holding

Want to proceed with the purchase or reconsider?
```

### 4. Rebalancing Analysis

```markdown
User: "Should I rebalance my portfolio?"

Let me analyze your current allocation vs. targets.

# Rebalancing Analysis

## Current State

[Use OpenBB: analyze_portfolio + get current prices]

**Total Portfolio:** $30,000

**Asset Allocation:**
- US Stocks: $19,247 (64.2%)
- Dividend Stocks: $3,220 (10.7%)
- International: $0 (0%)
- Bonds: $0 (0%)
- Cash: $1,533 (5.1%)

---

## Target Allocation

[From contexts/profile.md - user's target allocation]

**Your Target** (Age 32, Moderate Risk):
- US Stocks: 60%
- Dividend Stocks: 15%
- International: 20%
- Bonds: 10%
- Cash: 5%

---

## Drift Analysis

| Asset Class | Current | Target | Drift | Status |
|-------------|---------|--------|-------|--------|
| US Stocks   | 64.2%   | 60%    | +4.2% | 🟡 Slight drift |
| Dividend    | 10.7%   | 15%    | -4.3% | 🟡 Slight drift |
| International | 0%    | 20%    | -20%  | 🔴 **Major drift** |
| Bonds       | 0%      | 10%    | -10%  | 🔴 **Major drift** |
| Cash        | 5.1%    | 5%     | +0.1% | 🟢 On target |

**Overall Drift:** 19.3% (threshold: >5% = rebalance recommended)

---

## Rebalancing Needed: ✅ YES

**Urgency:** HIGH (missing 2 asset classes entirely)

**Triggers:**
- ✅ Total drift >5% (you're at 19.3%)
- ✅ Missing asset classes (International, Bonds)
- ❌ Time-based (not yet 12 months since last rebalance)
- ✅ Major life change (new financial goals)

---

## Rebalancing Plan

**Target Portfolio:** $30,000

### Step 1: Sell Overweight Positions

**AAPL (32.6% → 10%):**
- Current: $9,775
- Target: $3,000
- **SELL:** $6,775 (35 shares @ $195.50)

**Result:**
- Cash available: $6,775
- Capital gains tax: ~$455 (sell ~$6,775, gain ~$2,275)
- Net proceeds: $6,320

### Step 2: Buy Underweight Positions

**International (0% → 20%):**
- Target: $6,000
- **BUY:** $6,000 VXUS (Total International Stock ETF)
- Shares: ~150 @ $40

**Bonds (0% → 10%):**
- Target: $3,000
- **BUY:** $3,000 BND (Total Bond Market ETF)
- Shares: ~37 @ $81

**Dividend Stocks (10.7% → 15%):**
- Current: $3,220
- Target: $4,500
- Difference: $1,280
- **BUY:** $1,280 SCHD (Dividend Appreciation ETF)
- Shares: ~16 @ $80

**Total purchases:** $10,280
**Available cash:** $6,320 (from AAPL sale) + $1,533 (existing) = $7,853

**Shortfall:** $2,427

### Step 3: Address Shortfall

**Options:**
1. Trim more AAPL or MSFT (sell additional $2,500)
2. Spread purchases over 2 months ($1,200/month)
3. Use next paycheck contribution ($1,500)
4. Partial rebalance now, complete next month

**Recommended:** Option 4
- Rebalance what you can now
- Complete with next contribution
- Avoids over-trading

---

## Revised Plan (Executable Today)

**Sell:**
- AAPL: 35 shares @ $195 = $6,825 (after tax: ~$6,370)

**Buy:**
- VXUS: $4,500 (15% allocation - partial)
- BND: $2,500 (8.3% allocation - partial)
- SCHD: $1,000 (partial top-up)

**Next Month:**
- Add remaining $1,500 from contribution
- Complete VXUS (15% → 20%)
- Complete BND (8% → 10%)
- Complete SCHD (13% → 15%)

---

## Tax Impact

**Capital Gains:**
- AAPL cost basis: ~$150/share (35 shares = $5,250)
- AAPL sale price: ~$195/share (35 shares = $6,825)
- Gain: $1,575
- Held: >12 months (long-term capital gains)
- Tax: $315 @ 20% rate

**Tax Efficiency:**
- Long-term gains = lower tax rate ✅
- Losses to harvest: None available
- Tax-loss harvesting: Not applicable

---

## New Allocation (After Rebalancing)

| Asset Class | Current | After Rebalance | Target | Status |
|-------------|---------|-----------------|--------|--------|
| US Stocks   | 64.2%   | 48.3%           | 60%    | 🟡 Will complete next month |
| Dividend    | 10.7%   | 14.0%           | 15%    | 🟢 Close |
| International | 0%    | 15.0%           | 20%    | 🟡 Will complete next month |
| Bonds       | 0%      | 8.3%            | 10%    | 🟡 Will complete next month |
| Cash        | 5.1%    | 0.4%            | 5%     | 🟡 Rebuild with income |

**Improvement:** Drift reduced from 19.3% → 8.7%

---

## Execute Rebalance?

**Ready to proceed?**

I can:
1. Generate exact trade orders
2. Calculate precise tax impact
3. Create tracking for follow-up
4. Schedule next rebalance review

Say "Execute rebalance" to proceed or "Show me alternatives" to explore options.
```

### 5. Performance Tracking

```markdown
User: "Portfolio performance this month"

[Use OpenBB: analyze_portfolio + historical data]

# Portfolio Performance - [Month Year]

## Returns

**This Month:**
- Portfolio: +3.8% ($1,095 gain)
- S&P 500: +2.2%
- **Relative: +1.6% outperformance** ✅

**Year-to-Date:**
- Portfolio: +16.5% ($4,250 gain)
- S&P 500: +14.2%
- **Relative: +2.3% outperformance** ✅

**Since Inception** (started tracking [Date]):
- Portfolio: +32.5%
- S&P 500: +28.3%
- **Relative: +4.2% outperformance** ✅

---

## Attribution Analysis

**What drove returns this month?**

**Winners (+):**
1. AAPL: +$425 (stock up 8.2%)
2. MSFT: +$301 (stock up 5.3%)
3. VTI: +$341 (stock up 3.1%)
4. SCHD: +$28 (stock up 1.2%)

**Total gains:** +$1,095

**Losers (-):**
- None this month ✅

**Contribution by Holding:**
- AAPL: +1.4% (of total portfolio)
- MSFT: +1.0%
- VTI: +1.1%
- SCHD: +0.1%
- Cash: +0.2% (interest)

---

## Why You Outperformed

**Factors:**
1. **Tech overweight:** Your 64% tech vs. S&P's 30%
   - Tech sector up 6% this month
   - Your exposure = extra return

2. **Stock selection:** AAPL +8.2% vs. S&P Tech +6%
   - Good picking (or luck?)

3. **Low cash drag:** Only 5% cash vs. typical 10%
   - More money working for you

**Caution:** Outperformance from concentration = extra risk!
- When tech falls, you'll underperform
- Not sustainable long-term strategy
- Consider rebalancing to reduce risk

---

## Monthly Stats

**Volatility:**
- Standard Deviation: 18% annualized
- S&P 500: 15% annualized
- **Your portfolio is 20% more volatile** (due to tech concentration)

**Risk-Adjusted Returns:**
- Sharpe Ratio: 1.8 (returns per unit risk)
- S&P 500 Sharpe: 1.6
- **Slightly better risk-adjusted returns** ✅

**Maximum Drawdown:**
- Portfolio: -12.5% (largest drop from peak)
- S&P 500: -10.2%
- **You experienced 23% larger drawdown** ⚠️

---

## Holdings Performance

**Best Performers (This Month):**
1. AAPL: +8.2%
2. MSFT: +5.3%
3. VTI: +3.1%
4. SCHD: +1.2%

**Worst Performers:**
- None negative this month

**Relative to Benchmarks:**
- AAPL vs. S&P 500: +6.0% better ✅
- MSFT vs. S&P 500: +3.1% better ✅
- VTI vs. S&P 500: +0.9% better (tracking expected) ✅
- SCHD vs. S&P 500: -1.0% worse (dividend lag expected) ✅

---

## Benchmark Comparison

**Your Portfolio vs. Alternatives:**

| Benchmark | 1M | 3M | YTD | 1Y |
|-----------|----|----|-----|-----|
| Your Portfolio | +3.8% | +8.1% | +16.5% | +16.5% |
| S&P 500 (SPY) | +2.2% | +6.5% | +14.2% | +14.2% |
| Nasdaq (QQQ) | +4.5% | +9.2% | +18.5% | +18.5% |
| Total Market (VTI) | +2.0% | +6.2% | +13.8% | +13.8% |
| 60/40 Portfolio | +1.5% | +4.8% | +10.2% | +10.2% |

**Insights:**
- Beating S&P 500 ✅ (but riskier due to concentration)
- Trailing Nasdaq ⚠️ (less tech than pure Nasdaq)
- Crushing 60/40 ✅ (you're 100% stocks)

**Context:** You're taking more risk than S&P 500 (concentrated tech) and being rewarded for it this year. Expect to lag when tech underperforms.

---

## Income Tracking

**Dividends This Month:**
- AAPL: $15 (0.5% yield)
- MSFT: $19 (0.8% yield)
- VTI: $92 (quarterly - $23/month avg)
- SCHD: $27 (3.5% yield)

**Total Dividends:** $153

**Annualized Income:** $1,836/year
**Yield on Cost:** 7.1% (on original investment of $25,750)
**Current Yield:** 6.1% (on current value of $30,000)

**Dividend Growth:**
- vs. Last Year: +12% (companies raising dividends)
- Reinvestment: All dividends auto-reinvested

---

## Next Month Outlook

**Upcoming Events:**
- AAPL earnings: [Date]
- MSFT earnings: [Date]
- Fed meeting: [Date]

**Rebalancing:**
- Planned for next week (reduce AAPL, add VXUS/BND)
- Will reduce risk, may reduce returns

**Contributions:**
- Next investment: $1,500 on [Date]
- Allocation: Per rebalancing plan

---

## Summary

**Great month! (+3.8%)** ✅

**Strengths:**
- All holdings positive
- Outperformed S&P 500
- Good momentum

**Areas to Address:**
- Still over-concentrated in tech
- Need to rebalance (execute plan from last review)
- Consider taking some profits

**Action Items:**
- [ ] Execute rebalancing trades
- [ ] Track AAPL/MSFT earnings
- [ ] Review allocation after rebalance

---

**Keep tracking, keep improving. 📈**
```

### 6. Portfolio Health Check

Run regularly (monthly or quarterly):

```markdown
"Check portfolio health"

# Portfolio Health Check - [Date]

## Overall Score: B+ (82/100)

**Grade Breakdown:**
- Diversification: C (65/100) ⚠️
- Performance: A- (88/100) ✅
- Risk Management: B (80/100) ✅
- Cost Efficiency: A (95/100) ✅
- Tax Efficiency: B+ (85/100) ✅
- Alignment with Goals: A- (87/100) ✅

---

## Detailed Analysis

### Diversification (C, 65/100)

**Issues:**
- ❌ Tech concentration: 64% (target: <30%)
- ❌ Missing international: 0% (target: 20%)
- ❌ Missing bonds: 0% (target: 10%)
- ✅ Number of holdings: 4 stocks + 1 ETF (adequate)

**Fix:** Execute rebalancing plan

---

### Performance (A-, 88/100)

**Strengths:**
- ✅ YTD return: +16.5% (above S&P's +14.2%)
- ✅ Risk-adjusted return: Sharpe 1.8 (good)
- ✅ Consistent outperformance (3 months running)

**Concerns:**
- ⚠️ High volatility (18% vs. market's 15%)
- ⚠️ Concentration risk (performance due to tech)

---

### Risk Management (B, 80/100)

**Strengths:**
- ✅ Quality holdings (no junk)
- ✅ Long-term mindset (not trading)
- ✅ Regular contributions (dollar-cost averaging)

**Concerns:**
- ⚠️ Sector concentration (1 sector = 64%)
- ⚠️ Geographic concentration (100% US)
- ⚠️ Large single positions (AAPL 32%)

---

### Cost Efficiency (A, 95/100)

**Excellent:**
- ✅ Low-cost ETFs (VTI, SCHD expense ratios <0.10%)
- ✅ No mutual fund loads
- ✅ Minimal trading (buy and hold)
- ✅ Commission-free broker

**Avg Expense Ratio:** 0.06% (outstanding)
**Annual Fees:** ~$18 on $30K portfolio

---

### Tax Efficiency (B+, 85/100)

**Good:**
- ✅ Long-term holdings (capital gains favorable)
- ✅ Tax-loss harvesting opportunities identified
- ✅ Strategic about realization of gains

**Could Improve:**
- ⚠️ Dividend income in taxable account (consider Roth)
- ⚠️ No municipal bonds (if in high tax bracket)

---

### Alignment with Goals (A-, 87/100)

[Reference contexts/profile.md]

**Your Goal:** FIRE by age 45 (13 years)

**On Track?** YES ✅
- Current: $30K portfolio
- Need: ~$1M ($40K annual expenses × 25)
- Savings rate: $1,500/month
- Projected: $950K in 13 years @ 10% return

**Gap:** $50K shortfall

**Options to Close Gap:**
1. Increase savings (+$100/month = on track)
2. Boost returns (take more risk = not recommended)
3. Reduce expenses in retirement (-$2K/year = easy)
4. Work 1 extra year (age 46 = $1.1M)

**Recommendation:** Slight increase in savings closes gap

---

## Action Plan

**This Month:**
- [ ] Execute rebalancing (reduce tech, add international/bonds)
- [ ] Review expense ratios on all holdings
- [ ] Consider Roth IRA for dividends

**This Quarter:**
- [ ] Full portfolio review
- [ ] Tax-loss harvesting check
- [ ] Update target allocation if goals changed

**This Year:**
- [ ] Annual rebalance
- [ ] Review investment policy
- [ ] Optimize for taxes

---

**Portfolio is healthy and on track. Address diversification to improve to A-. 📊**
```

## Context Files to Read

- `contexts/profile.md` - Investment goals, risk tolerance, timeline
- `contexts/current-focus.md` - Financial priorities this quarter

## Integration Points

**With investment-advisor:**
- Review decisions together
- Portfolio alignment with strategy

**With market-snapshot:**
- Daily portfolio tracking
- News affecting holdings

**With weekly-review:**
- Weekly performance summary
- Rebalancing reminders

## Tips

**Best Practices:**
1. Review monthly minimum
2. Rebalance when drift >5%
3. Tax-loss harvest in December
4. Don't over-trade
5. Stay disciplined

**Remember:**
- Time in market > timing market
- Costs matter (keep low)
- Diversification is free lunch
- Track to improve

---

**Better portfolio management, better outcomes. 💼📈**
