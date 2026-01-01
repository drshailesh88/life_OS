# Note Connector Skill

Intelligently link notes together - discover connections, suggest related content, build knowledge graph.

## Usage
Run on:
- Individual notes (find related content)
- Recent notes (connect new ideas to existing knowledge)
- Entire knowledge base (build comprehensive map)

## Instructions

You are the note connector. Your job is to strengthen the knowledge graph by finding meaningful connections.

### 1. Understand the Note

Read the target note and extract:

**Core Concepts:**
- What is this note about?
- Key ideas, claims, or questions
- Domain/field it belongs to

**Keywords:**
- Explicit terms mentioned
- Implicit concepts referenced
- Technical terminology
- People, places, frameworks

**Context:**
- What problem does this address?
- What question does it answer?
- What broader topic is this part of?

### 2. Find Related Notes

**From Notion (if MCP available):**
Query Notes database for potential matches based on:

**Direct Keyword Matches:**
- Same tags
- Similar titles
- Shared terminology

**Conceptual Connections:**
- Notes that discuss related ideas
- Notes in the same Map of Content
- Notes with opposite viewpoints (contrasts are valuable!)
- Notes that cite the same sources

**Temporal Connections:**
- Notes created around the same time (context clues)
- Notes from the same project/effort

**Hierarchical Connections:**
- Parent concepts (more general)
- Child concepts (more specific)
- Sibling concepts (same level)

### 3. Assess Connection Quality

For each potential connection, evaluate:

**Relevance (1-5):**
- 5: Directly related, essential connection
- 4: Strongly related, valuable to link
- 3: Moderately related, useful context
- 2: Tangentially related, minor value
- 1: Coincidental overlap, skip

**Connection Type:**
- **Supports**: Provides evidence or examples for this note
- **Contradicts**: Offers alternative perspective
- **Extends**: Builds on ideas in this note
- **Prerequisites**: Background knowledge needed
- **Applications**: Where this note's ideas apply
- **Related**: Similar topic, different angle

**Why Connect:**
Articulate the value:
- "This note provides a practical example of [concept]"
- "Contradicts the assumption that [X], offers alternative [Y]"
- "Background reading needed to understand [framework]"

### 4. Suggest Maps of Content

If note doesn't belong to a Map yet, or could belong to additional Maps:

**Identify Relevant Maps:**
- What higher-level topics does this fit under?
- Are there existing Maps it should join?
- Should a new Map be created?

**Map Suggestions:**
```
This note could be added to:
- [Existing Map Name] - [Why it fits]
- [New Map Suggestion] - [What else would be in this map]
```

### 5. Structure the Output

```
# 🔗 Note Connections: [Note Title]

## Summary

**Note:** [Title]
**Core Concept:** [One-line summary]
**Current Status:** [Seedling/Growing/Evergreen]
**Existing Links:** [Count]

---

## 🌟 High-Value Connections (Relevance: 4-5)

### 1. [[Related Note Title]]

**Connection Type:** [Supports/Contradicts/Extends/Prerequisites/Applications/Related]
**Relevance:** ⭐⭐⭐⭐⭐
**Why Connect:** [Clear explanation of the relationship]

**Suggested Link Text:**
Add to current note: "For practical examples, see [[Related Note]]"
Add to related note: "Theoretical foundation in [[This Note]]"

### 2. [[Another Related Note]]

**Connection Type:** [Type]
**Relevance:** ⭐⭐⭐⭐
**Why Connect:** [Explanation]

**Suggested Link Text:**
[How to phrase the bidirectional links]

---

## 💡 Useful Connections (Relevance: 3)

- [[Note 1]] - [Brief explanation]
- [[Note 2]] - [Brief explanation]
- [[Note 3]] - [Brief explanation]

---

## 🗺️ Maps of Content

**Current Maps:**
- [[Map 1]] - [How this note fits]

**Suggested Additions:**
- [[Map 2]] - [Why it belongs here]

**New Map Idea:**
- **"[Map Name]"** - [What this map would gather, other notes that would belong]

---

## 🌱 Knowledge Graph Position

**Parent Concepts (More General):**
- [[Broader Topic]] - This note is a specific instance

**Child Concepts (More Specific):**
- [[Specific Application]] - Detailed example

**Sibling Concepts (Same Level):**
- [[Related Concept 1]] - Similar abstraction level
- [[Related Concept 2]] - Complementary idea

---

## 🔍 Missing Connections

**Questions This Note Raises:**
These suggest notes to create or find:
- [Question 1] - Create note about [topic]
- [Question 2] - Search for existing note on [concept]

**Gaps in Knowledge:**
- [Gap] - Consider researching [area]
- [Gap] - Would benefit from note on [topic]

---

## 📊 Connection Summary

**Total Potential Connections:** [X]
- High-value (4-5): [X]
- Useful (3): [X]
- Already linked: [X]

**Recommended Actions:**
1. [Action - e.g., "Link to [[Note X]]"]
2. [Action - e.g., "Add to [[Map Y]]"]
3. [Action - e.g., "Create new note about [topic]"]

---

## 🎯 Next Steps

**Immediate:**
- [ ] Add high-value links ([count])
- [ ] Update Maps ([which ones])

**Future:**
- [ ] Create note: [Suggested topic]
- [ ] Research: [Gap identified]
- [ ] Develop this note to "Growing" status

---

**Analysis completed:** [Timestamp]
**Ready to add connections?** [Yes/No - if MCP available, can auto-add]
```

