# Khoj Search Skill

Semantic search across your entire Life OS knowledge base using Khoj AI.

## Usage

**Search:**
```
"Search my knowledge: habit formation"
"What have I written about investing?"
"Find all mentions of productivity"
```

**Chat:**
```
"Ask my knowledge: What are my investment principles?"
"Based on my notes, what works for building habits?"
```

**Research:**
```
"Research using my knowledge: best investment strategies"
"Deep dive: productivity systems I've learned about"
```

## Instructions

You have access to Khoj AI via MCP tools. Use semantic search to find relevant knowledge.

### 1. Understanding the Request

**Search Queries:**
- User wants to find specific information
- Keywords: "search", "find", "what have I written", "mentions of"
- Use: `khoj_search` tool

**Knowledge Questions:**
- User asks a question that requires synthesis
- Keywords: "what do I know about", "based on my notes", "my thoughts on"
- Use: `khoj_chat` tool

**Deep Research:**
- User wants comprehensive analysis
- Keywords: "research", "deep dive", "everything about"
- Use: `khoj_research` tool

### 2. Search (khoj_search)

**When to use:**
- Finding specific notes, journal entries, documents
- Locating information across knowledge base
- Quick lookups

**Example:**
```
User: "Find my notes about compound interest"

Use khoj_search:
- query: "compound interest"
- limit: 5

Returns:
- Relevant notes
- Journal entries mentioning it
- Related documents
```

### 3. Chat (khoj_chat)

**When to use:**
- Answering questions using personal knowledge
- Synthesizing information from multiple sources
- Understanding your own thinking

**Example:**
```
User: "What are my principles for habit formation?"

Use khoj_chat:
- question: "What are my principles for habit formation?"
- context: "Based on notes, journal entries, and weekly reviews"

Returns:
- Synthesized answer from YOUR writing
- Key principles you've documented
- Examples from your life
```

### 4. Research (khoj_research)

**When to use:**
- Comprehensive topic exploration
- Combining personal knowledge + web knowledge
- Learning new topics in context of what you know

**Example:**
```
User: "Research index fund investing using what I know"

Use khoj_research:
- topic: "index fund investing"
- focus: "how it fits my investment philosophy"

Returns:
- What you already know (from your notes)
- Additional research from web
- Combined comprehensive answer
```

### 5. Output Format

```
# 🔍 Khoj Search Results

**Query:** [What you searched for]

---

## Your Knowledge

[Results from your notes, journals, documents]

### Result 1: [Title/Source]

[Content snippet]

**Source:** [File path or database]
**Relevance:** [High/Medium]

### Result 2: [Title/Source]

[Content snippet]

---

## Insights

[If using chat/research, provide synthesis]

**Key Points:**
- [Point from your knowledge]
- [Point from your knowledge]
- [Additional research if applicable]

**Related Notes:**
- [[Note 1]] - [Why relevant]
- [[Note 2]] - [Why relevant]

---

**Search powered by Khoj AI**
```

### 6. Integration with Life OS

**Link to Notes:**
When search finds notes, link them properly:
```
"Found in your note: [[Compound Interest Acceleration]]"
"Related: [[Investment Philosophy]], [[Index Fund Strategy]]"
```

**Suggest Next Actions:**
```
Based on search:
- "You haven't written about X yet - want to capture thoughts?"
- "This connects to your active effort: [Project Name]"
- "This supports decision you're making about [Topic]"
```

**Learn Patterns:**
```
"You've written about habits 15 times - this is a key interest"
"Investing notes cluster around index funds and long-term holding"
"Your energy peaks when you write about [topic]"
```

### 7. Search Tips

**Be specific:**
- ❌ "search productivity"
- ✅ "search my notes about morning routines and productivity"

**Use natural language:**
- ❌ "keyword: habit AND formation"
- ✅ "what have I learned about forming new habits?"

**Combine with context:**
- ❌ "investing"
- ✅ "my investment strategy for retirement"

### 8. Common Use Cases

**Morning Briefing:**
```
"Search my notes: what am I working on this week?"
→ Finds relevant project notes, goals, priorities
```

**Decision Making:**
```
"What do I know about career transitions?"
→ Finds past thoughts, decisions, lessons learned
```

**Learning Consolidation:**
```
"What have I learned about personal finance?"
→ Synthesizes all notes, articles, insights
```

**Weekly Review:**
```
"Show me notes created this week"
→ Lists new knowledge captured
```

**Idea Development:**
```
"Find related ideas to: [new idea]"
→ Discovers connections you've already made
```

**Research:**
```
"Research sustainable investing based on my values"
→ Uses your stated values + external research
```

### 9. Error Handling

**No results:**
```
"No existing notes found about [topic]

This might be new territory for you!

Would you like to:
- Capture initial thoughts now?
- Research and create first note?
- Add to learning backlog?"
```

