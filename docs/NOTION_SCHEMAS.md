# Notion Database Schemas

Complete database structures for Life OS. Create these in your Notion workspace.

---

## Atlas (Knowledge) Databases

### 1. 💡 Notes Database

**Purpose:** Atomic units of knowledge - one idea per note.

| Property | Type | Configuration |
|----------|------|---------------|
| Name | Title | Note title |
| Type | Select | Options: `Concept`, `Question`, `Claim`, `Framework`, `Definition` |
| Status | Select | Options: `🌱 Seedling`, `🌿 Growing`, `🌲 Evergreen` |
| Maps | Relation | → Maps database (allow multiple) |
| Related Notes | Relation | → Notes database (allow multiple) |
| Sources | Relation | → Sources database (allow multiple) |
| Efforts | Relation | → Efforts database (allow multiple) |
| Tags | Multi-select | User-defined tags |
| Summary | Text | One-line essence (max 280 chars) |
| Created | Created time | Auto |
| Last Edited | Last edited time | Auto |

**Page Content:** Full note text with rich formatting, images, embeds, etc.

---

### 2. 📍 Maps Database

**Purpose:** Maps of Content - gather related ideas.

| Property | Type | Configuration |
|----------|------|---------------|
| Name | Title | Map title |
| Type | Select | Options: `Topic`, `Project`, `Question`, `Area` |
| Notes | Relation | → Notes database (allow multiple) |
| Child Maps | Relation | → Maps database (allow multiple) |
| Parent Map | Relation | → Maps database (single) |
| Status | Select | Options: `Active`, `Archive` |
| Description | Text | What this map covers |
| Created | Created time | Auto |
| Last Updated | Last edited time | Auto |

**Page Content:** Index of related notes with optional commentary.

---

### 3. 📚 Sources Database

**Purpose:** External inputs - books, articles, videos, podcasts.

| Property | Type | Configuration |
|----------|------|---------------|
| Name | Title | Source title |
| Type | Select | Options: `Book`, `Article`, `Video`, `Podcast`, `Paper`, `Course` |
| Author | Text | Creator name |
| URL | URL | Link to source |
| Status | Select | Options: `To Read`, `Reading`, `Finished`, `Abandoned` |
| Rating | Select | Options: `⭐`, `⭐⭐`, `⭐⭐⭐`, `⭐⭐⭐⭐`, `⭐⭐⭐⭐⭐` |
| Notes | Relation | → Notes database (allow multiple) |
| Key Takeaways | Text | Main insights (bullet points) |
| Date Added | Date | When captured |
| Date Finished | Date | When completed |
| Tags | Multi-select | Categories |

---

### 4. 👥 People Database

**Purpose:** Personal CRM - relationships and contacts.

| Property | Type | Configuration |
|----------|------|---------------|
| Name | Title | Person's name |
| Relationship | Select | Options: `Friend`, `Colleague`, `Mentor`, `Client`, `Family`, `Acquaintance` |
| Company | Text | Where they work |
| Email | Email | Contact email |
| Phone | Phone number | Contact phone |
| Last Contact | Date | When you last connected |
| Next Follow-up | Date | When to reach out |
| Notes | Relation | → Notes database (allow multiple) |
| Meetings | Relation | → Daily Logs database (allow multiple) |
| Birthday | Date | For reminders |
| Tags | Multi-select | Categories (e.g., Cardiology, Tech, Local) |
| Context | Text | How you met, shared interests |

---

## Calendar (Time) Databases

### 5. 📆 Daily Logs Database

**Purpose:** Daily notes - morning briefings, journal entries, check-ins.

| Property | Type | Configuration |
|----------|------|---------------|
| Date | Title | Format: YYYY-MM-DD (e.g., 2026-01-01) |
| Day Type | Select | Options: `Work`, `Weekend`, `Holiday`, `Travel`, `Sick` |
| Energy | Select | Options: `🔋 High`, `🔋 Medium`, `🔋 Low` |
| Mood | Select | Options: `😄 Great`, `🙂 Good`, `😐 Okay`, `😔 Rough` |
| Wins | Text | What went well |
| Challenges | Text | What was hard |
| Gratitude | Text | What you're grateful for |
| Tomorrow Focus | Text | Priority for next day |
| Notes Created | Relation | → Notes database (allow multiple) |
| Tasks Completed | Relation | → Tasks database (allow multiple) |
| Weather | Select | Options: `☀️ Sunny`, `☁️ Cloudy`, `🌧️ Rainy`, `❄️ Snowy` |
| Exercise | Checkbox | Did you move? |
| Sleep Hours | Number | Hours slept |

