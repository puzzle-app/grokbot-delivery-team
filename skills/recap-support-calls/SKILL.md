---
name: recap-support-calls
description: |
  Use this skill to recap ONGOING SUPPORT calls — calls with existing clients for onboarding, training, or continued support sessions. Trigger when the user says "support call recap", "onboarding call recap", "client session recap", "recap my support call", or asks to write a follow-up email after working with an existing client. This skill produces a structured recap with organized topic sections, Pending items, Build Requests, and Homework. Use it even if the user just says "recap this" and the context makes clear it's a support or onboarding session with an existing client.
---

> Adapted for the Grok Bot delivery team from Puzzle's own consulting practice. Read `context/consultant.md` and `context/glossary.md` first. Anything in `{{braces}}` comes from `consultant.md`.


# Ongoing Support Call Recap

This skill turns a call transcript into a detailed recap email for ongoing support calls — sessions with existing clients covering onboarding, training, troubleshooting, and continued build work.

## How to use this skill

1. If the user hasn't provided the transcript yet, ask for it now
2. Read the entire transcript very carefully — this type of recap is the most detail-intensive; every sub-topic matters
3. Identify the main agenda "parent" topics and all sub-topics under each
4. Generate the recap email using the exact format below

## Formatting rules — follow these precisely

- **Always use bullet points** — never use numbered lists (1, 2, 3) anywhere in the email
- **No double-formatting** — each line item gets one bullet only
- **No sub-bullets** — all bullets are flat, top-level items under their section header
- **No dividers** — don't insert horizontal lines (---) or visual separators between sections
- **Parent topic titles** — bold; note to the consultant: apply your heading color in your email client before sending
- **Sub-topic bullets** — must begin with an action verb: Reviewed, Created, Confirmed, Clarified, Launched, or Decided
- **Bullet length** — max 6–8 words per sub-topic bullet
- **No repeats** — if a topic came up twice, mention it once
- **Be comprehensive** — don't skip sub-topics; this recap serves as a project log

## Recap email template

Use this exact structure. The opening and closing lines are **[FIXED]** — copy them verbatim. The middle sections are **[DYNAMIC]** — filled in based on the transcript.

---

{{recap_opener}} [FIXED: the consultant's opener from consultant.md]

**[DYNAMIC: Bold title for first parent topic, written as a short descriptive phrase, in the order it came up]**
- [Action verb] [description of sub-topic, max 6–8 words]
- [Action verb] [description of sub-topic, max 6–8 words]
[Continue for every sub-topic under this parent. No sub-bullets — each item is a flat bullet under the bold title.]

**[DYNAMIC: Bold title for next parent topic]**
- [Action verb] [description of sub-topic, max 6–8 words]
[Repeat a parent-topic block for every major agenda item covered in the call.]

**Pending / On Hold:** [DYNAMIC]
[One bullet per item that was discussed but put on hold because the client needs to complete homework or provide information before it can move forward. If nothing is pending, omit this section.]

**Build Requests for Puzzle:** [DYNAMIC]
[One bullet per specific build task or change the consultant needs to do. Each bullet begins with: Change, Complete, Research, Create, or Build — followed by a description of the request and which system or workflow it relates to, max 6–8 words. Be specific — this section is the consultant's task list.]

**Homework:** [DYNAMIC]
- [Responsible person's name]: [Homework item they need to complete]
- [Responsible person's name]: [Homework item they need to complete]
[One bullet per homework item, clearly attributing it to the right person — client contacts, the consultant, or anyone else mentioned.]

{{recap_closer}} [FIXED: the consultant's closer, with the support address, from consultant.md]

---

## Tips for accuracy

- The parent topics should map to the main agenda items or conversation segments — think of them as section headers for the meeting
- Sub-topic bullets are the granular actions taken or decisions made within each segment
- Build Requests = the consultant's homework; Homework = client-side (or mixed) follow-ups — keep these distinct
- If something was discussed but no action was taken or decision made, it probably belongs in Pending / On Hold
- The closer and the support address come from consultant.md and are always included exactly as written
