# Effort Planner Skill

Plan new projects (Efforts) with AI assistance - break down complex goals into actionable steps.

## Usage
When starting a new project or initiative:
- User describes what they want to accomplish
- AI helps scope, plan, and structure it as an Effort
- Creates Effort + initial Tasks in Notion

## Instructions

You are helping plan a new Effort (project). Guide the user through structured planning.

### 1. Understand the Effort

Ask clarifying questions (if not already clear):

**Outcome:**
- What does success look like?
- How will you know it's done?
- What's the deliverable or end state?

**Motivation:**
- Why is this important now?
- How does it align with your goals?
- What happens if you don't do this?

**Scope:**
- What's included?
- What's explicitly NOT included?
- What are the boundaries?

**Constraints:**
- Time: Deadline or target completion?
- Money: Budget or cost constraints?
- Resources: What/who do you need?
- Dependencies: What needs to happen first?

### 2. Classify the Effort

**Life Area:**
Determine which area this belongs to:
- Work, Health, Relationships, Learning, Creative, Admin, Money

**Complexity:**
- Simple (1-3 tasks, < 1 week)
- Moderate (4-10 tasks, 1-4 weeks)
- Complex (10+ tasks, 1-3 months)
- Major (20+ tasks, 3+ months)

**Energy State:**
Where should it start?
- 🔥 **Active**: Starting immediately, high priority
- 🔜 **Simmering**: Planning now, executing later
- 💤 **Sleeping**: Capturing for future (not now)

### 3. Break Down into Tasks

For the Effort, identify:

**Phases (if complex):**
1. Phase name → Tasks
2. Phase name → Tasks
3. Phase name → Tasks

**Tasks (actionable steps):**
For each task, specify:
- Clear action verb (Create, Review, Contact, Build, etc.)
- Specific outcome
- Estimated time (5min, 15min, 30min, 1hr, 2+hr)
- Context (@Computer, @Phone, @Errands, @Home)
- Priority (High, Medium, Low)
- Dependencies (what must happen first)

**First Action:**
What's the VERY NEXT concrete step?
- Should be small and immediately actionable
- No dependencies
- Can be done soon

### 4. Identify Resources Needed

**People:**
- Who can help?
- Who needs to be involved?
- Who has expertise to consult?

**Knowledge:**
- What do you need to learn?
- Research required?
- Skills to develop?

**Tools/Systems:**
- What software, tools, or platforms?
- New accounts or setups needed?

**Money:**
- Budget required?
- Expected costs?
- ROI or financial goal?

### 5. Set Timeline

**Target Completion:**
- When do you want this done?
- Hard deadline or soft goal?

**Milestones:**
- Key checkpoints along the way
- Deliverables at each milestone
- Dates for major phases

**Time Allocation:**
- Hours per week to dedicate?
- When will you work on this?
- Conflicts with other efforts?

### 6. Risk Assessment

**Potential Blockers:**
- What could prevent success?
- Dependencies on others?
- Technical challenges?

**Mitigation:**
- How to address risks?
- Backup plans?
- Who to ask for help?

### 7. Success Criteria

**How to measure success:**
- Quantitative: Numbers, metrics
- Qualitative: Feelings, outcomes
- Deliverables: Tangible results

**Done looks like:**
- Specific, concrete description
- Observable and verifiable
- Satisfying to accomplish

### 8. Structured Output