**Page Content:** Full daily journal entry, meeting notes, etc.

---

### 6. 📋 Weekly Reviews Database

**Purpose:** Weekly synthesis and planning.

| Property | Type | Configuration |
|----------|------|---------------|
| Week | Title | Format: "Week of YYYY-MM-DD" |
| Daily Logs | Relation | → Daily Logs database (allow multiple) |
| Avg Energy | Rollup | From Daily Logs → Energy (average) |
| Avg Mood | Rollup | From Daily Logs → Mood (average) |
| Week Rating | Select | Options: `🌟 Excellent`, `✅ Good`, `😐 Okay`, `⚠️ Tough` |
| Top Wins | Text | Best things this week |
| Main Challenge | Text | Biggest obstacle |
| Lessons Learned | Text | What you figured out |
| Next Week Focus | Text | Priority for next week |
| Tasks Completed | Rollup | From Daily Logs → Tasks Completed (count) |
| Notes Created | Rollup | From Daily Logs → Notes Created (count) |

**Page Content:** Full weekly review with reflection and planning.

---

## Efforts (Action) Databases

### 7. 🎯 Efforts Database

**Purpose:** Projects and initiatives - organized by energy state.

| Property | Type | Configuration |
|----------|------|---------------|
| Name | Title | Project name |
| Status | Select | Options: `🔥 Active`, `🔜 Simmering`, `💤 Sleeping`, `✅ Done` |
| Area | Select | Options: `Work`, `Health`, `Relationships`, `Learning`, `Creative`, `Admin`, `Money` |
| Notes | Relation | → Notes database (allow multiple) |
| Tasks | Relation | → Tasks database (allow multiple) |
| People | Relation | → People database (allow multiple) |
| Start Date | Date | When started |
| Target Date | Date | Deadline/goal |
| Outcome | Text | What success looks like |
| Next Action | Text | Very next step |
| Progress | Select | Options: `Not Started`, `25%`, `50%`, `75%`, `Almost Done` |
| Tags | Multi-select | Categories |

**Page Content:** Full project plan, notes, progress updates.

---

### 8. ✅ Tasks Database

**Purpose:** Action items with due dates.

| Property | Type | Configuration |
|----------|------|---------------|
| Task | Title | What to do |
| Status | Select | Options: `To Do`, `In Progress`, `Done`, `Cancelled` |
| Priority | Select | Options: `🔴 High`, `🟡 Medium`, `🟢 Low` |
| Due Date | Date | When it's due |
| Effort | Relation | → Efforts database (single) |
| Context | Select | Options: `@Computer`, `@Phone`, `@Errands`, `@Home`, `@Anywhere` |
| Time Estimate | Select | Options: `5 min`, `15 min`, `30 min`, `1 hr`, `2+ hr` |
| Completed Date | Date | When finished |
| Daily Log | Relation | → Daily Logs database (single) |
| Area | Select | Options: `Work`, `Health`, `Relationships`, `Learning`, `Creative`, `Admin`, `Money` |

---

## Capture (Inbox) Databases

### 9. 💭 Quick Thoughts Database

**Purpose:** Unprocessed brain dumps - inbox for ideas.

| Property | Type | Configuration |
|----------|------|---------------|
| Thought | Title | The raw capture |
| Captured | Created time | When captured (auto) |
| Processed | Checkbox | Has it been filed? |
| Route To | Select | Options: `Note`, `Task`, `Idea`, `Effort`, `People`, `Delete` |
| Effort | Relation | → Efforts database (single, if project-related) |
| Notes | Text | Additional context |

---

### 10. 💡 Ideas Database

**Purpose:** Content ideas, business ideas, things to explore.

| Property | Type | Configuration |
|----------|------|---------------|
| Idea | Title | The concept |
| Type | Select | Options: `Content`, `Business`, `Project`, `Feature`, `Experiment` |
| Status | Select | Options: `Raw`, `Developing`, `Ready`, `Executed`, `Killed` |
| Platform | Multi-select | Options: `YouTube`, `Newsletter`, `Twitter`, `Blog`, `Podcast` |
| Notes | Text | Details and development |
| Research Needed | Checkbox | Needs more work? |
| Effort | Relation | → Efforts database (single, related project) |
| Sources | Relation | → Sources database (allow multiple, inspiration) |
| Created | Created time | Auto |
| Tags | Multi-select | Categories |

---

## System (Infrastructure)

### 11. LLM Context Page

**Purpose:** Store context files for Claude to read.

