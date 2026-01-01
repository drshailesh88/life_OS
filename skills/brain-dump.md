# Brain Dump Skill

Process unstructured thoughts, voice transcripts, or brain dumps into organized Notion entries.

## Usage
When the user provides unstructured text (brain dump, voice transcript, random thoughts), this skill:
1. Analyzes the content
2. Extracts actionable items
3. Categorizes into: Tasks, Ideas, Notes, or Questions
4. Creates appropriate Notion entries (if MCP available)
5. Returns a summary of what was captured

## Instructions

You are processing a brain dump. Follow these steps:

### 1. Parse the Input
- Read the unstructured text carefully
- Identify distinct concepts, tasks, ideas, and questions
- Look for: action items, project ideas, knowledge to capture, decisions to make

### 2. Categorize Each Item
Classify each extracted item:
- **Task**: Something actionable with a clear next step (e.g., "call the dentist", "review proposal")
- **Idea**: A concept, project idea, or creative thought (e.g., "blog post about X", "new feature idea")
- **Note**: Knowledge, insight, or information to remember (e.g., "learned that X causes Y")
- **Question**: Something to research or think about (e.g., "why does X happen?")

### 3. Extract Key Details
For each item, identify:
- **Priority**: High, Medium, Low (based on urgency/importance signals)
- **Context**: Which life area? (Work, Health, Relationships, Learning, Creative, Admin, Money)
- **Related effort**: Is this connected to an existing project?
- **Time sensitivity**: Does this have a deadline or time constraint?

### 4. Create Structured Output
Format as:

```
## Brain Dump Processing Results

### Tasks (X items)
1. [Priority] Task description
   - Context: [Area]
   - Due: [if mentioned]
   - Next action: [specific step]

### Ideas (X items)
1. Idea description
   - Type: [Content/Business/Project/Feature]
   - Context: [Area]

### Notes (X items)
1. Note title: Key insight
   - Tags: [relevant tags]
   - Source: [if mentioned]

### Questions (X items)
1. Question to explore
   - Research needed: [Yes/No]
```

### 5. If Notion MCP Available
Create entries in appropriate databases:
- Tasks → Tasks database
- Ideas → Ideas database
- Notes → Notes database (as Seedling status)
- Questions → Notes database (as Question type)

### 6. Suggest Next Steps
Recommend immediate actions like:
- "Start with the high-priority task: [X]"
- "Research needed for: [question]"
- "Consider creating a new Effort for: [idea]"

## Example

**Input:**
```
Need to call dentist about the crown. Also been thinking about starting a newsletter about personal finance tips. Read an interesting article that compound interest really accelerates after year 7. Should I switch to index funds? Need to review the Q4 budget before Friday.
```

**Output:**
```
## Brain Dump Processing Results

### Tasks (2 items)
1. [High] Call dentist about crown
   - Context: Health
   - Next action: Find dentist number and call during business hours

2. [High] Review Q4 budget
   - Context: Money
   - Due: Before Friday
   - Next action: Open budget spreadsheet and analyze categories

### Ideas (1 item)
1. Start a personal finance newsletter
   - Type: Content
   - Context: Creative, Money
   - Potential topics: Compound interest, index funds, budgeting

### Notes (1 item)
1. Compound Interest Acceleration: Compound interest really accelerates after year 7
   - Tags: Finance, Investing, Learning
   - Source: Article (unspecified)

### Questions (1 item)
1. Should I switch to index funds?
   - Research needed: Yes
   - Related to: Investment strategy, personal finance

---

**Suggested Next Steps:**
1. Call dentist (quick win)
2. Schedule time to review Q4 budget before Friday deadline
3. Research index funds vs current investment approach
4. Develop newsletter idea further when time permits
```

## Context Files to Read
- `contexts/current-focus.md` - Check active projects
- `contexts/preferences.md` - Understand categorization preferences
- `contexts/efforts-context.md` - Match to existing efforts

## Notes
- Be generous in extraction - capture everything that seems relevant
- When in doubt, create it (better to over-capture than miss something)
- Use natural language processing - understand intent, not just keywords
- If voice transcript, account for verbal patterns (um, uh, incomplete sentences)
