---
name: recap-email
description: "Draft the recap email after any client call on a delivery engagement: kickoff, current state, propose future state, test and iterate, future state demo, training, office hours, the final before-and-after recap, and ongoing-support workshops. Use whenever the Recap Writer, the Trainer, or the consultant asks for a recap, a follow-up, or a summary email after a call. Also extracts the build requests, decisions, and homework the team needs. Drafts only."
---

# Recap email

The recap is how the client remembers the call, and how the team gets its build requests, decisions and homework. One skill, one template per call type, the consultant's own opener and closer. Every recap is a draft; the consultant sends.

Read `context/consultant.md` first for `{{recap_opener}}`, `{{recap_closer}}`, `{{support_address}}`, and the sample recap the consultant gave the Recap Writer. Match that sample's length and tone.

## Inputs
- The transcript (from the consultant's call recorder) or the notes.
- The call type.
- The client and the engagement file.
- For current state calls: the survey entries for that team.

## Procedure
1. Read the whole transcript. Every sub-topic matters; this recap is the project log.
2. Identify the parent topics in the order they came up, and the sub-topics under each.
3. Pull, separately: decisions made, considerations left open, build requests, pending items, homework with its owner, timeline changes, and any partner links to include when a tool signup is homework.
4. Draft the email with the template for the call type.
5. Produce the extraction block for the team (below the email, never in it).
6. Mention each topic once. Cut anything the client did not say or decide.

## Formatting rules (all call types)
- Bullets everywhere, never numbered lists, never paragraphs in the body.
- Flat bullets, no sub-bullets, no dividers.
- Parent topics in bold, as short descriptive phrases.
- Sub-topic bullets start with an action verb: Reviewed, Created, Confirmed, Clarified, Launched, Decided, Built, Tested, Scheduled.
- Six to eight words per bullet. Homework bullets may run to fifteen with the owner.
- Emoji only on section headers, only where the template shows them.
- Plain text, ready to paste.

## Templates

### Post-kickoff
```
{{recap_opener}}

**Kickoff recap**
- Reviewed the scope, phases and timeline
- Confirmed project contacts and affected teams
- ...

**Useful links**
- Recording: <link>
- Shared Drive folder: <link>
- Your Puzzle map: <link>
- Updates & Deliverables deck: <link>

**Homework**
- <Name>: Complete the current state survey by <date>
- <Name>: Add <consultant email> as admin to <systems>
- <Consultant>: Schedule the current state calls

{{recap_closer}}
```

### Current state
```
Hi <names>,

Thank you for your preparation for our current state calls. Here's the recap, with next steps below.

**Current state overview**
- <team context, two to three bullets>

**Team structure**
- <Role> — responsible for <five to seven words>

**Processes**
- <Workflow> — <ten to fifteen words on what happens>

**Tech stack**
- <Tool> — used for <three to six words>
- Tools in consideration: <category: two or three names>

🏗️ **Build discussions**
- <Build or topic> — <eight to twelve words>

🤕 **Pain points**
- <eight to twelve words each>

📅 **Timeline adjustments** (only if any)
- ...

**Homework / next steps**
- <Name> — <task, ten to fifteen words>
- <Consultant> — <internal deliverable>

{{recap_closer}}
```

### Propose future state
The workshop template below, plus a **Recommendations** section with one line per workflow (the change), and a **Sign-off** line asking the contact to confirm the future state so the build can start. Include partner links where a tool signup is homework, if the consultant uses them.

### Test and iterate
The workshop template, with **Build adjustments** as the main section and a closing line that confirms which builds proceed. State the date the request window closes.

### Future state demo
The workshop template, plus: the request window is now closed; the training date; **Training prep homework**: the invite list for each team's training and an intro email to the affected team.

### Training, office hours, final recap
Training: what was covered, the recording, the Looms, the Puzzle map, the office hours dates. Office hours: the workshop template. Final before-and-after recap: **Before** (the pain points from discovery), **After** (what runs differently now, with the Innovation Report attached), the support path going forward, and every link the client will need.

### Workshop (ongoing support, and the base for most phases)
```
Hi <names>,

Productive session today. Below is a recap of what we reviewed.

✅ **Decisions**
- ...

⏳ **Considerations**
- ...

🔎 **Clarifications / takeaways**
- ...

🏗️ **Live build adjustments**
- ...

↪️ **Future iterations / opportunities**
- ...

⏭️ **Homework / next steps**
- <Client name>: ...
- <Consultant>: ...

Important files:
- <link>

{{recap_closer}}
```

## The extraction block (for the team, not the client)
```
--- for the team ---
Build requests: <one line each, with workflow and source timestamp>
Decisions: <one line each, with rationale if stated>
Scope changes / change requests: <one line each>
Pain points (new): <one line each>
Homework: <owner: item: due>
Unclear in the call (ask the consultant): <one line each>
```

## Rules
- Never invent a decision, a number, a date or a quote. If the call was unclear, say so in the extraction block, never in the email.
- The opener, the closer and the support address come from `consultant.md` and are used exactly as written.
- Never send. The output is a Gmail draft or plain text for the consultant.
