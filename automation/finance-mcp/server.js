#!/usr/bin/env node

/**
 * Firefly III MCP Server
 * Connects Claude to your Firefly III instance for financial management
 */

import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from '@modelcontextprotocol/sdk/types.js';
import axios from 'axios';

// Configuration from environment variables
const FIREFLY_URL = process.env.FIREFLY_URL || 'http://localhost:8080';
const FIREFLY_TOKEN = process.env.FIREFLY_TOKEN;

if (!FIREFLY_TOKEN) {
  console.error('Error: FIREFLY_TOKEN environment variable is required');
  process.exit(1);
}

// Axios instance with auth
const firefly = axios.create({
  baseURL: `${FIREFLY_URL}/api/v1`,
  headers: {
    'Authorization': `Bearer ${FIREFLY_TOKEN}`,
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
});

// Create MCP server
const server = new Server(
  {
    name: 'firefly-mcp',
    version: '1.0.0',
  },
  {
    capabilities: {
      tools: {},
    },
  }
);

// Tool definitions
const TOOLS = [
  {
    name: 'get_accounts',
    description: 'Get list of all accounts (asset, expense, revenue)',
    inputSchema: {
      type: 'object',
      properties: {
        type: {
          type: 'string',
          description: 'Account type filter (asset, expense, revenue, liabilities)',
          enum: ['asset', 'expense', 'revenue', 'liabilities', 'all'],
        },
      },
    },
  },
  {
    name: 'get_account_balance',
    description: 'Get current balance for specific account(s)',
    inputSchema: {
      type: 'object',
      properties: {
        account_id: {
          type: 'string',
          description: 'Account ID (optional - if not provided, shows all asset accounts)',
        },
      },
    },
  },
  {
    name: 'get_transactions',
    description: 'Get recent transactions',
    inputSchema: {
      type: 'object',
      properties: {
        days: {
          type: 'number',
          description: 'Number of days back to fetch (default: 7)',
          default: 7,
        },
        limit: {
          type: 'number',
          description: 'Maximum number of transactions (default: 50)',
          default: 50,
        },
        type: {
          type: 'string',
          description: 'Transaction type filter',
          enum: ['withdrawal', 'deposit', 'transfer', 'all'],
        },
      },
    },
  },
  {
    name: 'create_transaction',
    description: 'Create a new transaction (expense, income, or transfer)',
    inputSchema: {
      type: 'object',
      properties: {
        type: {
          type: 'string',
          description: 'Transaction type',
          enum: ['withdrawal', 'deposit', 'transfer'],
        },
        amount: {
          type: 'number',
          description: 'Transaction amount',
        },
        description: {
          type: 'string',
          description: 'Transaction description',
        },
        source_account: {
          type: 'string',
          description: 'Source account name or ID',
        },
        destination_account: {
          type: 'string',
          description: 'Destination account name or ID',
        },
        category: {
          type: 'string',
          description: 'Category name (optional)',
        },
        date: {
          type: 'string',
          description: 'Transaction date (YYYY-MM-DD, default: today)',
        },
      },
      required: ['type', 'amount', 'description', 'source_account', 'destination_account'],
    },
  },
  {
    name: 'get_budgets',
    description: 'Get budget status for current period',
    inputSchema: {
      type: 'object',
      properties: {
        month: {
          type: 'string',
          description: 'Month in YYYY-MM format (default: current month)',
        },
      },
    },
  },
  {
    name: 'get_spending_by_category',
    description: 'Get spending breakdown by category',
    inputSchema: {
      type: 'object',
      properties: {
        start_date: {
          type: 'string',
          description: 'Start date (YYYY-MM-DD)',
        },
        end_date: {
          type: 'string',
          description: 'End date (YYYY-MM-DD)',
        },
      },
      required: ['start_date', 'end_date'],
    },
  },
  {
    name: 'get_net_worth',
    description: 'Calculate total net worth (assets - liabilities)',
    inputSchema: {
      type: 'object',
      properties: {},
    },
  },
];

// List tools handler
server.setRequestHandler(ListToolsRequestSchema, async () => {
  return { tools: TOOLS };
});

// Call tool handler
server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args } = request.params;

  try {
    switch (name) {
      case 'get_accounts': {
        const accountType = args.type || 'all';
        const params = accountType !== 'all' ? { type: accountType } : {};
        const response = await firefly.get('/accounts', { params });

        const accounts = response.data.data.map(acc => ({
          id: acc.id,
          name: acc.attributes.name,
          type: acc.attributes.type,
          currency: acc.attributes.currency_code,
          current_balance: acc.attributes.current_balance,
          active: acc.attributes.active,
        }));

        return {
          content: [{
            type: 'text',
            text: JSON.stringify(accounts, null, 2),
          }],
        };
      }

      case 'get_account_balance': {
        if (args.account_id) {
          const response = await firefly.get(`/accounts/${args.account_id}`);
          const acc = response.data.data.attributes;
          return {
            content: [{
              type: 'text',
              text: `Account: ${acc.name}\nBalance: ${acc.current_balance} ${acc.currency_code}`,
            }],
          };
        } else {
          // Get all asset accounts
          const response = await firefly.get('/accounts', { params: { type: 'asset' } });
          const balances = response.data.data.map(acc => ({
            name: acc.attributes.name,
            balance: acc.attributes.current_balance,
            currency: acc.attributes.currency_code,
          }));

          return {
            content: [{
              type: 'text',
              text: JSON.stringify(balances, null, 2),
            }],
          };
        }
      }

      case 'get_transactions': {
        const days = args.days || 7;
        const limit = args.limit || 50;

        const endDate = new Date();
        const startDate = new Date();
        startDate.setDate(startDate.getDate() - days);

        const params = {
          start: startDate.toISOString().split('T')[0],
          end: endDate.toISOString().split('T')[0],
          limit,
        };

        if (args.type && args.type !== 'all') {
          params.type = args.type;
        }

        const response = await firefly.get('/transactions', { params });

        const transactions = response.data.data.map(t => {
          const trans = t.attributes.transactions[0];
          return {
            date: trans.date,
            description: trans.description,
            amount: trans.amount,
            currency: trans.currency_code,
            source: trans.source_name,
            destination: trans.destination_name,
            category: trans.category_name,
            type: trans.type,
          };
        });

        return {
          content: [{
            type: 'text',
            text: JSON.stringify(transactions, null, 2),
          }],
        };
      }

      case 'create_transaction': {
        const today = new Date().toISOString().split('T')[0];
        const transactionData = {
          error_if_duplicate_hash: false,
          apply_rules: true,
          transactions: [{
            type: args.type,
            date: args.date || today,
            amount: args.amount.toString(),
            description: args.description,
            source_name: args.source_account,
            destination_name: args.destination_account,
            category_name: args.category,
          }],
        };

        const response = await firefly.post('/transactions', transactionData);
        const created = response.data.data.attributes.transactions[0];

        return {
          content: [{
            type: 'text',
            text: `Transaction created successfully!\nID: ${response.data.data.id}\nAmount: ${created.amount} ${created.currency_code}\nDescription: ${created.description}`,
          }],
        };
      }

      case 'get_budgets': {
        const month = args.month || new Date().toISOString().slice(0, 7);
        const [year, monthNum] = month.split('-');

        const startDate = `${year}-${monthNum}-01`;
        const endDate = new Date(year, monthNum, 0).toISOString().split('T')[0];

        const response = await firefly.get('/budgets', {
          params: { start: startDate, end: endDate },
        });

        const budgets = response.data.data.map(b => ({
          name: b.attributes.name,
          budgeted: b.attributes.auto_budget_amount || '0',
          spent: b.attributes.spent?.[0]?.sum || '0',
          currency: b.attributes.auto_budget_currency_code,
        }));

        return {
          content: [{
            type: 'text',
            text: JSON.stringify(budgets, null, 2),
          }],
        };
      }

      case 'get_spending_by_category': {
        const params = {
          start: args.start_date,
          end: args.end_date,
        };

        const response = await firefly.get('/transactions', { params });

        // Aggregate by category
        const categoryTotals = {};
        response.data.data.forEach(t => {
          const trans = t.attributes.transactions[0];
          if (trans.type === 'withdrawal') {
            const category = trans.category_name || 'Uncategorized';
            if (!categoryTotals[category]) {
              categoryTotals[category] = 0;
            }
            categoryTotals[category] += parseFloat(trans.amount);
          }
        });

        const sorted = Object.entries(categoryTotals)
          .sort((a, b) => b[1] - a[1])
          .map(([category, amount]) => ({ category, amount: amount.toFixed(2) }));

        return {
          content: [{
            type: 'text',
            text: JSON.stringify(sorted, null, 2),
          }],
        };
      }

      case 'get_net_worth': {
        // Get all asset accounts
        const assetsResp = await firefly.get('/accounts', { params: { type: 'asset' } });
        const totalAssets = assetsResp.data.data.reduce((sum, acc) => {
          return sum + parseFloat(acc.attributes.current_balance);
        }, 0);

        // Get all liability accounts
        const liabResp = await firefly.get('/accounts', { params: { type: 'liabilities' } });
        const totalLiabilities = liabResp.data.data.reduce((sum, acc) => {
          return sum + parseFloat(acc.attributes.current_balance);
        }, 0);

        const netWorth = totalAssets - totalLiabilities;

        return {
          content: [{
            type: 'text',
            text: JSON.stringify({
              assets: totalAssets.toFixed(2),
              liabilities: totalLiabilities.toFixed(2),
              net_worth: netWorth.toFixed(2),
            }, null, 2),
          }],
        };
      }

      default:
        throw new Error(`Unknown tool: ${name}`);
    }
  } catch (error) {
    const errorMessage = error.response?.data?.message || error.message;
    return {
      content: [{
        type: 'text',
        text: `Error: ${errorMessage}`,
      }],
      isError: true,
    };
  }
});

// Start server
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error('Firefly III MCP server running');
}

main().catch((error) => {
  console.error('Server error:', error);
  process.exit(1);
});
