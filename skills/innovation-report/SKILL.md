---
name: innovation-report
description: "Produce the Innovation Report after the Future State Demo: what the engagement introduced (automations, AI agent steps, handoffs automated, tools consolidated, workflows digitized, visibility gained) and what it resolved (pain points from discovery), with before-and-after values, cut by department or by tool, measured with the same cost model as the Quantification of Impact. Use when the Impact Analyst or the consultant asks for the innovation report, the automation report, the digitization report, or the engagement's results."
---

# Innovation Report

The report that closes the engagement. It counts what was introduced and what was resolved, department by department when the engagement spans several, tool by tool when it is tool-based, and it reconciles against the Quantification of Impact from the first gate. It is honest about what cannot be measured yet.

Read `context/glossary.md` (the metric definitions) and the Quantification of Impact for this engagement first.

## Inputs
- The current state tab and the future state tab in the client's Puzzle workspace, with step executors, roles, tools, duration and frequency.
- The changelog: every entry with its status, the steps and tools it touches, and the pain points it marks resolved.
- The pain points from discovery (the recaps and the survey).
- The Quantification of Impact.
- Quality-of-life quotes from the Test and Iterate and demo transcripts, in the team's own words.

## The metrics
Each metric has a definition from the glossary and a before value from the current state tab, or it is not a metric.

| Metric | How it is counted |
|---|---|
| Automated steps | Steps with executor Automation, before and after |
| AI agent steps | Steps with executor AI Agent, before and after |
| Handoff automations | Handoffs between roles or teams where the receiving step is now Automation or AI Agent |
| Tools per workflow | Distinct tools linked to a workflow's steps, averaged across workflows |
| Digitized workflows | Workflows whose current state steps ran in email, meetings or on paper (no tool, or a communication tool only) and whose future state steps run in a system |
| Workflow visibility | Workflows where a team other than the owner can see status in a system without asking |
| Pain points resolved | Pain points from discovery that a changelog entry marks resolved, with the step that resolves them |
| Hours returned per month | From the cost model, where duration and frequency exist |

## Procedure
1. Count every metric on the current state tab and the future state tab. Keep the step ids behind every count.
2. Read the changelog. For each entry that is completed, list the pain points it resolves and the steps and tools it touches. Pain points with no completed entry are listed as open.
3. Build the breakdown: by department (team) when the engagement spans several, by tool when the engagement is tool-based. Use the one the engagement file says.
4. Build the per-workflow table: automated steps, AI agent steps, tools before and after.
5. Pull two to five quality-of-life quotes from the transcripts, attributed by role, and get the consultant's OK to use each.
6. Reconcile with the Quantification of Impact: the projected hours returned against the measured ones, and name any gap and its reason.
7. Write the caveat: time saved is a projection until the workflows have run; name the date the measurement can be made.
8. Propose the report in chat before it goes to Drive or to the Trainer for the final recap.

## Output format

```
# Innovation Report: <client>
<engagement dates>. <n> workflows across <n> teams. From the Puzzle workspace on <date>.

## Why and how
Two paragraphs: the pain that started the engagement, and the method in five steps (identify the workflows and the people, map the current state step by step, identify the opportunities, prototype with each team, sign off and build).

## Metrics
| Metric | Definition | Before | After |
|---|---|---|---|

## Outcomes
Three to five sentences with the headline numbers and the percentages they imply.

## By department (or by tool)
| Team | Automated steps | AI agent steps | Handoff automations | Visibility | Pain points resolved |
|---|---|---|---|---|---|

## By workflow
| Workflow | Team | Automated steps | AI agent steps | Tools before → after |
|---|---|---|---|---|

## Pain points
Resolved: <pain point> → <changelog entry, step>. Open: <pain point> → <why, and the plan>.

## In the team's words
- "<quote>" — <role>

## Against the projection
Projected hours returned per month: <n>. Measured so far: <n> | not yet measurable. Gap and reason: <...>.

## What comes next
The open items, the later-phase opportunities from the roadmap, and the date to measure time saved.
```

## Rules
- Every count has step ids behind it. Every resolved pain point has a completed changelog entry behind it.
- Never present a projection as a measurement. Say "yet to be determined" where it is.
- Quotes are used only with the consultant's OK and the client's, attributed by role, never by name in anything that leaves the client.
- The report uses the same rates and the same cost model as the Quantification of Impact. If something changed, the report says what and why.
