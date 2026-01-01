#!/usr/bin/env python3
"""
OpenBB MCP Server for Life OS
Provides Claude Code access to financial intelligence via OpenBB Platform
"""

import asyncio
import json
import os
from typing import Any, Dict, List
from datetime import datetime, timedelta

from mcp import Server
from mcp.server.stdio import stdio_server
from mcp.types import Tool, TextContent

# Import OpenBB
try:
    from openbb import obb
    OPENBB_AVAILABLE = True
except ImportError:
    OPENBB_AVAILABLE = False


class OpenBBMCP:
    """MCP server for OpenBB financial intelligence"""

    def __init__(self):
        self.server = Server("openbb-mcp")
        self.setup_handlers()

    def setup_handlers(self):
        """Register MCP handlers"""

        @self.server.list_tools()
        async def list_tools() -> List[Tool]:
            return [
                Tool(
                    name="get_stock_quote",
                    description="Get real-time stock quote (price, change, volume, market cap)",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "symbol": {
                                "type": "string",
                                "description": "Stock ticker symbol (e.g., AAPL, TSLA)"
                            }
                        },
                        "required": ["symbol"]
                    }
                ),
                Tool(
                    name="get_company_profile",
                    description="Get comprehensive company information (business description, sector, employees, fundamentals)",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "symbol": {
                                "type": "string",
                                "description": "Stock ticker symbol"
                            }
                        },
                        "required": ["symbol"]
                    }
                ),
                Tool(
                    name="get_financial_statements",
                    description="Get company financial statements (income statement, balance sheet, cash flow)",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "symbol": {
                                "type": "string",
                                "description": "Stock ticker symbol"
                            },
                            "statement": {
                                "type": "string",
                                "description": "Statement type: income, balance, cashflow",
                                "enum": ["income", "balance", "cashflow"],
                                "default": "income"
                            },
                            "period": {
                                "type": "string",
                                "description": "Annual or quarterly",
                                "enum": ["annual", "quarterly"],
                                "default": "annual"
                            },
                            "limit": {
                                "type": "integer",
                                "description": "Number of periods",
                                "default": 4
                            }
                        },
                        "required": ["symbol"]
                    }
                ),
                Tool(
                    name="get_analyst_estimates",
                    description="Get analyst estimates and price targets",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "symbol": {
                                "type": "string",
                                "description": "Stock ticker symbol"
                            }
                        },
                        "required": ["symbol"]
                    }
                ),
                Tool(
                    name="get_stock_news",
                    description="Get latest news and sentiment for a stock or topic",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "symbol": {
                                "type": "string",
                                "description": "Stock ticker symbol (optional for general news)"
                            },
                            "limit": {
                                "type": "integer",
                                "description": "Number of articles",
                                "default": 5
                            }
                        }
                    }
                ),
                Tool(
                    name="get_market_indices",
                    description="Get major market indices (S&P 500, Dow, Nasdaq, etc.)",
                    inputSchema={
                        "type": "object",
                        "properties": {}
                    }
                ),
                Tool(
                    name="get_economic_indicators",
                    description="Get economic indicators (GDP, inflation, unemployment, interest rates)",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "indicator": {
                                "type": "string",
                                "description": "Indicator type",
                                "enum": ["gdp", "inflation", "unemployment", "fed_rate"],
                                "default": "gdp"
                            }
                        }
                    }
                ),
                Tool(
                    name="get_dividend_history",
                    description="Get dividend history and yield for dividend stocks",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "symbol": {
                                "type": "string",
                                "description": "Stock ticker symbol"
                            }
                        },
                        "required": ["symbol"]
                    }
                ),
                Tool(
                    name="compare_stocks",
                    description="Compare multiple stocks side-by-side (fundamentals, performance, valuation)",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "symbols": {
                                "type": "array",
                                "items": {"type": "string"},
                                "description": "List of stock symbols to compare",
                                "minItems": 2,
                                "maxItems": 5
                            }
                        },
                        "required": ["symbols"]
                    }
                ),
                Tool(
                    name="analyze_portfolio",
                    description="Analyze a portfolio (allocation, performance, risk metrics)",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "holdings": {
                                "type": "array",
                                "items": {
                                    "type": "object",
                                    "properties": {
                                        "symbol": {"type": "string"},
                                        "shares": {"type": "number"}
                                    },
                                    "required": ["symbol", "shares"]
                                },
                                "description": "List of holdings with symbols and shares"
                            }
                        },
                        "required": ["holdings"]
                    }
                ),
            ]

        @self.server.call_tool()
        async def call_tool(name: str, arguments: Dict[str, Any]) -> List[TextContent]:
            if not OPENBB_AVAILABLE:
                return [TextContent(
                    type="text",
                    text="Error: OpenBB not installed. Run: ~/life_OS/scripts/integrations/setup-openbb.sh"
                )]

            if name == "get_stock_quote":
                return await self.get_stock_quote(arguments)
            elif name == "get_company_profile":
                return await self.get_company_profile(arguments)
            elif name == "get_financial_statements":
                return await self.get_financial_statements(arguments)
            elif name == "get_analyst_estimates":
                return await self.get_analyst_estimates(arguments)
            elif name == "get_stock_news":
                return await self.get_stock_news(arguments)
            elif name == "get_market_indices":
                return await self.get_market_indices(arguments)
            elif name == "get_economic_indicators":
                return await self.get_economic_indicators(arguments)
            elif name == "get_dividend_history":
                return await self.get_dividend_history(arguments)
            elif name == "compare_stocks":
                return await self.compare_stocks(arguments)
            elif name == "analyze_portfolio":
                return await self.analyze_portfolio(arguments)
            else:
                raise ValueError(f"Unknown tool: {name}")

    async def get_stock_quote(self, args: Dict[str, Any]) -> List[TextContent]:
        """Get real-time stock quote"""
        symbol = args["symbol"].upper()

        try:
            result = obb.equity.price.quote(symbol)

            if not result or len(result.results) == 0:
                return [TextContent(
                    type="text",
                    text=f"No data found for {symbol}"
                )]

            quote = result.results[0]

            output = f"""# {symbol} - Stock Quote

**Price:** ${quote.price:,.2f}
**Change:** {quote.change:+.2f} ({quote.change_percent:+.2f}%)
**Volume:** {quote.volume:,}
**Market Cap:** ${quote.market_cap:,.0f}

**Day Range:** ${quote.day_low:,.2f} - ${quote.day_high:,.2f}
**52 Week Range:** ${quote.fifty_two_week_low:,.2f} - ${quote.fifty_two_week_high:,.2f}

**Previous Close:** ${quote.prev_close:,.2f}
**Open:** ${quote.open:,.2f}

**Last Updated:** {quote.last_update_utc}
"""

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error fetching quote for {symbol}: {str(e)}"
            )]

    async def get_company_profile(self, args: Dict[str, Any]) -> List[TextContent]:
        """Get company information"""
        symbol = args["symbol"].upper()

        try:
            profile = obb.equity.profile(symbol)

            if not profile or len(profile.results) == 0:
                return [TextContent(type="text", text=f"No profile found for {symbol}")]

            p = profile.results[0]

            output = f"""# {p.name} ({symbol})

## Business

{p.description}

## Key Facts

**Sector:** {p.sector}
**Industry:** {p.industry}
**Employees:** {p.full_time_employees:,}
**Founded:** {p.ipo_date}

**Headquarters:** {p.city}, {p.state}, {p.country}
**Website:** {p.website}
**CEO:** {p.ceo}

## Valuation Metrics

**Market Cap:** ${p.market_cap:,.0f}
**P/E Ratio:** {p.pe_ratio:.2f}
**Forward P/E:** {p.forward_pe:.2f}
**Price to Book:** {p.price_to_book:.2f}
**Price to Sales:** {p.price_to_sales:.2f}

**Dividend Yield:** {p.dividend_yield:.2f}%
**Beta:** {p.beta:.2f}
"""

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error fetching profile for {symbol}: {str(e)}"
            )]

    async def get_financial_statements(self, args: Dict[str, Any]) -> List[TextContent]:
        """Get financial statements"""
        symbol = args["symbol"].upper()
        statement = args.get("statement", "income")
        period = args.get("period", "annual")
        limit = args.get("limit", 4)

        try:
            if statement == "income":
                result = obb.equity.fundamental.income(symbol, period=period, limit=limit)
            elif statement == "balance":
                result = obb.equity.fundamental.balance(symbol, period=period, limit=limit)
            elif statement == "cashflow":
                result = obb.equity.fundamental.cash(symbol, period=period, limit=limit)
            else:
                return [TextContent(type="text", text=f"Invalid statement type: {statement}")]

            if not result or len(result.results) == 0:
                return [TextContent(type="text", text=f"No financial data found for {symbol}")]

            # Format based on statement type
            output = f"# {symbol} - {statement.title()} Statement ({period.title()})\n\n"

            for i, stmt in enumerate(result.results[:limit]):
                output += f"## Period: {stmt.period_ending}\n\n"

                if statement == "income":
                    output += f"**Revenue:** ${stmt.revenue:,.0f}\n"
                    output += f"**Gross Profit:** ${stmt.gross_profit:,.0f}\n"
                    output += f"**Operating Income:** ${stmt.operating_income:,.0f}\n"
                    output += f"**Net Income:** ${stmt.net_income:,.0f}\n"
                    output += f"**EPS:** ${stmt.eps:.2f}\n\n"

                elif statement == "balance":
                    output += f"**Total Assets:** ${stmt.total_assets:,.0f}\n"
                    output += f"**Total Liabilities:** ${stmt.total_liabilities:,.0f}\n"
                    output += f"**Stockholders Equity:** ${stmt.stockholders_equity:,.0f}\n"
                    output += f"**Cash:** ${stmt.cash_and_equivalents:,.0f}\n\n"

                elif statement == "cashflow":
                    output += f"**Operating Cash Flow:** ${stmt.operating_cash_flow:,.0f}\n"
                    output += f"**Investing Cash Flow:** ${stmt.investing_cash_flow:,.0f}\n"
                    output += f"**Financing Cash Flow:** ${stmt.financing_cash_flow:,.0f}\n"
                    output += f"**Free Cash Flow:** ${stmt.free_cash_flow:,.0f}\n\n"

                output += "---\n\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error fetching financials for {symbol}: {str(e)}"
            )]

    async def get_analyst_estimates(self, args: Dict[str, Any]) -> List[TextContent]:
        """Get analyst estimates"""
        symbol = args["symbol"].upper()

        try:
            estimates = obb.equity.estimates.price_target(symbol)

            if not estimates or len(estimates.results) == 0:
                return [TextContent(type="text", text=f"No analyst estimates found for {symbol}")]

            est = estimates.results[0]

            output = f"""# {symbol} - Analyst Estimates

## Price Targets

**Current Price:** ${est.current_price:.2f}

**Target Price:** ${est.target_price:.2f}
**Upside/Downside:** {((est.target_price - est.current_price) / est.current_price * 100):+.1f}%

**High Target:** ${est.target_high:.2f}
**Low Target:** ${est.target_low:.2f}

## Analyst Ratings

**Buy:** {est.rating_buy}
**Hold:** {est.rating_hold}
**Sell:** {est.rating_sell}

**Total Analysts:** {est.rating_buy + est.rating_hold + est.rating_sell}
"""

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error fetching estimates for {symbol}: {str(e)}"
            )]

    async def get_stock_news(self, args: Dict[str, Any]) -> List[TextContent]:
        """Get stock news"""
        symbol = args.get("symbol", "").upper()
        limit = args.get("limit", 5)

        try:
            if symbol:
                news = obb.news(symbols=symbol, limit=limit)
            else:
                news = obb.news(limit=limit)

            if not news or len(news.results) == 0:
                return [TextContent(type="text", text="No news found")]

            output = f"# News{' - ' + symbol if symbol else ''}\n\n"

            for article in news.results[:limit]:
                output += f"## {article.title}\n\n"
                output += f"**Source:** {article.source}\n"
                output += f"**Published:** {article.date}\n\n"
                output += f"{article.text[:200]}...\n\n"
                output += f"[Read more]({article.url})\n\n"
                output += "---\n\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error fetching news: {str(e)}"
            )]

    async def get_market_indices(self, args: Dict[str, Any]) -> List[TextContent]:
        """Get major market indices"""
        try:
            indices = ["SPY", "DIA", "QQQ", "IWM"]  # S&P 500, Dow, Nasdaq, Russell 2000
            output = "# Market Indices\n\n"

            for idx in indices:
                result = obb.equity.price.quote(idx)
                if result and len(result.results) > 0:
                    quote = result.results[0]
                    name = {"SPY": "S&P 500", "DIA": "Dow Jones", "QQQ": "Nasdaq", "IWM": "Russell 2000"}[idx]
                    output += f"**{name}:** ${quote.price:.2f} ({quote.change_percent:+.2f}%)\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error fetching market indices: {str(e)}"
            )]

    async def get_economic_indicators(self, args: Dict[str, Any]) -> List[TextContent]:
        """Get economic indicators"""
        indicator = args.get("indicator", "gdp")

        try:
            # This would use FRED data or similar
            # Placeholder implementation
            output = f"# Economic Indicator: {indicator.upper()}\n\n"
            output += "Note: Full economic indicator integration requires FRED API key\n"
            output += "Configure in: ~/.openbb/user_settings.json\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error fetching economic indicators: {str(e)}"
            )]

    async def get_dividend_history(self, args: Dict[str, Any]) -> List[TextContent]:
        """Get dividend history"""
        symbol = args["symbol"].upper()

        try:
            dividends = obb.equity.fundamental.dividends(symbol)

            if not dividends or len(dividends.results) == 0:
                return [TextContent(type="text", text=f"{symbol} does not pay dividends or no data available")]

            output = f"# {symbol} - Dividend History\n\n"

            for i, div in enumerate(dividends.results[:12]):  # Last 12 dividends
                output += f"**{div.ex_dividend_date}:** ${div.amount:.2f}\n"

            # Calculate yield
            quote = obb.equity.price.quote(symbol)
            if quote and len(quote.results) > 0:
                price = quote.results[0].price
                annual_div = sum([d.amount for d in dividends.results[:4]])  # Last 4 quarters
                yield_pct = (annual_div / price) * 100
                output += f"\n**Current Yield:** {yield_pct:.2f}%\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error fetching dividends for {symbol}: {str(e)}"
            )]

    async def compare_stocks(self, args: Dict[str, Any]) -> List[TextContent]:
        """Compare multiple stocks"""
        symbols = [s.upper() for s in args["symbols"]]

        try:
            output = "# Stock Comparison\n\n"
            output += f"Comparing: {', '.join(symbols)}\n\n"

            # Get quotes for all
            comparison_data = []
            for symbol in symbols:
                quote = obb.equity.price.quote(symbol)
                profile = obb.equity.profile(symbol)

                if quote and profile:
                    comparison_data.append({
                        "symbol": symbol,
                        "quote": quote.results[0],
                        "profile": profile.results[0]
                    })

            # Create comparison table
            output += "| Metric | " + " | ".join(symbols) + " |\n"
            output += "|--------|" + "------|" * len(symbols) + "\n"

            # Price
            output += "| **Price** | " + " | ".join([f"${d['quote'].price:.2f}" for d in comparison_data]) + " |\n"

            # Change %
            output += "| **Change %** | " + " | ".join([f"{d['quote'].change_percent:+.2f}%" for d in comparison_data]) + " |\n"

            # Market Cap
            output += "| **Market Cap** | " + " | ".join([f"${d['profile'].market_cap/1e9:.1f}B" for d in comparison_data]) + " |\n"

            # P/E Ratio
            output += "| **P/E Ratio** | " + " | ".join([f"{d['profile'].pe_ratio:.1f}" for d in comparison_data]) + " |\n"

            # Dividend Yield
            output += "| **Dividend Yield** | " + " | ".join([f"{d['profile'].dividend_yield:.2f}%" for d in comparison_data]) + " |\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error comparing stocks: {str(e)}"
            )]

    async def analyze_portfolio(self, args: Dict[str, Any]) -> List[TextContent]:
        """Analyze portfolio"""
        holdings = args["holdings"]

        try:
            output = "# Portfolio Analysis\n\n"

            total_value = 0
            holding_values = []

            for holding in holdings:
                symbol = holding["symbol"].upper()
                shares = holding["shares"]

                quote = obb.equity.price.quote(symbol)
                if quote and len(quote.results) > 0:
                    price = quote.results[0].price
                    value = price * shares
                    total_value += value
                    holding_values.append({
                        "symbol": symbol,
                        "shares": shares,
                        "price": price,
                        "value": value
                    })

            # Show holdings
            output += "## Holdings\n\n"
            for h in holding_values:
                allocation = (h["value"] / total_value) * 100
                output += f"**{h['symbol']}:** {h['shares']:.2f} shares @ ${h['price']:.2f} = ${h['value']:,.2f} ({allocation:.1f}%)\n"

            output += f"\n**Total Portfolio Value:** ${total_value:,.2f}\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error analyzing portfolio: {str(e)}"
            )]


async def main():
    """Run the MCP server"""
    openbb_mcp = OpenBBMCP()

    async with stdio_server() as (read_stream, write_stream):
        await openbb_mcp.server.run(
            read_stream,
            write_stream,
            openbb_mcp.server.create_initialization_options()
        )


if __name__ == "__main__":
    asyncio.run(main())