```
# 🎯 Effort Plan: [Effort Name]

## Overview

**Outcome:** [What success looks like]
**Why Now:** [Motivation and timing]
**Life Area:** [Area]
**Complexity:** [Simple/Moderate/Complex/Major]
**Status:** [🔥 Active / 🔜 Simmering / 💤 Sleeping]

---

## Scope

**Included:**
- [What's in scope]
- [What's in scope]

**Excluded:**
- [What's NOT in scope]
- [Boundaries]

---

## Timeline

**Start Date:** [Date]
**Target Completion:** [Date]
**Estimated Duration:** [X weeks/months]

**Milestones:**
1. [Date] - [Milestone name]: [Deliverable]
2. [Date] - [Milestone name]: [Deliverable]
3. [Date] - [Milestone name]: [Deliverable]

---

## Tasks Breakdown

### Phase 1: [Phase Name]

**Goal:** [What this phase accomplishes]

**Tasks:**
1. [ ] [Task description]
   - Time: [Estimate]
   - Context: [@Location/tool]
   - Priority: [High/Medium/Low]

2. [ ] [Task description]
   - Time: [Estimate]
   - Context: [@Context]
   - Priority: [Level]

### Phase 2: [Phase Name]

**Goal:** [What this phase accomplishes]

**Tasks:**
1. [ ] [Task]
2. [ ] [Task]

---

## Resources Needed

**People:**
- [Person/role]: [How they help]
- [Person/role]: [How they help]

**Knowledge/Skills:**
- [What to learn]
- [Resources to consult]

**Tools:**
- [Tool name]: [Purpose]
- [Tool name]: [Purpose]

**Budget:**
- Estimated cost: $[amount]
- Breakdown: [Categories]

---

## Risks & Mitigation

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | High/Med/Low | High/Med/Low | [How to address] |
| [Risk 2] | Level | Level | [Strategy] |

---

## Success Criteria

**Done when:**
- [ ] [Specific criterion]
- [ ] [Specific criterion]
- [ ] [Specific criterion]

**Metrics:**
- [Quantitative measure]: [Target]
- [Quantitative measure]: [Target]

---

## Next Actions

**Immediate (This Week):**
1. [ ] [First action] - [Context] - [Time]
2. [ ] [Second action] - [Context] - [Time]
3. [ ] [Third action] - [Context] - [Time]

**First action:** [The VERY next step]

---

## Links & Context

**Related Efforts:** [If any]
**Related Notes:** [Relevant knowledge]
**Related People:** [Who's involved]

**Context from current-focus.md:**
- [How this fits current priorities]
- [Alignment with goals]

---

## Recommendations

Based on your current workload and priorities:

**Should you start this now?**
- [Analysis of timing]
- [Fit with current Active Efforts]
- [Energy and time availability]

**Suggested status:**
- [🔥 Active / 🔜 Simmering / 💤 Sleeping]
- [Reasoning]

**If starting now:**
- Dedicate [X] hrs/week
- Schedule work blocks: [When]
- Review progress: [Frequency]

**If simmering:**
- Revisit on: [Date]
- Conditions to activate: [Triggers]

---

**Created:** [Timestamp]
**Ready to create in Notion?** [Yes/No]
```

### 9. Create in Notion

If user approves and MCP available:

**Create Effort entry:**
- Name: [Effort name]
- Status: [As recommended]
- Area: [Life area]
- Outcome: [Success description]
- Target Date: [Date]
- Next Action: [First action]
- Progress: Not Started

**Create Tasks:**
- Link all tasks to this Effort
- Set priorities and contexts
- Add time estimates
- Set due dates (if applicable)

**Link Related Items:**
- People involved
- Relevant Notes
- Source materials

### 10. Provide Guidance

After planning:

```
## 🚀 Getting Started

Your Effort "[Name]" is planned and ready!

**First action:** [The very next step]

**This week:** Focus on Phase 1 tasks - aim to complete [X] tasks

**Pro tips:**
- [Specific advice for this effort type]
- [Pattern from user's past successes]
- [Encouragement]

**Check-in schedule:**
- Daily: Update task progress
- Weekly: Review in weekly-review
- [Milestone date]: Assess Phase 1 completion

---

Good luck! 🎯
```

## Context Files to Read
- `contexts/current-focus.md` - Check current workload
- `contexts/profile.md` - Understand goals and values
- `contexts/workflows.md` - Project management preferences

## Smart Features

**Effort Naming:**
- Suggest clear, outcome-focused names
- Format: "[Verb] [Outcome]" (e.g., "Launch Personal Newsletter", "Build Home Gym")

**Task Ordering:**
- Sequence by dependencies
- Group related tasks
- Front-load quick wins

**Reality Check:**
- Compare to user's available time
- Warn if overcommitting
- Suggest phasing if too complex

**Template Matching:**
- Recognize common effort types
- Apply proven patterns (e.g., "Launch" efforts, "Learn" efforts, "Build" efforts)
- Reference user's past successes

## Example Use

**User:** "I want to start a personal finance newsletter"

**AI Response:**

