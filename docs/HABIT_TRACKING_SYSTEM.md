# Habit Tracking System

Comprehensive habit tracking integrated with Life OS - build keystone habits, track streaks, identify patterns.

## Philosophy

**Habits > Goals:**
- Goals are about results
- Habits are about identity
- Focus on becoming the type of person who...

**Keystone Habits:**
- One habit can trigger cascading positive changes
- Quality > Quantity
- Start with 1-3 habits max

## Notion Database Schema

### Habits Database

| Property | Type | Configuration |
|----------|------|---------------|
| Habit | Title | Habit name/description |
| Category | Select | `Health`, `Work`, `Learning`, `Relationships`, `Creative`, `Money`, `Self-Care` |
| Frequency | Select | `Daily`, `Weekdays`, `Weekly`, `Custom` |
| Trigger | Text | "After [existing habit], I will [new habit]" |
| Reward | Text | Immediate reward/feeling |
| Why | Text | Deeper motivation |
| Target Outcome | Text | What this habit builds toward |
| Identity | Text | "I am a person who..." |
| Status | Select | `🎯 Active`, `⏸️ Paused`, `✅ Established`, `❌ Abandoned` |
| Start Date | Date | When habit started |
| Current Streak | Number | Days in a row (calculated) |
| Longest Streak | Number | Best streak achieved |
| Completion Rate | Formula | % of days completed (30-day rolling) |
| Last Completed | Date | Most recent completion |
| Total Completions | Rollup | Count from Check-ins |
| Difficulty | Select | `Easy`, `Moderate`, `Hard` |
| Time Required | Select | `< 5 min`, `5-15 min`, `15-30 min`, `30-60 min`, `1+ hour` |
| Notes | Text | Additional context |

### Habit Check-ins Database (Daily Tracking)

| Property | Type | Configuration |
|----------|------|---------------|
| Date | Date | The day (format: YYYY-MM-DD) |
| Habits | Relation → Habits | Which habits apply today |
| [Habit 1] | Checkbox | Completed? (one column per active habit) |
| [Habit 2] | Checkbox | Completed? |
| Notes | Text | Context, feelings, observations |
| Daily Log | Relation | Link to Daily Logs database (single) |
| Completion % | Formula | % of applicable habits completed |
| Created | Created time | Auto |

**Alternative: Formula Properties in Habits Database**
Instead of separate check-ins, use formula to calculate from Daily Logs:
- Link Habits ↔ Daily Logs
- Daily Log has checkboxes for each habit
- Habits database calculates streaks via formula

## Habit Building Framework

### 1. Habit Stacking (Trigger)

**Format:** "After [existing habit], I will [new habit]"

**Examples:**
- "After I pour my morning coffee, I will write 3 gratitudes"
- "After I sit down at my desk, I will review my daily plan"
- "After I close my laptop, I will do 10 push-ups"

**Why This Works:**
- Leverages existing routines
- Removes need for willpower/remembering
- Creates automatic behavior chains

### 2. Identity-Based (Why)

**Format:** "I am a person who..."

**Examples:**
- Habit: Exercise daily
  - Identity: "I am an athlete" or "I am someone who values health"
- Habit: Write every day
  - Identity: "I am a writer"
- Habit: Save 20% of income
  - Identity: "I am financially responsible"

**Why This Works:**
- Motivation comes from self-image
- Pride in identity > external rewards
- Behavior change becomes self-expression

### 3. Immediate Rewards (Feel)

**What do you feel RIGHT AFTER completing the habit?**

**Examples:**
- Exercise: Endorphins, pride, energy
- Meditation: Calm, centered, clear
- Journaling: Relief, clarity, processed
- Reading: Smarter, cultured, relaxed

**Track These:**
The immediate positive feeling reinforces the habit loop.

## Habit Tracking Skills

### habit-tracker (Daily)

Check off today's habits, provide encouragement, track streaks.

**Usage:**
```
"Track my habits for today"
"Mark exercise as done"
"Show my habit progress"
```

### habit-analyzer (Weekly)

Analyze patterns, identify what's working, suggest optimizations.

**Usage:**
```
"Analyze my habit patterns this week"
"Why do I keep missing [habit]?"
"What's my best habit?"
```

### habit-builder (When Starting New)

Guide through creating a well-designed habit.

**Usage:**
```
"I want to build a meditation habit"
"Help me start exercising daily"
```

## Implementation

### Phase 1: Simple Tracking (Manual)

**Daily Logs Database:**
Add checkbox properties for each habit:
- [ ] Exercise
- [ ] Read
- [ ] Journal
- [ ] Meditate

**Daily Check-in Skill:**
Update to ask about habits:
"Did you exercise today?"
"How about reading?"

### Phase 2: Dedicated Habit System

**Create Habits Database** (schema above)

**Create Habit Check-ins Database**

**Build habit-tracker skill** (detailed below)

### Phase 3: Advanced Analytics

**Pattern detection:**
- Habit completion correlates with sleep?
- Day of week patterns?
- Habit chains (completing X leads to completing Y)?

**Insights:**
- Best time for each habit
- Optimal habit stacking
- Energy level impact

## Habit Tracker Skill Spec

**Location:** `skills/habit-tracker.md`

**Features:**
1. Morning: Show today's habits
2. Throughout day: Quick log completions
3. Evening: Review and celebrate
4. Weekly: Analyze patterns

**Example Interaction:**

