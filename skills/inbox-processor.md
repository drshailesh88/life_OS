# Inbox Processor Skill

Processes Quick Thoughts from Notion inbox and routes them to appropriate databases.

## Usage
Run this skill to:
- Read unprocessed items from Quick Thoughts database
- Classify each item
- Create proper entries in target databases
- Mark items as processed

## Instructions

You are the inbox processor. Process all unprocessed Quick Thoughts.

### 1. Read from Notion (if MCP available)
Query Quick Thoughts database where `Processed = false`

### 2. For Each Item
Analyze the thought and determine routing:

**Route to Notes** if:
- Contains knowledge, insight, or information to remember
- Is a concept definition or explanation
- Is a learning or observation
- Action: Create in Notes database with appropriate Type (Concept/Question/Claim)

**Route to Tasks** if:
- Has clear actionable verb (call, email, buy, review, etc.)
- Describes something to do
- Has time sensitivity
- Action: Create in Tasks database with priority and context

**Route to Ideas** if:
- Describes a project, feature, or creative concept
- Is aspirational or exploratory
- Starts with "what if" or "maybe we could"
- Action: Create in Ideas database with appropriate type

**Route to Efforts** if:
- Describes a multi-step project
- Is complex enough to require planning
- Has multiple outcomes or deliverables
- Action: Create in Efforts database or suggest linking to existing effort

**Route to People** if:
- Mentions maintaining/building a relationship
- Is context about someone to remember
- Is follow-up about a person
- Action: Create or update in People database

**Delete** if:
- No longer relevant
- Duplicate
- Already handled elsewhere
- Action: Mark processed without creating entry

### 3. Extract Details
When creating entries, extract:
- **Title/Name**: Clear, concise description
- **Context/Area**: Work, Health, Relationships, Learning, Creative, Admin, Money
- **Priority**: High/Medium/Low (for tasks)
- **Tags**: Relevant categorization
- **Due Date**: If mentioned
- **Related Items**: Link to efforts, people, or other notes

### 4. Process and Update
- Create the new entry in target database
- Mark Quick Thought as `Processed = true`
- Set `Route To` field to indicate destination

### 5. Provide Summary
Report:
```
## Inbox Processing Complete

Processed: X items

### Routed to Notes: Y items
- [Note titles...]

### Routed to Tasks: Z items
- [Task descriptions...]

### Routed to Ideas: A items
- [Idea descriptions...]

### Skipped/Deleted: B items
- [Reasons...]

---
All items processed. Inbox is clear!
```

## Context Files to Read
- `contexts/current-focus.md` - Check what's active
- `contexts/workflows.md` - Follow user's processing preferences

## Processing Rules
1. **When in doubt, create it** - Better to capture than lose
2. **Be specific with titles** - Use clear, searchable names
3. **Link generously** - Connect related items
4. **Respect user preferences** - Check context files for categorization style
5. **Batch process** - Handle all items in one session

## Example

**Input from Quick Thoughts:**
```
1. "Remember: coffee shop on Main Street has great wifi"
2. "Call Sarah about collaboration project"
3. "Blog idea: How to build a second brain"
4. "Feeling low energy lately, maybe need more sleep"
```

**Processing:**
```
## Inbox Processing Complete

Processed: 4 items

### Routed to Notes: 1 item
- Coffee Shop Recommendation: Main Street location has great wifi
  - Tags: Places, Work, Productivity
  - Type: Claim

### Routed to Tasks: 1 item
- Call Sarah about collaboration project
  - Priority: Medium
  - Context: Work, Relationships
  - Next action: Find Sarah's number and schedule call

### Routed to Ideas: 1 item
- Blog post: How to build a second brain
  - Type: Content
  - Platform: Blog
  - Status: Raw

### Routed to Notes: 1 item
- Energy Observation: Low energy lately, possibly sleep-related
  - Type: Question
  - Tags: Health, Sleep, Energy
  - Research needed: Track sleep patterns

---
All items processed. Inbox is clear!
```
