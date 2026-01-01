# Firefly III MCP Server

MCP server that connects Claude to your Firefly III instance for financial management.

## Installation

```bash
cd automation/finance-mcp
npm install
```

## Configuration

### 1. Get Firefly III Access Token

1. Open Firefly III: http://localhost:8080
2. Go to Options → Profile → OAuth
3. Create new Personal Access Token
4. Copy the token

### 2. Configure Claude Desktop

Add to `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "firefly": {
      "command": "node",
      "args": ["/home/user/life_OS/automation/finance-mcp/server.js"],
      "env": {
        "FIREFLY_URL": "http://localhost:8080",
        "FIREFLY_TOKEN": "your_token_here"
      }
    }
  }
}
```

### 3. Restart Claude Desktop

## Available Tools

### `get_accounts`
Get list of all accounts.
- **Parameters:** `type` (optional): asset, expense, revenue, liabilities, all

### `get_account_balance`
Get current balance for account(s).
- **Parameters:** `account_id` (optional)

### `get_transactions`
Get recent transactions.
- **Parameters:**
  - `days` (default: 7)
  - `limit` (default: 50)
  - `type`: withdrawal, deposit, transfer, all

### `create_transaction`
Create new transaction.
- **Parameters:**
  - `type`: withdrawal, deposit, transfer
  - `amount`: number
  - `description`: string
  - `source_account`: account name or ID
  - `destination_account`: account name or ID
  - `category`: category name (optional)
  - `date`: YYYY-MM-DD (optional, default: today)

### `get_budgets`
Get budget status for current period.
- **Parameters:** `month` (optional): YYYY-MM

### `get_spending_by_category`
Get spending breakdown by category.
- **Parameters:**
  - `start_date`: YYYY-MM-DD
  - `end_date`: YYYY-MM-DD

### `get_net_worth`
Calculate total net worth (assets - liabilities).

## Example Usage

In Claude Desktop:

```
Show me my account balances
```

```
What did I spend on groceries last week?
```

```
Create a transaction: spent $45 on groceries at Whole Foods from my checking account
```

```
What's my net worth?
```

## Troubleshooting

**Connection errors:**
- Verify Firefly III is running: `docker ps`
- Check token is correct
- Ensure FIREFLY_URL is accessible

**Tool not found:**
- Restart Claude Desktop
- Check MCP server logs
- Verify server.js path in config

## API Documentation

Firefly III API: https://api-docs.firefly-iii.org/
