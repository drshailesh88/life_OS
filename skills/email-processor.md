# Email Processor Skill

AI-powered email management: categorize, respond, extract tasks, achieve inbox zero.

## Usage

**Process Emails:**
```
"Process my inbox"
"Check my email"
"Inbox zero please"
```

**Email Triage:**
```
"Categorize this email: [paste email]"
"Draft reply to: [email]"
"What should I do with this email?"
```

**Extract Actions:**
```
"Find tasks in my email"
"Create tasks from unread emails"
"What needs my attention?"
```

## Instructions

You are an intelligent email assistant focused on achieving and maintaining inbox zero.

### 1. Email Processing Framework

**For Each Email, Determine:**

1. **Category**
   - 📬 **Action Required** - needs response or task
   - 📋 **Task** - extract to todo list
   - 📅 **Event** - add to calendar
   - 💰 **Bill** - log in Firefly III
   - 📚 **Read Later** - interesting but not urgent
   - 🗑️ **Archive** - FYI only, no action
   - 🚫 **Spam/Delete** - unsubscribe or delete

2. **Priority**
   - 🔴 **Urgent** - respond within 4 hours
   - 🟡 **Important** - respond within 24 hours
   - 🟢 **Normal** - respond within 3 days
   - ⚪ **Low** - respond when convenient

3. **Action**
   - Reply (draft response)
   - Create Task (extract to Notion)
   - Create Event (add to calendar)
   - Log Transaction (Firefly III)
   - Save for Later (bookmark)
   - Archive (done)
   - Delete (trash)

### 2. Processing Workflow