**Server not running:**
```
"Khoj server not accessible.

Start it with:
  ~/life_OS/scripts/integrations/start-khoj.sh

Or search manually at: http://localhost:42110"
```

### 10. Advanced Features

**Temporal Search:**
```
"What was I thinking about in January?"
"Notes created after I read [book]"
```

**Cross-Reference:**
```
"Find connections between productivity and energy management"
→ Discovers links you've made across topics
```

**Learning Progress:**
```
"Show evolution of my thinking on [topic]"
→ Chronological view of notes on subject
```

## Context Files to Read

- Search results may reference:
  - Notes database (Notion)
  - Daily Logs (journals)
  - Weekly Reviews (reflections)
  - Context files (profile, goals, etc.)
  - Documents (PDFs, articles)

## Examples

### Example 1: Quick Search

```
User: "Find my notes about morning routines"
Assistant uses khoj_search:
- query: "morning routines"
- limit: 5

Response:
# 🔍 Khoj Search Results

**Query:** morning routines

---

## Your Knowledge

### Result 1: Morning Routine Optimization

**Content:**
"I've discovered that my ideal morning routine is:
1. Wake at 6am (no snooze)
2. 10 min meditation
3. Coffee + 30 min reading
4. Exercise (run or gym)
5. Cold shower
6. Protein breakfast

The key is doing them in ORDER. If I skip meditation, the whole day feels off."

**Source:** ~/life_OS/exports/notion/notes/morning-routine-optimization.md
**Relevance:** 0.95

---

### Result 2: Daily Log - Jan 5, 2026

**Content:**
"Morning routine: 100% complete. Energy level: High.
Discovered that doing exercise AFTER reading (not before) works better for me.
Body is warmed up from coffee, mind is calm from reading."

**Source:** ~/life_OS/exports/notion/daily-logs/2026-01-05.md
**Relevance:** 0.87

---

## Insights

**Key Points:**
- You have a clearly defined 6-step morning routine
- Order matters - meditation → reading → exercise → shower → breakfast
- Completion correlates strongly with high energy days
- Recent optimization: Exercise after reading (not before)

**Related Notes:**
- [[Morning Routine Optimization]]
- [[Habit Stacking]]
- [[Energy Management]]

---

**Search powered by Khoj AI**
```

---

### Example 2: Knowledge Chat

```
User: "What do I believe about building wealth?"

Assistant uses khoj_chat:
- question: "What do I believe about building wealth?"
- context: "Based on all my notes, journal entries, and financial documents"

Response:
# Question: What do I believe about building wealth?

**Context:** Based on all my notes, journal entries, and financial documents

## Answer

Based on your writing, here are your core beliefs about building wealth:

**1. Time in market > Timing the market**
You've written repeatedly that "consistency beats perfection" and emphasized that your strategy is "boring but proven": invest in index funds monthly, regardless of market conditions.

**2. Wealth = Financial freedom, not luxury**
From your values document: "Wealth means I can choose how I spend my time. It's not about fancy cars or big houses—it's about buying back my mornings."

**3. The formula is simple (but not easy)**
Your notes show: Earn → Save 30%+ → Invest in index funds → Don't touch → Compound. You've written "The path is boring. That's why it works. Excitement in investing usually means losses."

**4. Debt is the enemy**
Multiple entries emphasize: "Every dollar of debt is a dollar working AGAINST me. Every dollar invested is working FOR me." You prioritize debt payoff before aggressive investing.

**5. Increase income, not lifestyle**
Your career notes state: "When I get a raise, I raise my savings rate, not my rent. This is how wealth compounds."

**6. Automate everything**
You believe willpower fails, systems succeed: "Auto-transfer to investment account on payday. If I don't see it, I don't spend it."

**Sources:** 
- Your Investment Philosophy note
- Weekly Reviews from Q4 2025
- Daily logs about financial decisions
- Book notes on "The Simple Path to Wealth"
```

---

### Example 3: Deep Research

