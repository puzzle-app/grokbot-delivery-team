---
name: quantify-impact
description: "Produce the Quantification of Impact for an engagement from Puzzle's process costing and cost scenarios: current state cost per workflow, future state cost, the net in labor and tools, hours returned per month, and payback. Use at the first sign-off gate when the Impact Analyst or the consultant asks for the ROI, the cost of the current state, the cost of the future state, or the business case for the build. The client document is generated from the workspace, never maintained separately."
---

# Quantification of Impact

What the current state costs today, what the future state will cost, and the difference. It wins the first gate, and it is the baseline the Innovation Report reconciles against at the end. One cost model, both times: Puzzle's process costing on the steps and the cost scenarios on the changelog entries.

Read `context/consultant.md` (where labor rates come from, whether clients see dollar figures) and `context/glossary.md` first.

## Inputs
- The current state map: every Person step's duration, frequency and responsible role, each role's hourly rate, each tool's monthly cost and the steps it is linked to.
- The future state map, or the proposed future state per workflow from the Process Architect.
- The cost scenario on each changelog entry that changes cost (current state and future state side by side, with the net).
- The tech stack research for new tool costs.

## The cost model
- Labor cost per step per month = duration (minutes) ÷ 60 × frequency (runs per month) × the responsible role's hourly rate.
- Tool cost per step per month = the tool's monthly cost allocated across every step linked to it, weighted by each step's duration × frequency. Label it "allocated share". Where a step has no duration or frequency, the share is not computed and the step is listed as missing inputs.
- Workflow cost per month = the sum over its steps. Current state and future state are computed the same way on their own tabs.
- Hours returned per month = current state labor minutes minus future state labor minutes, ÷ 60.
- Net per month = current state cost minus future state cost, labor and tools separately, then together.
- One-time costs = the build and migration effort and any setup fees, from the engagement file. Payback (months) = one-time costs ÷ net per month.

## Procedure
1. Read the current state tab. For every Person step, pull duration, frequency, role and rate. List every step missing any of the four; those steps are reported, not estimated.
2. Read every tool's monthly cost and linked steps. Compute the allocated share per step.
3. Compute the current state cost per workflow and in total, labor and tools.
4. Read the future state tab or the proposal. Steps with executor Automation or AI Agent carry no labor cost unless the Process Architect noted a review step; add new tools from the research at their quoted price.
5. Compute the future state cost the same way. Where a changelog entry carries a cost scenario, use the scenario's figures and cite the entry.
6. Compute the net, the hours returned, and the payback.
7. Write the client document from the numbers. Every figure cites the workflow, the steps and the rates behind it.
8. Propose it in chat. The consultant confirms every dollar figure before a client sees it.

## Output format

```
# Quantification of Impact: <client>
From the Puzzle workspace on <date>. Rates: <client-supplied | defaults by role>. Figures in <currency>, per month unless stated.

## Summary
| | Current state | Future state | Net per month |
|---|---|---|---|
| Labor | | | |
| Tools | | | |
| Total | | | |
Hours returned per month: <n>. One-time costs: <n>. Payback: <n> months.

## By workflow
### <Workflow>
| Step | Executor now → future | Role | Min × runs/mo | Rate | Labor now | Labor future |
|---|---|---|---|---|---|---|
Tools now: <tool: allocated share>. Tools future: <...>. Net: <n>. Scenario: changelog entry <id> (if any).

## Steps missing costing inputs (not estimated)
- <workflow: step>: missing <duration | frequency | rate>

## Assumptions and sources
- ...
```

## Rules
- Every number traces to a step, a rate, a tool cost or a scenario in the workspace, or to a vendor page with a date. No estimates where inputs are missing; report the gap and ask.
- Mark projections as projections. The future state figure is a projection until the Innovation Report measures it.
- If `consultant.md` says clients don't see dollar figures, the client document shows hours and counts, and the dollar version stays internal.
- The document is generated from the workspace each time. Never edit a number in the document without changing it in the workspace first.