**Structure:**
```
📄 LLM Context (page)
├── 📄 profile (sub-page)
├── 📄 current-focus (sub-page)
├── 📄 voice (sub-page)
├── 📄 workflows (sub-page)
├── 📄 preferences (sub-page)
├── 📄 people-context (sub-page)
└── 📄 efforts-context (sub-page)
```

Copy content from `/contexts/` directory markdown files.

---

### 12. Metrics Dashboard (Optional)

**Purpose:** Visualizations and KPIs.

Create a page with:
- Linked views of key databases
- Charts showing trends (energy, mood, tasks completed)
- Financial summaries (if integrated)
- Goal progress trackers

---

## Views to Create

### Recommended Database Views

**Notes Database:**
- All Notes (Table - default)
- Seedlings (Filtered: Status = 🌱)
- Evergreens (Filtered: Status = 🌲)
- By Topic (Gallery grouped by Tags)
- Recent (Table sorted by Last Edited desc)

**Tasks Database:**
- All Tasks (Table - default)
- Today (Filtered: Due Date = Today, Status ≠ Done)
- This Week (Filtered: Due Date = This Week)
- By Context (Board grouped by Context)
- By Priority (Board grouped by Priority)
- Overdue (Filtered: Due Date < Today, Status ≠ Done)

**Efforts Database:**
- Active (Filtered: Status = 🔥 Active)
- Simmering (Filtered: Status = 🔜 Simmering)
- All (Table - default)
- By Area (Board grouped by Area)
- By Status (Board grouped by Status)

**Quick Thoughts:**
- Unprocessed (Filtered: Processed = false) ← Use this daily!
- All (Table - default)

---

## Setup Checklist

- [ ] Create all 10 databases
- [ ] Add all properties with correct types
- [ ] Set up relations between databases
- [ ] Create recommended views
- [ ] Create LLM Context page structure
- [ ] Copy context file content to Notion
- [ ] Create Notion integration
- [ ] Share all databases with integration
- [ ] Test MCP connection from Claude Desktop

---

**Time Estimate:** 2-3 hours to create all databases and views.

**Pro Tip:** Create one database completely, then duplicate and modify for similar structures to save time.

---

## System Databases

### 11. 🎯 Decisions Database

**Purpose:** Track major decisions, learn from outcomes, improve decision quality.

| Property | Type | Configuration |
|----------|------|---------------|
| Name | Title | Decision title |
| Category | Select | Options: `Career`, `Financial`, `Life`, `Business` |
| Status | Select | Options: `🤔 Considering`, `✅ Decided`, `📊 In Progress`, `🎓 Reviewed` |
| Decision Date | Date | When you decided |
| Confidence | Number | 1-10 scale |
| Stakes | Select | Options: `Low`, `Medium`, `High` |
| Reversible | Checkbox | Can you undo this? |
| Related Notes | Relation | → Notes database |
| Related Efforts | Relation | → Efforts database |
| Review Date | Date | When to review outcome |
| Outcome Score | Number | 1-10 (after review) |
| Process Quality | Select | Options: `Good`, `Mixed`, `Poor` |
| Tags | Multi-select | User-defined |
| Created | Created time | Auto |
| Last Edited | Last edited time | Auto |

**Page Content:**

```markdown
## Context
[What led to this decision?]
[Timeline and stakes]

## Options Considered
### Option 1: [Name]
**Pros:**
- [Pro 1]
- [Pro 2]

**Cons:**
- [Con 1]
- [Con 2]

**Score:** X/10

### Option 2: [Name]
[Same structure]

## Criteria
1. [Criterion 1] (weight: X/10)
2. [Criterion 2] (weight: X/10)

## Decision Made
**Choice:** [What you chose]

**Reasoning:**
1. [Key reason 1]
2. [Key reason 2]

**Confidence:** X/10

**Expected Outcome:**
[What you predict]

## Review (Added Later)
**Actual Outcome:**
[What happened]

**What You Got Right:**
- [Accurate prediction]

**What You Got Wrong:**
- [Surprise]

**Key Learning:**
[Lesson from this decision]

**Would You Decide the Same Again?**
[Yes/No and why]
```

**Views:**
- `All Decisions` - Default view
- `Pending Review` - Filter: Review Date ≤ Today, Status = In Progress
- `Career Decisions` - Filter: Category = Career
- `Financial Decisions` - Filter: Category = Financial  
- `High Stakes` - Filter: Stakes = High
- `Decision Quality` - Group by: Process Quality, Outcome Score

**Use With:**
- decision-tracker skill
- weekly-review skill (reflect on decisions made)
- life-analytics skill (decision patterns)

---
