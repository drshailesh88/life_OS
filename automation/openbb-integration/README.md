# OpenBB Financial Intelligence Integration

Your personal stock market teacher and investment advisor powered by OpenBB Platform.

## What is OpenBB?

OpenBB is an open-source financial data platform providing:

- **Market Data** - Stocks, ETFs, crypto, forex, bonds
- **Fundamental Analysis** - Financial statements, ratios, company profiles
- **Technical Analysis** - Charts, indicators, patterns
- **Economic Data** - GDP, inflation, employment, interest rates
- **News & Sentiment** - Latest financial news and sentiment analysis
- **Portfolio Analytics** - Performance, risk, optimization

## Features

### Real-Time Intelligence

- Live stock quotes and price changes
- Company profiles and business descriptions
- Financial statements (income, balance sheet, cash flow)
- Analyst estimates and price targets
- Dividend history and yields
- Market indices (S&P 500, Nasdaq, Dow)
- Economic indicators

### Educational Tools

- **stock-teacher.md** - Learn investing concepts with real examples
- **investment-advisor.md** - Get investment guidance (coming soon)
- **market-snapshot.md** - Daily market overview (coming soon)

### Portfolio Analysis

- Holdings valuation
- Asset allocation
- Performance tracking
- Risk metrics

## Setup

### Quick Start

```bash
cd ~/life_OS

# 1. Install OpenBB
./scripts/integrations/setup-openbb.sh

# 2. Start MCP server
./scripts/integrations/start-openbb.sh
```

### API Keys (Optional but Recommended)

OpenBB works without API keys using Yahoo Finance, but for better data quality:

**1. Financial Modeling Prep (FMP) - FREE**
- Sign up: https://site.financialmodelingprep.com/developer/docs
- 250 requests/day free
- Provides: Financial statements, analyst estimates

**2. Alpha Vantage - FREE**
- Sign up: https://www.alphavantage.co/support/#api-key
- 500 requests/day free
- Provides: Real-time quotes, technical indicators

**3. FRED (Federal Reserve) - FREE**
- Sign up: https://fred.stlouisfed.org/docs/api/api_key.html
- Unlimited requests
- Provides: Economic indicators

Add keys to `~/.openbb/user_settings.json`

## MCP Tools

The OpenBB MCP server provides 10 tools to Claude:

### 1. get_stock_quote

Get real-time stock price and stats.

**Input:** `{"symbol": "AAPL"}`

**Output:**
```
Price: $195.50
Change: +1.25 (+0.64%)
Volume: 45,234,567
Market Cap: $2.9T
```

### 2. get_company_profile

Get company information and metrics.

**Input:** `{"symbol": "AAPL"}`

**Output:**
```
Name: Apple Inc.
Business: Consumer electronics and software
Sector: Technology
Market Cap: $2.9T
P/E Ratio: 30.5
Dividend Yield: 0.5%
```

### 3. get_financial_statements

Get income, balance sheet, or cash flow statements.

**Input:**
```json
{
  "symbol": "AAPL",
  "statement": "income",
  "period": "annual",
  "limit": 4
}
```

**Output:** Last 4 annual income statements

### 4. get_analyst_estimates

Get analyst ratings and price targets.

**Input:** `{"symbol": "AAPL"}`

**Output:**
```
Target Price: $210
Buy: 25 | Hold: 8 | Sell: 2
Upside: +7.5%
```

### 5. get_stock_news

Get latest news for a stock or general market.

**Input:**
```json
{
  "symbol": "AAPL",
  "limit": 5
}
```

**Output:** Latest 5 news articles with summaries

### 6. get_market_indices

Get major market indices.

**Input:** `{}`

**Output:**
```
S&P 500: 4,783 (+0.45%)
Dow Jones: 37,440 (+0.23%)
Nasdaq: 15,043 (+0.67%)
Russell 2000: 2,045 (+0.12%)
```

### 7. get_economic_indicators

Get economic data (GDP, inflation, etc.).

**Input:** `{"indicator": "gdp"}`

**Output:** Latest GDP data and trends

### 8. get_dividend_history

Get dividend payment history and yield.

**Input:** `{"symbol": "JNJ"}`

**Output:**
```
Last 12 Dividends:
2024-03-01: $1.19
2023-12-01: $1.19
...
Current Yield: 2.98%
```

### 9. compare_stocks

Compare multiple stocks side-by-side.

**Input:**
```json
{
  "symbols": ["AAPL", "MSFT", "GOOGL"]
}
```

**Output:** Comparison table of metrics

### 10. analyze_portfolio

Analyze a portfolio of holdings.

**Input:**
```json
{
  "holdings": [
    {"symbol": "AAPL", "shares": 100},
    {"symbol": "MSFT", "shares": 50}
  ]
}
```

**Output:** Total value, allocation percentages, performance

## Using in Claude Code

### Configure MCP

Add to `~/.config/claude-code/mcp.json`:

```json
{
  "mcpServers": {
    "openbb": {
      "command": "/home/user/.openbb/venv/bin/python3",
      "args": ["/home/user/life_OS/automation/openbb-integration/openbb_mcp.py"]
    }
  }
}
```

Restart Claude Code.

### Use Skills

**Stock Teacher:**
```
"Teach me about dividend investing"
"Explain P/E ratios with real examples"
"Analyze AAPL for me"
```

**Investment Advisor** (coming soon):
```
"Should I invest in tech stocks?"
"Help me build a dividend portfolio"
"Review my current holdings"
```

**Market Snapshot** (coming soon):
```
"What's happening in the market today?"
"Show me sector performance"
"Any economic news I should know?"
```

## Files