```
User: "Track habits"

AI:
# 🎯 Habit Tracker - Wednesday, Jan 8

## Today's Habits

1. [ ] Exercise (30 min)
   - Trigger: After morning coffee
   - Current streak: 5 days 🔥

2. [ ] Read (15 min)
   - Trigger: Before bed
   - Current streak: 12 days 🔥🔥

3. [ ] Journal (5 min)
   - Trigger: After dinner
   - Current streak: 0 days (restart!)

---

Mark any as complete?

User: "Exercise done"

AI:
✅ Exercise complete!

🔥 **6-day streak!** You're on fire!

You're an athlete. 💪

Remaining today:
- Read (15 min)
- Journal (5 min)
```

## Streak Psychology

**Why Streaks Work:**
- Visual progress
- Loss aversion (don't want to break the chain)
- Momentum and pride

**Streak Tiers:**
- 🔥 7 days: Week Warrior
- 🔥🔥 30 days: Month Master
- 🔥🔥🔥 90 days: Quarter Champion
- 🔥🔥🔥🔥 365 days: Year Legend

**Handling Breaks:**
- Freeze days (planned off days)
- Grace period (24 hours)
- Quick restart (don't spiral)
- Track "longest streak" separately

## Keystone Habits to Consider

**Health:**
- Exercise (even 10 min)
- Sleep 7+ hours
- Drink water
- Healthy breakfast

**Productivity:**
- Morning planning (5 min)
- Inbox zero
- Evening shutdown routine
- Deep work block

**Learning:**
- Read 15 min
- Learn something new
- Practice skill
- Teach/share

**Mindfulness:**
- Meditate (even 2 min)
- Gratitude journal
- Evening reflection
- No phone first hour

**Relationships:**
- Text someone
- Quality time with partner/family
- Reach out to friend
- Active listening

**Money:**
- Review spending
- Save automatically
- Track expenses
- Learn about finance

**Creative:**
- Write/create daily
- Idea generation
- Skill practice
- Ship something

## Common Pitfalls

**Too Many Habits:**
- Problem: Overwhelm, can't sustain
- Solution: Start with ONE keystone habit

**Too Ambitious:**
- Problem: "Exercise 1 hour daily" when starting from zero
- Solution: Scale down - "Exercise 10 min daily"

**No Trigger:**
- Problem: Rely on willpower/memory
- Solution: Stack with existing habit

**No Why:**
- Problem: Motivation fades
- Solution: Connect to identity and values

**All-or-Nothing:**
- Problem: Miss one day → quit entirely
- Solution: 80% completion is excellent

## Success Patterns

**Start Tiny:**
- 2-min meditation > no meditation
- 1 push-up > no push-ups
- Can always do more, but commit to minimum

**Same Time, Same Place:**
- Reduces decision fatigue
- Creates environmental cue
- Builds automaticity

**Track Immediately:**
- Log right after completing
- Dopamine hit from checkmark
- Reinforces loop

**Share Progress:**
- Accountability partner
- Public commitment
- Celebration with others

**Link to Existing System:**
- Habit check in Daily Logs
- Reference in Weekly Review
- Connect to Efforts/Goals

## Integration with Life OS

### Daily Briefing
Show today's habits and current streaks

### Daily Check-in
Review habit completion, celebrate streaks

### Weekly Review
Habit completion rate, pattern analysis

### Effort Planning
New efforts can spawn new supporting habits

### Analytics
Correlate habits with energy, mood, productivity

## Metrics That Matter

**Completion Rate (30-day rolling):**
- 90-100%: Established! Consider it automatic
- 70-89%: Building well, keep going
- 50-69%: Struggling, analyze blockers
- <50%: Redesign or abandon

**Current Streak:**
- Momentum indicator
- Motivational fuel

**Best Time Success Rate:**
- When do you actually complete this habit?
- Optimize timing based on data

**Habit Chains:**
- Which habits cluster together?
- Which enable others?

## Habit Templates

### Morning Routine Habit Stack

```
Habit: Morning Routine
Frequency: Daily
Trigger: Alarm goes off
Components:
  1. Make bed (1 min)
  2. Water + vitamins (1 min)
  3. Exercise (10 min)
  4. Shower (10 min)
  5. Breakfast (15 min)
  6. Daily briefing (5 min)
Total: 42 min
Track as: Single habit or individual?
```

### Learning Habit

```
Habit: Daily Learning
Frequency: Daily (weekdays)
Trigger: After lunch
Action: Read or take course for 15 min
Why: Become a lifelong learner
Identity: I am someone who grows daily
Difficulty: Easy
Time: 15 min
```

### Health Habit

```
Habit: Exercise
Frequency: Daily
Trigger: After morning coffee
Action: 30-min workout (run, gym, or home)
Why: Health, energy, longevity
Identity: I am an athlete
Reward: Endorphins, pride, energy boost
Difficulty: Moderate
Time: 30 min
```

## Next Steps

1. **Choose ONE keystone habit**
   - What would have the biggest impact?
   - What would trigger other positive changes?

2. **Design it well**
   - Clear trigger
   - Tiny start (scale up later)
   - Immediate reward identified

3. **Track daily**
   - Add to Daily Logs (simple start)
   - Or create Habits database (full system)

4. **Review weekly**
   - What helped?
   - What blocked?
   - Adjust as needed

5. **Celebrate milestones**
   - 7 days
   - 30 days
   - 90 days
   - 365 days

6. **Add habits slowly**
   - Master one before adding next
   - 2-3 habits max at a time
   - Established habits become automatic

---

**Remember:** You don't rise to the level of your goals. You fall to the level of your systems.

Build the system. The results will follow.