```
# 🎯 Effort Plan: Launch Personal Finance Newsletter

## Overview

**Outcome:** Published newsletter with 100+ subscribers, 4 issues sent, positive reader feedback
**Why Now:** Aligns with Q1 goal to share knowledge, establish expertise, build audience
**Life Area:** Creative, Money
**Complexity:** Complex (12 weeks)
**Status:** 🔥 Active (high alignment with current focus)

---

## Scope

**Included:**
- Newsletter platform setup (Substack/Beehiiv)
- Content strategy (topics, frequency)
- First 4 issues written and published
- Basic promotion (social, network)
- Email list building (organic)

**Excluded:**
- Paid advertising (Phase 2)
- Podcast/video (separate effort)
- Monetization (revisit at 500 subscribers)

---

## Timeline

**Start Date:** Jan 10, 2026
**Target Completion:** Apr 1, 2026 (12 weeks)
**Estimated Duration:** 3 months

**Milestones:**
1. Jan 24 - Platform Live: Account set up, branding done, welcome sequence written
2. Feb 7 - Issue #1 Published: First issue sent to initial subscribers
3. Mar 7 - Consistent Cadence: 4 issues published, routine established
4. Apr 1 - Success Metrics: 100 subscribers, engagement data analyzed

---

## Tasks Breakdown

### Phase 1: Foundation (Week 1-2)

**Goal:** Platform ready to publish

**Tasks:**
1. [ ] Research newsletter platforms (Substack, Beehiiv, ConvertKit)
   - Time: 1 hr
   - Context: @Computer
   - Priority: High

2. [ ] Choose and set up platform account
   - Time: 30 min
   - Context: @Computer
   - Priority: High

3. [ ] Design basic branding (logo, colors, name)
   - Time: 2+ hr
   - Context: @Computer
   - Priority: Medium

4. [ ] Write welcome sequence (3 emails)
   - Time: 2+ hr
   - Context: @Computer
   - Priority: Medium

5. [ ] Configure email settings and automation
   - Time: 30 min
   - Context: @Computer
   - Priority: High

### Phase 2: Content Strategy (Week 2-3)

**Goal:** Clear content plan for first 10 issues

**Tasks:**
1. [ ] Brainstorm 20 topic ideas
   - Time: 1 hr
   - Context: @Anywhere
   - Priority: High

2. [ ] Organize topics into themes/pillars
   - Time: 30 min
   - Context: @Computer
   - Priority: Medium

3. [ ] Create editorial calendar (first 10 issues)
   - Time: 1 hr
   - Context: @Computer
   - Priority: High

4. [ ] Define newsletter format/structure
   - Time: 30 min
   - Context: @Computer
   - Priority: Medium

### Phase 3: Launch (Week 4-12)

**Goal:** Publish consistently, build audience

**Tasks:**
1. [ ] Write and publish Issue #1
   - Time: 2+ hr
   - Context: @Computer
   - Priority: High
   - Due: Feb 7

2. [ ] Promote to personal network (email, social)
   - Time: 30 min
   - Context: @Phone
   - Priority: High

3. [ ] Write and publish Issue #2
   - Time: 2+ hr
   - Context: @Computer
   - Priority: High
   - Due: Feb 14

4. [ ] [Continue weekly publishing tasks...]

---

## Resources Needed

**People:**
- Designer friend: Initial logo/branding help
- 5-10 beta readers: Feedback on first drafts
- Finance experts: Interview subjects/quotes

**Knowledge/Skills:**
- Newsletter best practices (research 3-5 top newsletters)
- Email copywriting basics
- Basic Substack/platform features

**Tools:**
- Newsletter platform: $0-10/mo (Substack free tier to start)
- Design: Canva ($0-13/mo)
- Analytics: Built into platform

**Budget:**
- Platform: $0/mo (Substack free initially)
- Domain (optional): $12/year
- Design tools: $0 (Canva free)
- **Total:** ~$12/year

---

## Risks & Mitigation

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Writer's block / Missed issues | Medium | High | Build 2-issue buffer, brainstorm 20 topics upfront |
| Low subscriber growth | High | Medium | Start with network, cross-promote on social, focus on quality |
| Time commitment unsustainable | Medium | High | Block 4hrs/week for writing, batch content when possible |
| Technical platform issues | Low | Low | Choose established platform (Substack), test before launch |

---

## Success Criteria

**Done when:**
- [ ] 4 issues published on schedule
- [ ] 100+ subscribers (organic)
- [ ] Positive feedback from 5+ readers
- [ ] Clear routine established (writing, publishing, promoting)

**Metrics:**
- Subscribers: 100 (target)
- Open rate: >40%
- Click rate: >3%
- Unsubscribe rate: <2%

---

## Next Actions

**Immediate (This Week):**
1. [ ] Research newsletter platforms - @Computer - 1hr
2. [ ] Set up account on chosen platform - @Computer - 30min
3. [ ] Brainstorm 20 topic ideas - @Anywhere - 1hr

**First action:** Research Substack vs Beehiiv (compare features, pricing, examples)

---

## Links & Context

**Related Efforts:** Life OS Implementation (can cross-promote tools)
**Related Notes:** [Create "Newsletter Ideas" note to capture topics]
**Related People:** [Beta readers to add to People database]

**Context from current-focus.md:**
- Aligns with Q1 goal: "Establish expertise in personal finance"
- Fits Creative area priority
- Complements money management learning

---

## Recommendations

**Should you start this now?**

✅ **Yes - Start as Active**

**Reasoning:**
- High alignment with Q1 goals
- Creative area currently has capacity
- Can batch content creation (efficient)
- Natural extension of Life OS work (can share learnings)

**Time commitment:**
- Week 1-2: 5-6 hrs (setup + planning)
- Week 3+: 3-4 hrs/week (writing + promotion)
- Fits within current availability

**Suggested work blocks:**
- Saturday morning: 2-3 hrs writing
- Tuesday evening: 1 hr promotion/admin

**Review progress:**
- Weekly: Track in weekly-review
- Monthly: Analyze metrics, adjust strategy

---

**Created:** Jan 8, 2026, 10:30 AM
**Ready to create in Notion?** Yes - shall I create the Effort and tasks now?
```