```
automation/openbb-integration/
├── README.md              # This file
├── openbb_mcp.py          # MCP server (10 tools)
└── requirements.txt       # Python dependencies

scripts/integrations/
├── setup-openbb.sh        # Install OpenBB
└── start-openbb.sh        # Start MCP server

skills/
├── stock-teacher.md       # Learn investing
├── investment-advisor.md  # Get guidance (coming soon)
└── market-snapshot.md     # Market overview (coming soon)

~/.openbb/
├── venv/                  # Python virtual environment
├── user_settings.json     # API keys and preferences
└── data/                  # Cached financial data
```

## Examples

### Learning Investing

```
You: "Teach me about dividend investing"

Claude: [Uses get_dividend_history + get_company_profile]

# Dividend Investing

## What It Is
Dividend investing is buying stocks that pay you cash regularly...

## Real Example: Johnson & Johnson (JNJ)
[Shows actual dividend history]
- 2024 Q1: $1.19
- 2023 Q4: $1.19
- Annual Dividend: $4.76
- Yield: 2.98%

[Full teaching continues with real data...]
```

### Analyzing Stocks

```
You: "Analyze AAPL for me"

Claude: [Uses get_company_profile + get_stock_quote + get_financial_statements]

# Apple Inc. (AAPL) Analysis

## Current Valuation
Price: $195.50 (+0.64%)
Market Cap: $2.9T
P/E Ratio: 30.5

## Financial Health
Revenue (2023): $383B
Net Income: $97B
Profit Margin: 25%

## Investment Thesis
Strengths: Ecosystem, brand, cash flow
Concerns: Valuation, China risk, iPhone dependence

[Full analysis with recommendations...]
```

### Comparing Investments

```
You: "Compare AAPL vs MSFT"

Claude: [Uses compare_stocks tool]

# Stock Comparison: AAPL vs MSFT

| Metric | AAPL | MSFT |
|--------|------|------|
| Price | $195.50 | $378.91 |
| P/E Ratio | 30.5 | 35.2 |
| Dividend Yield | 0.5% | 0.8% |
| Revenue Growth | -3% | +12% |

[Detailed comparison and insights...]
```

## Architecture

```
┌─────────────────────────────────────────────────┐
│              OpenBB Platform                    │
│  • Yahoo Finance (free)                         │
│  • FMP API (optional)                           │
│  • Alpha Vantage (optional)                     │
│  • FRED (optional)                              │
└────────────────┬────────────────────────────────┘
                 │
                 │ Python API
                 ▼
┌─────────────────────────────────────────────────┐
│         OpenBB MCP Server (openbb_mcp.py)       │
│  10 tools: quotes, profiles, financials, news   │
└────────────────┬────────────────────────────────┘
                 │
                 │ MCP Protocol
                 ▼
┌─────────────────────────────────────────────────┐
│              Claude Code                        │
│  Skills: stock-teacher, investment-advisor      │
└─────────────────────────────────────────────────┘
                 │
                 │ Natural Language
                 ▼
┌─────────────────────────────────────────────────┐
│                   You                           │
│  "Teach me about investing"                     │
└─────────────────────────────────────────────────┘
```

## Troubleshooting

### Import Error: openbb not found

**Solution:**
```bash
source ~/.openbb/venv/bin/activate
pip install openbb
```

### API Rate Limits

**Problem:** Getting rate limit errors

**Solution:**
1. Add API keys (see Setup section)
2. Use caching (OpenBB caches automatically)
3. Limit requests (tools have rate limit handling)

### No Data for Symbol

**Problem:** "No data found for XYZ"

**Causes:**
- Invalid ticker symbol
- Delisted company
- International stock (use correct exchange suffix)

**Solution:**
- Verify symbol on Yahoo Finance
- Use exchange suffix (e.g., "AAPL.L" for London)

### MCP Server Won't Start

**Check:**
1. OpenBB installed: `source ~/.openbb/venv/bin/activate && python3 -c "from openbb import obb; print('OK')"`
2. MCP file exists: `ls ~/life_OS/automation/openbb-integration/openbb_mcp.py`
3. Dependencies: `pip list | grep mcp`

## Privacy & Data

**Local Processing:**
- OpenBB runs on your machine
- No data sent to Life OS servers (there aren't any)

**API Calls:**
- Data fetched from financial APIs (Yahoo, FMP, etc.)
- Cached locally to reduce requests
- No personal data shared (just ticker symbols)

**API Keys:**
- Stored locally: `~/.openbb/user_settings.json`
- Never logged or transmitted
- Encrypt home directory for extra security

## Limitations

**Data Coverage:**
- Free tier: US stocks mainly
- International stocks: Limited
- Real-time data: 15-min delay (free tier)
- Historical data: Varies by provider

**Rate Limits:**
- Yahoo Finance: No official limit (fair use)
- FMP Free: 250 requests/day
- Alpha Vantage Free: 500 requests/day

**Investment Advice:**
- Educational purposes only
- Not financial advice
- Do your own research
- Consult professionals for major decisions

## Resources

- **OpenBB Docs:** https://docs.openbb.co
- **GitHub:** https://github.com/OpenBB-finance/OpenBB
- **Life OS Skill:** `skills/stock-teacher.md`
- **Integration Plan:** `docs/DIGITAL_BRAIN_INTEGRATION.md`

## Next Steps

1. ✅ Setup complete
2. Configure API keys (optional but recommended)
3. Try the stock-teacher skill
4. Learn investing concepts with real data
5. Track your portfolio
6. Build your investment knowledge graph

**Start learning:**
```
"Teach me about investing in index funds"
"Analyze VOO vs VTI"
"What's a good dividend stock for beginners?"
```

Happy investing! 📈💰