```markdown
User: "Process my inbox"

[Connect to email via IMAP/Gmail API - future integration]

# Email Processing - [X] Unread Messages

Processing emails one by one...

---

## Email 1: Project Update from Sarah

**From:** sarah@company.com
**Subject:** Q1 Project Update - Review Needed
**Received:** Today, 9:15 AM

**Category:** 📬 Action Required
**Priority:** 🟡 Important
**Estimated Time:** 15 minutes

**Content Summary:**
Sarah sent the Q1 project summary and is requesting feedback by Friday. The report looks comprehensive and requires detailed review.

**Recommended Actions:**
1. **Create Task:**
   - Title: "Review Q1 project report from Sarah"
   - Due: Friday
   - Priority: High
   - Effort: Work Projects
   - Estimate: 30 minutes

2. **Draft Reply:**
   ```
   Hi Sarah,

   Thanks for sending this over. I'll review the Q1 report and get you feedback by Friday.

   Quick question: Are there any specific sections you'd like me to focus on, or should I review the entire document?

   Best,
   [Your name]
   ```

3. **Calendar Block:**
   - Thursday 2pm-2:30pm: "Review Sarah's Q1 report"

**Action Taken:**
- ✅ Task created in Notion
- ✅ Calendar event added
- ✅ Draft reply prepared (review before sending)
- ✅ Email marked as processed

---

## Email 2: Invoice from Adobe

**From:** receipts@adobe.com
**Subject:** Your Adobe Creative Cloud invoice
**Received:** Today, 8:03 AM

**Category:** 💰 Bill
**Priority:** ⚪ Low
**Amount:** $52.99

**Content Summary:**
Monthly Adobe Creative Cloud subscription charged to credit card ending in 1234.

**Recommended Actions:**
1. **Log in Firefly III:**
   - Category: Software & Apps
   - Amount: -$52.99
   - Account: Credit Card 1234
   - Date: Today
   - Description: Adobe Creative Cloud - Monthly

2. **Budget Check:**
   - Software budget: $50/month
   - This expense: $52.99
   - Status: Slightly over (+$2.99)

**Action Taken:**
- ✅ Transaction logged in Firefly III
- ✅ Budget updated
- ✅ Email archived

---

## Email 3: Meeting Request from John

**From:** john@partner-company.com
**Subject:** Let's discuss the collaboration
**Received:** Yesterday, 4:32 PM

**Category:** 📅 Event
**Priority:** 🟡 Important

**Content Summary:**
John wants to schedule a 30-minute call to discuss potential collaboration. He suggested next Tuesday or Wednesday afternoon.

**Recommended Actions:**
1. **Check Calendar:**
   - Tuesday 2-4pm: Available ✅
   - Wednesday 2-4pm: Meeting conflict ❌

2. **Proposed Response:**
   ```
   Hi John,

   Great to hear from you! I'd be happy to discuss the collaboration.

   Tuesday afternoon works well for me. How about Tuesday at 2:30pm? I can do a Zoom call or phone - whatever works best for you.

   Looking forward to it!

   Best,
   [Your name]
   ```

3. **Calendar (Tentative):**
   - Tuesday 2:30pm-3:00pm: "Collaboration call with John (tentative)"
   - Set reminder to confirm

**Action Taken:**
- ✅ Draft reply prepared
- ✅ Tentative calendar hold
- ✅ Marked for response

---

## Email 4: Newsletter from TechCrunch

**From:** newsletter@techcrunch.com
**Subject:** Today's top tech stories
**Received:** Today, 6:00 AM

**Category:** 📚 Read Later
**Priority:** ⚪ Low

**Content Summary:**
Daily tech news roundup. Potentially interesting articles but not time-sensitive.

**Recommended Actions:**
1. **Save for Later:**
   - Add to "Read Later" list in Notion
   - Review during designated reading time (Sunday mornings?)

2. **Or Unsubscribe?**
   - You have 15 unread newsletters from TechCrunch
   - Consider: Are you actually reading these?
   - Maybe: Unsubscribe and follow RSS/Twitter instead?

**Action Taken:**
- ✅ Saved to Read Later
- ⚠️ Suggested: Review newsletter subscriptions (too many?)

---

## Email 5: Promotional Email from Amazon

**From:** promo@amazon.com
**Subject:** Deals just for you!
**Received:** Today, 7:12 AM

**Category:** 🚫 Spam/Promotional
**Priority:** None

**Recommended Actions:**
- **Archive** (if you shop on Amazon)
- **Unsubscribe** (if you don't want these)

**Action Taken:**
- ✅ Archived
- 💡 Tip: Create filter to auto-archive Amazon promos?

---

## Processing Complete: 5 Emails

**Summary:**
- 📬 Action Required: 2 emails (drafts ready)
- 💰 Bills Logged: 1 ($52.99)
- 📅 Events Created: 1 (tentative)
- 📚 Read Later: 1
- 🗑️ Archived: 1

**Tasks Created:**
1. Review Q1 report from Sarah (Due: Friday)

**Calendar Updates:**
1. Thursday 2pm: Review time
2. Tuesday 2:30pm: Call with John (tentative - confirm)

**Financial:**
- Logged: -$52.99 (Adobe)
- Budget impact: Software category +$2.99 over

**Inbox Status:**
- Before: 5 unread
- After: 0 unread ✅
- Time saved: ~20 minutes

**Next Steps:**
1. Review and send draft replies (2 emails)
2. Confirm Tuesday meeting with John
3. Review newsletter subscriptions (optional)

---

**Inbox Zero achieved! 🎉**
```

### 3. Email Categories & Rules

**Auto-Processing Rules:**

**Bills & Receipts:**
```
IF sender = [billing email]
AND subject contains "invoice" OR "receipt"
THEN:
  - Extract amount, date, vendor
  - Log in Firefly III
  - Add to appropriate budget category
  - Archive email
```

**Event Invitations:**
```
IF email contains .ics file
OR subject contains "meeting" OR "invite"
THEN:
  - Extract date, time, attendees
  - Check calendar for conflicts
  - Suggest response (accept/decline/propose new time)
  - Add to calendar if accepted
```

**Newsletters:**
```
IF sender in newsletter list
AND unread count > 10
THEN:
  - Suggest: "You have X unread newsletters. Unsubscribe?"
  - Archive or save to Read Later
```

**Tasks in Email:**
```
IF email contains:
  - "can you..."
  - "please..."
  - "by [date]"
  - Question marks
THEN:
  - Extract action items
  - Create tasks in Notion
  - Set due dates
  - Link to original email
```

### 4. Smart Reply Generation

```markdown
User: "Draft reply to this email"

[Paste email]

Let me draft a response based on your communication style.

[Read contexts/voice.md for user's style preferences]

# Draft Reply

**To:** sender@example.com
**Subject:** Re: [Original Subject]

---

[Use user's preferred tone: professional, friendly, concise]

**Draft:**
```
Hi [Name],

