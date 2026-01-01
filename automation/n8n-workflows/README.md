# n8n Workflow Automations

Pre-built n8n workflows for Life OS automation.

## Setup

### 1. Install n8n

**Docker (Recommended):**
```bash
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n
```

Access at: http://localhost:5678

**npm:**
```bash
npm install -g n8n
n8n start
```

### 2. Configure Credentials

In n8n interface (Settings → Credentials):

**Notion API:**
- Credential type: Notion API
- API Key: [Your Notion integration token]

**Claude API:**
- Credential type: Anthropic
- API Key: [Your Anthropic API key]

**SMTP (Optional - for email notifications):**
- Credential type: SMTP
- Host: [Your email provider]
- Port: 587
- User: [Your email]
- Password: [Your password]

### 3. Set Environment Variables

In n8n (Settings → Environments):
```
NOTION_DAILY_LOGS_DB=[Database ID]
NOTION_TASKS_DB=[Database ID]
NOTION_QUICK_THOUGHTS_DB=[Database ID]
FIREFLY_URL=http://localhost:8080
FIREFLY_TOKEN=[Your Firefly token]
```

## Available Workflows

### 1. Daily Briefing Automation

**File:** `daily-briefing-automation.json`

**What it does:**
- Triggers every morning at 8am
- Calls Claude Code with daily-briefing skill
- Creates Daily Log entry in Notion
- Optionally sends email

**Setup:**
1. Import workflow in n8n
2. Configure Claude API credentials
3. Configure Notion credentials
4. Set NOTION_DAILY_LOGS_DB environment variable
5. Adjust schedule if needed (default: 8am)
6. Activate workflow

### 2. Inbox Processor Automation

**File:** `inbox-processor-automation.json`

**What it does:**
- Triggers when new Quick Thought added to Notion
- Processes with inbox-processor skill
- Routes to appropriate databases
- Marks as processed

**Setup:**
1. Import workflow
2. Configure Notion webhook trigger
3. Set up database connections
4. Activate workflow

### 3. Weekly Review Reminder

**File:** `weekly-review-reminder.json`

**What it does:**
- Triggers every Sunday at 6pm
- Sends reminder notification
- Optionally pre-generates review template

**Setup:**
1. Import workflow
2. Configure notification method (email, Slack, etc.)
3. Adjust schedule if needed
4. Activate workflow

### 4. Financial Sync

**File:** `financial-sync.json`

**What it does:**
- Checks for new bank transactions (email, CSV)
- Parses transaction data
- Creates entries in Firefly III
- Updates Notion money dashboard

**Setup:**
1. Import workflow
2. Configure email integration or file watcher
3. Set up Firefly III API credentials
4. Configure parsing rules
5. Activate workflow

### 5. Voice to Notion

**File:** `voice-to-notion.json`

**What it does:**
- Detects new voice transcripts
- Processes with brain-dump skill
- Creates Notion entries
- Sends confirmation

**Setup:**
1. Import workflow
2. Configure file watcher for transcripts folder
3. Set up Claude API
4. Configure Notion databases
5. Activate workflow

## Creating Custom Workflows

### Common Patterns

**Scheduled Automation:**
```
Schedule Trigger → Prepare Data → Claude API → Notion/Action
```

**Event-Driven:**
```
Notion Trigger → Process → Claude API → Create/Update
```

**Data Sync:**
```
External Source → Parse → Transform → Firefly/Notion
```

### Useful Nodes

**Triggers:**
- Schedule: Cron-based timing
- Webhook: HTTP callbacks from external services
- File Trigger: Watch folders for changes
- Email: Monitor inbox for specific emails

**Processing:**
- Function: Custom JavaScript logic
- Set: Transform data structures
- IF: Conditional logic
- Switch: Route based on conditions

**Actions:**
- Notion: Create/update databases
- HTTP Request: Call APIs (Firefly, Claude)
- Email Send: Notifications
- File: Write/read files

## Example: Email to Tasks

Create tasks from emails with specific subject:

**Workflow:**
1. Email Trigger (filter: subject contains "[TASK]")
2. Function: Extract task details
3. Notion: Create in Tasks database
4. Email Send: Confirmation

**Code snippet (Function node):**
```javascript
const subject = $input.item.json.subject.replace('[TASK]', '').trim();
const body = $input.item.json.text;
const from = $input.item.json.from;

// Parse priority from subject
let priority = 'Medium';
if (subject.includes('[HIGH]')) priority = 'High';
if (subject.includes('[LOW]')) priority = 'Low';

return {
  json: {
    task: subject,
    description: body,
    priority: priority,
    source: `Email from ${from}`,
    created: new Date().toISOString()
  }
};
```

## Integration with Claude Code

### Method 1: HTTP API (Future)
When Claude Code API is available:
```javascript
// HTTP Request node
{
  method: 'POST',
  url: 'http://localhost:CLAUDE_CODE_PORT/api/skill',
  body: {
    skill: 'brain-dump',
    input: 'Your text here'
  }
}
```

### Method 2: File-Based
Current approach:
1. n8n writes prompt to file
2. File watcher triggers Claude Code
3. Claude Code processes
4. Results written to file
5. n8n reads results

## Monitoring & Logging

**Enable Execution Logging:**
- Settings → Log output: All
- View executions in n8n interface
- Debug failed workflows

**Notifications on Failure:**
- Add Error Trigger node
- Send alert (email, Slack)
- Include error details

**Metrics to Track:**
- Execution success rate
- Processing time
- Items processed per day
- Failed workflows

## Security Best Practices

1. **API Keys:**
   - Store in n8n credentials (encrypted)
   - Never commit to git
   - Rotate periodically

2. **Webhook URLs:**
   - Use authentication
   - Validate signatures
   - Rate limit if public

3. **Access Control:**
   - Run n8n behind auth (HTTP Basic or OAuth)
   - Use HTTPS in production
   - Restrict network access

## Troubleshooting

**Workflow not triggering:**
- Check workflow is activated
- Verify schedule/trigger configuration
- Review execution logs

**API errors:**
- Validate credentials are correct
- Check API rate limits
- Verify endpoint URLs

**Data not appearing in Notion:**
- Confirm database IDs are correct
- Check database is shared with integration
- Verify property names match

## Resources

- n8n Documentation: https://docs.n8n.io
- Community Workflows: https://n8n.io/workflows
- Notion API Docs: https://developers.notion.com
- Firefly III API: https://api-docs.firefly-iii.org