```
User: "Research: How should I think about real estate investing based on what I know?"

Assistant uses khoj_research:
- topic: "real estate investing"
- focus: "how it fits my current financial philosophy and goals"

Response:
# Research: Real estate investing

**Focus:** how it fits my current financial philosophy and goals

## From Your Knowledge

**Current Financial Philosophy:**
- You're focused on index fund investing (low maintenance, passive)
- You value time freedom over maximizing returns
- You want "boring but proven" strategies
- Target: FIRE in 12 years (age 45)

**Current Assets:**
- $85K in index funds (growing monthly)
- $15K emergency fund
- No debt
- Saving $2,500/month

**Real Estate Notes:**
- You've written skeptically: "Real estate sounds great until you factor in: maintenance, tenants, time, leverage risk, concentration risk"
- 2024 journal: "Talked to neighbor about his rental property. He spends 10 hrs/month managing it. That's the opposite of passive income."

## External Research

**Real Estate Investment Trusts (REITs):**
- Publicly traded REITs give real estate exposure without property management
- Average returns: 8-12% annually (comparable to stock market)
- More liquid than physical property
- Dividend income (though taxed as ordinary income)

**Direct Property Investment:**
- Potential returns: 8-15% with leverage
- Requires: Down payment ($50-100K+), active management, concentration risk
- Time intensive: 5-20 hrs/month for landlording
- Leverage magnifies both gains AND losses

**House Hacking:**
- Live in multi-unit, rent others
- FHA loan: 3.5% down
- Tenants help pay mortgage
- More aligned with your philosophy (lower risk, learn while living there)

## Analysis

**Conflicts with Your Philosophy:**
❌ Physical real estate requires active management (you want passive)
❌ Concentration risk (you prefer diversification via index funds)
❌ Illiquid (can't sell quickly if needed)
❌ Leverage risk (debt, which you avoid)
❌ Time intensive (you value freedom)

**Potential Alignment:**
✅ REITs fit your strategy (passive, diversified, liquid)
✅ House hacking could work (live there, learn, limited downside)
✅ Real estate provides inflation hedge
✅ Diversification beyond stocks/bonds

## Recommendation

**Based on your stated values and current path:**

**Short-term (Next 2 years):**
- Continue index fund focus (it's working: $2.5K/month = $60K+ invested in 2 years)
- Add 5-10% REIT allocation for diversification
- REITs to consider: VNQ (Vanguard Real Estate ETF) - aligns with your low-cost index philosophy

**Medium-term (Years 3-5):**
- Reevaluate once index portfolio hits $200K+
- If interested in property, consider house hacking (buy duplex, live in one unit)
- Pros: Learn real estate with limited risk, build equity while renting
- Cons: Less housing flexibility, tenant management

**Not Recommended:**
- ❌ Buying rental properties now (conflicts with time freedom value)
- ❌ House flipping (active income, high risk)
- ❌ Highly leveraged investments (conflicts with debt avoidance)

**Your Financial Philosophy Quote:**
"Wealth means choosing how I spend my time."

**Bottom Line:**
Physical real estate investing doesn't align with your current philosophy (passive, time-freedom focused). REITs give you real estate exposure without the headaches. Stay the course with index funds + add REITs for diversification. Real estate can wait—or never happen. Your path is working.

---

**Research powered by Khoj AI (Your Knowledge + Web)**
```

---

### Example 4: Integration with Daily Briefing

The Khoj search skill can be integrated into other Life OS skills:

```markdown
# In daily-briefing.md:

## Context Gathering

Before creating briefing:
1. Use khoj_search to find: "notes created yesterday OR updated yesterday"
2. Use khoj_search to find: "active efforts OR current priorities"
3. Pull today's calendar, tasks, habits (as normal)

This ensures briefing includes:
- "You recently captured thoughts on [topic]" (from yesterday's notes)
- "This connects to your effort: [Effort Name]" (semantic connection, not just tags)
```

### Example 5: Error Handling

```
User: "Find my notes about blockchain"

Assistant uses khoj_search:
- query: "blockchain"
- limit: 5

Response: No results found

---

No existing notes found about blockchain.

This might be new territory for you!

Would you like to:
- **Capture initial thoughts now?** (brain-dump skill)
- **Research and create first note?** (I can research blockchain and help you create a foundational note)
- **Add to learning backlog?** (Create a Quick Thought to research later)

Let me know how you'd like to proceed!
```

---

## Tips for Best Results

**1. Keep Khoj Index Updated:**
- Export Notion data regularly: `~/life_OS/scripts/integrations/export-notion.sh`
- Khoj auto-updates every 15 minutes when running
- Or manual refresh: Visit http://localhost:42110/config

**2. Semantic Search Works Best With:**
- Complete thoughts (not fragments)
- Natural language questions
- Context (not just keywords)

**3. Integration Opportunities:**
- Daily briefing: "What did I work on yesterday?"
- Weekly review: "What patterns emerge from this week's logs?"
- Decision making: "What have I learned about [topic]?"
- Effort planning: "Find related notes for [project]"

**4. Privacy:**
- All search happens locally (your machine)
- No data sent to external servers (unless using web research mode)
- Khoj indexes only files you specify in config

---

## Setup

See: `scripts/integrations/setup-khoj.sh`

Quick start:
```bash
cd ~/life_OS
./scripts/integrations/setup-khoj.sh
./scripts/integrations/export-notion.sh  # Export Notion data
./scripts/integrations/start-khoj.sh     # Start Khoj server
```

Access Khoj directly: http://localhost:42110

---

## MCP Integration

The Khoj MCP server provides 3 tools to Claude:

1. **khoj_search** - Semantic search across all files
2. **khoj_chat** - Ask questions, get synthesized answers from your knowledge
3. **khoj_research** - Combine your knowledge with web research

These tools are automatically available when Khoj MCP is configured in Claude Code.

See: `automation/khoj-integration/khoj_mcp.py`