### 6. Auto-Link (if approved)

If user approves and MCP available:

**Update Current Note:**
- Add bidirectional links in content
- Add to suggested Maps
- Update "Related Notes" property

**Update Related Notes:**
- Add backlinks
- Update their "Related Notes" property

**Update Maps:**
- Add this note to Maps list

### 7. Pattern Detection

When analyzing multiple notes, identify patterns:

**Clusters:**
- Groups of densely connected notes
- Potential new Maps
- Strong themes in knowledge base

**Isolated Notes:**
- Orphan notes with few connections
- Potential for integration
- May need more development

**Highly Connected Hubs:**
- Notes referenced frequently
- Candidates for "Evergreen" status
- Core concepts in knowledge base

### 8. Smart Suggestions

**Based on Note Type:**

**Concept Notes:**
- Link to definitions
- Link to examples/applications
- Link to contrasting concepts

**Question Notes:**
- Link to answers (if found)
- Link to related questions
- Link to prerequisite knowledge

**Claim Notes:**
- Link to supporting evidence
- Link to counterarguments
- Link to sources

**Framework Notes:**
- Link to applications
- Link to origin/theory
- Link to alternatives

### 9. Context-Aware Connections

**Check User's Current Focus:**
From `contexts/current-focus.md`:
- Prioritize connections to active Efforts
- Surface relevant knowledge for current work
- Suggest timely connections

**Check User's Goals:**
From `contexts/profile.md`:
- Emphasize connections to goal-related notes
- Build knowledge in focus areas
- Support learning objectives

## Advanced Features

### Connection Strength Algorithm

Calculate based on:
- Shared keywords (exact matches)
- Conceptual overlap (semantic similarity)
- Citation relationship (explicit references)
- Temporal proximity (created together)
- Usage together (in same Efforts/Maps)

**Formula:**
```
Strength = (keyword_matches * 3) +
           (conceptual_similarity * 5) +
           (citations * 10) +
           (same_map * 2) +
           (same_effort * 4)
```

### Semantic Search

If using AI embeddings:
- Generate vector embedding for note content
- Find semantically similar notes
- Discover connections beyond keywords

### Incremental Linking

**For New Notes:**
- Automatic connection suggestions when created
- Link immediately while context is fresh

**For Existing Notes:**
- Periodic review of older notes
- Find new connections as knowledge base grows

### Network Visualization

Generate graph data:
```json
{
  "nodes": [
    {"id": "note1", "title": "Note Title", "connections": 5},
    {"id": "note2", "title": "Another Note", "connections": 3}
  ],
  "edges": [
    {"from": "note1", "to": "note2", "strength": 4, "type": "supports"}
  ]
}
```

## Context Files to Read
- `contexts/current-focus.md` - Prioritize relevant connections
- `contexts/profile.md` - Align with learning goals
- `contexts/workflows.md` - Note-taking preferences

## Example Use

**User:** "Find connections for my note about compound interest"

**AI Response:**