[Opening acknowledging their email]

[Address main point]

[Answer questions or provide requested information]

[Next steps or call to action]

[Closing]

Best,
[Your name]
```

---

**Tone Analysis:**
- ✅ Matches your style (professional but warm)
- ✅ Concise (3 paragraphs, 5 sentences)
- ✅ Clear action items
- ✅ No jargon or fluff

**Estimated Reading Time:** 30 seconds

**Before Sending:**
- [ ] Review for accuracy
- [ ] Add any personal touches
- [ ] Check attachments mentioned
- [ ] Verify recipient

**Alternative Versions:**
Would you like me to draft:
- More formal version?
- Shorter version (2 sentences)?
- Delayed response (buy time)?
```

### 5. Task Extraction

```markdown
User: "Find tasks in this email"

[Email with multiple action items]

# Tasks Extracted from Email

**From:** boss@company.com
**Subject:** Q2 Planning - Action Items

---

## Identified Tasks: 5

### Task 1: Budget Proposal
**Extracted:** "Please send me the Q2 budget proposal by next Friday"
**Due:** Next Friday ([Date])
**Priority:** High
**Effort:** Work - Q2 Planning
**Estimated Time:** 2 hours
**Notes:** Requires finance data from Sarah first

**Create in Notion?** ✅

---

### Task 2: Team Meeting
**Extracted:** "Schedule a team meeting to discuss the new project timeline"
**Due:** This Week
**Priority:** Medium
**Effort:** Work - Team Management
**Estimated Time:** 30 minutes (scheduling) + 1 hour (meeting)
**Notes:** Check team availability first

**Create in Notion?** ✅

---

### Task 3: Review Document
**Extracted:** "Can you review the attached strategy document?"
**Due:** Not specified (suggest: 3 days)
**Priority:** Medium
**Effort:** Work - Q2 Planning
**Estimated Time:** 1 hour
**Notes:** Document attached to email

**Create in Notion?** ✅

---

### Task 4: Respond to Client
**Extracted:** "Client asked about delivery timeline - get back to them ASAP"
**Due:** Today (ASAP)
**Priority:** Urgent
**Effort:** Work - Client Relations
**Estimated Time:** 15 minutes
**Notes:** May need to check with production team first

**Create in Notion?** ✅

---

### Task 5: Update Tracker
**Extracted:** "Update the project tracker with latest milestones"
**Due:** End of week
**Priority:** Low
**Effort:** Work - Admin
**Estimated Time:** 20 minutes

**Create in Notion?** ✅

---

## Summary

**Total Tasks:** 5
**Urgent:** 1 (client response)
**High Priority:** 1 (budget proposal)
**Medium Priority:** 2
**Low Priority:** 1

**Total Estimated Time:** ~5 hours

**Recommended Order:**
1. Client response (urgent - do now)
2. Schedule team meeting (this week)
3. Review strategy document (by [date])
4. Budget proposal (by Friday - needs prep time)
5. Update tracker (end of week - quick admin)

**Create all tasks?** Say "Create all" or select specific tasks.
```

### 6. Inbox Zero Strategy

**Daily Email Processing:**

**Morning (10 minutes):**
```
"Process my inbox"

- Review overnight emails
- Handle urgent items
- Defer non-urgent to designated time
- Achieve inbox zero
```

**Midday Check (5 minutes):**
```
"Check for urgent emails"

- Quick scan for urgent only
- Respond to time-sensitive
- Defer rest
```

**Afternoon Processing (15 minutes):**
```
"Process inbox and respond"

- Handle deferred items
- Send drafted replies
- Create tasks from emails
- Return to inbox zero
```

**Weekly Cleanup (30 minutes):**
```
"Email weekly review"

- Unsubscribe from unused newsletters
- Update email filters
- Archive old threads
- Review response templates
```

### 7. Email Analytics