```
# 🔗 Note Connections: Compound Interest Acceleration

## Summary

**Note:** Compound Interest Acceleration
**Core Concept:** Investment returns accelerate significantly after year 7 due to compounding
**Current Status:** 🌱 Seedling
**Existing Links:** 0

---

## 🌟 High-Value Connections (Relevance: 4-5)

### 1. [[Index Fund Investment Strategy]]

**Connection Type:** Applications
**Relevance:** ⭐⭐⭐⭐⭐
**Why Connect:** This note directly applies the compound interest concept to index fund investing strategy. Understanding acceleration timeline informs hold period recommendations.

**Suggested Link Text:**
Add to Compound Interest note: "The acceleration effect is why [[Index Fund Investment Strategy]] recommends 10+ year hold periods"
Add to Index Fund note: "Returns accelerate due to [[Compound Interest Acceleration]], especially after year 7"

### 2. [[Time Value of Money]]

**Connection Type:** Prerequisites
**Relevance:** ⭐⭐⭐⭐⭐
**Why Connect:** Foundational concept that explains WHY compound interest works. This note is the mathematical foundation for compound interest.

**Suggested Link Text:**
Add to Compound Interest note: "Based on [[Time Value of Money]] principle"
Add to Time Value note: "Key application: [[Compound Interest Acceleration]]"

### 3. [[Early Retirement Planning]]

**Connection Type:** Applications
**Relevance:** ⭐⭐⭐⭐
**Why Connect:** The 7-year acceleration point directly impacts early retirement timelines and savings strategies.

**Suggested Link Text:**
Add to Compound Interest note: "Critical for [[Early Retirement Planning]] - explains why starting early matters exponentially"

---

## 💡 Useful Connections (Relevance: 3)

- [[Personal Finance Newsletter Ideas]] - Could be a newsletter topic
- [[Investment Mistakes to Avoid]] - Relates to "pulling out too early"
- [[Financial Independence Goals]] - Supports savings timeline planning

---

## 🗺️ Maps of Content

**Current Maps:** None

**Suggested Additions:**
- [[Map: Personal Finance]] - Core investing concept
- [[Map: Money]] - Financial planning topic

**New Map Idea:**
- **"Investing Fundamentals"** - Gather core concepts like this, time value of money, diversification, risk/return, index funds, dollar-cost averaging

---

## 🌱 Knowledge Graph Position

**Parent Concepts (More General):**
- [[Time Value of Money]] - Foundational principle
- [[Investment Returns]] - Broader category

**Child Concepts (More Specific):**
- [[Rule of 72]] - Specific calculation method
- [[Exponential Growth]] - Mathematical pattern

**Sibling Concepts (Same Level):**
- [[Dollar Cost Averaging]] - Another investing strategy
- [[Dividend Reinvestment]] - Related compounding mechanism

---

## 🔍 Missing Connections

**Questions This Note Raises:**
- How does inflation impact compound interest? → Create note
- What about compound interest with regular contributions? → Search existing notes
- Tax implications of long holding periods? → Research needed

**Gaps in Knowledge:**
- Need note on "Rule of 72" (quick doubling time calculation)
- Missing note on "Real vs Nominal Returns"
- Could expand on "Psychology of Long-Term Investing"

---

## 📊 Connection Summary

**Total Potential Connections:** 9
- High-value (4-5): 3
- Useful (3): 3
- Already linked: 0

**Recommended Actions:**
1. Link to [[Index Fund Investment Strategy]] (strongest connection)
2. Link to [[Time Value of Money]] (foundational prerequisite)
3. Add to "Personal Finance" Map
4. Create new note: "Rule of 72"

---

## 🎯 Next Steps

**Immediate:**
- [ ] Add 3 high-value links
- [ ] Add to Personal Finance Map
- [ ] Develop note (add examples, calculations)

**Future:**
- [ ] Create note: Rule of 72
- [ ] Research: Tax implications of holding periods
- [ ] Promote to "Growing" status once developed

---

**Analysis completed:** Jan 8, 2026, 2:15 PM
**Ready to add connections?** Yes - shall I create these links in Notion now?
```

## Tips for Users

**Best Practices:**
- Run on new notes within 24 hours
- Weekly batch processing of recent notes
- Periodic review of older notes (monthly)
- After finishing a source, connect all related notes

**When to Use:**
- After creating several related notes
- When a note feels "isolated"
- Before developing Seedling → Growing
- When planning a new Map of Content

**Red Flags:**
- Note with 0 connections (orphan - needs work)
- Note with 20+ connections (too broad - consider splitting)
- One-way links (add bidirectional)
- Links without context (add why they're connected)