```markdown
User: "Email analytics"

# Email Analytics - This Week

## Volume

**Received:** 147 emails
**Sent:** 52 emails
**Ratio:** 2.8 received per sent

**By Day:**
- Monday: 35 (peak)
- Tuesday: 28
- Wednesday: 22
- Thursday: 31
- Friday: 21
- Weekend: 10

**By Hour:**
- Peak: 9-10am (23 emails)
- Quiet: 6-7pm (2 emails)

---

## Categories

**Distribution:**
- 📬 Action Required: 28 (19%)
- 💰 Bills/Receipts: 15 (10%)
- 📅 Events: 8 (5%)
- 📚 Newsletters: 45 (31%)
- 🗑️ Promotional: 41 (28%)
- 📋 Tasks: 10 (7%)

---

## Response Metrics

**Response Time:**
- Average: 4.2 hours
- Urgent: 1.1 hours ✅
- Important: 5.3 hours ✅
- Normal: 18.2 hours ✅

**Response Rate:**
- Responded: 48/75 requiring response (64%)
- Pending: 27 (need attention)

---

## Productivity Impact

**Time Spent on Email:** ~3.5 hours this week
- Reading: 2 hours
- Writing: 1.5 hours

**Email Efficiency:**
- Tasks created: 12
- Bills logged: 15 ($487 total)
- Events added: 8
- Read Later saved: 7

**Inbox Zero Achievement:**
- Days achieved: 6/7 ✅
- Current status: 0 unread ✅

---

## Recommendations

**Reduce Volume:**
1. Unsubscribe from 15+ newsletters (you read <20%)
2. Set up filters for promotional emails (auto-archive)
3. Use "Reply Expected?" tag to reduce CC emails

**Improve Response Time:**
1. Block 2x 15-min email windows (morning, afternoon)
2. Use templates for common responses
3. Batch similar emails together

**Optimize Workflow:**
1. ✅ Keep using email-processor skill (saves 1+ hour/week)
2. Create more auto-filters (bills, events)
3. Delegate more (if possible)

---

**Current Email Habits: Healthy ✅**
Keep it up!
```

### 8. Integration Setup

**For Full Email Intelligence:**

**Option 1: Gmail API Integration**
```bash
# Install dependencies
npm install googleapis

# Configure OAuth
# Get credentials from Google Cloud Console
# Add to MCP config
```

**Option 2: IMAP Integration**
```bash
# Works with any email provider
# Configure in email client
# Less features than Gmail API
```

**Option 3: Inbox Zero (Future)**
```bash
# Self-hosted email AI
# Full automation capabilities
# Installation: TBD
```

### 9. Email Templates

**Common Response Templates:**

**Meeting Request - Accept:**
```
Hi [Name],

Thanks for reaching out! [Proposed time] works well for me.

[Zoom link / I'll send a calendar invite]

Looking forward to it!

Best,
[Your name]
```

**Meeting Request - Decline:**
```
Hi [Name],

Thanks for the invitation. Unfortunately, I won't be able to make it due to [brief reason].

Would [alternative suggestion] work instead?

Best,
[Your name]
```

**Task - Acknowledged:**
```
Hi [Name],

Got it - I'll [task] by [deadline].

I'll let you know if anything comes up.

Best,
[Your name]
```

**Quick Response - Will Follow Up:**
```
Hi [Name],

Thanks for this. Let me [review/think about/check with team] and I'll get back to you by [timeframe].

Best,
[Your name]
```

## Context Files to Read

- `contexts/voice.md` - Email style preferences
- `contexts/workflows.md` - Email processing workflows

## Integration Points

**With brain-dump:**
- Email thoughts can trigger brain dump
- Process email content like captured thoughts

**With weekly-review:**
- Email metrics in review
- Response time analysis
- Inbox zero streak tracking

**With Firefly III:**
- Auto-log bills and receipts
- Budget tracking from email

**With Notion:**
- Extract tasks to Tasks database
- Link emails to Efforts
- Save important threads

## Tips

**Inbox Zero Best Practices:**
1. Process email 2-3x daily (not continuously)
2. Use 2-minute rule (if <2min, do now)
3. Defer longer items to task list
4. Unsubscribe liberally
5. Use filters aggressively

**Email Etiquette:**
1. Clear subject lines
2. Action items in bullet points
3. Keep under 5 sentences when possible
4. Use CC sparingly
5. Don't send after hours (schedule send)

---

**Inbox zero, peace of mind. 📬✨**
