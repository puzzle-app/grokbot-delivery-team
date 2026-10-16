---
name: ai-opportunity-roadmap
description: "Build the AI Opportunity Roadmap for an engagement: every automation and AI agent opportunity in the client's workflows, ranked, with the steps it touches, the prerequisites, the phase it lands in, and a figure only where the costing inputs make it defensible. Use when the Process Architect or the consultant asks for the roadmap, the automation opportunities, or where AI fits in a client's operation."
---

# AI Opportunity Roadmap

The roadmap answers the question every client asks after discovery: where does automation and AI fit in our operation, in what order, and what do we need first. It is built from the current state map, so every opportunity points at steps that exist.

Read `context/consultant.md` (platforms, industries, regulated parts) and `context/glossary.md` first.

## Inputs
- The current state map in the client's Puzzle workspace: every section, every step with executor, role, tools, attributes, duration, frequency, notes.
- The pain points from the recaps and the survey.
- The tech stack research, if done.
- The changelog, for decisions already made.

## Procedure

1. **Read every Person step in scope.** For each, note the tool, the data it reads or writes, the duration and frequency, and whether a pain point is attached.
2. **Classify each candidate step** into one of four:
   - Automate: a rule-based step with structured inputs in a system that has an API or an automation platform connector. Executor becomes Automation.
   - AI agent: a step that reads unstructured input (an email, a document, a transcript) and produces a draft, a classification or a decision a human reviews. Executor becomes AI Agent.
   - Assist: a human step where AI prepares the input or checks the output, but the human still does it.
   - Keep human: judgment, relationship, compliance, or the consultant's regulated parts say so.
3. **Group candidates into opportunities.** One opportunity is one coherent change: a handoff automated end to end, an intake triaged by an agent, a report generated. List the steps each opportunity touches by name and id.
4. **Name the prerequisites** for each: the system it needs, the data that must exist and be clean, the integration, the decision the client must make, the build that must come first.
5. **Rank.** Primary: the number of steps touched weighted by how painful they are (a pain point in the changelog counts double). Secondary: prerequisites already met. Tertiary: the hours per month returned where duration and frequency exist.
6. **Place each opportunity in a phase**: this engagement's build, a later phase, or ongoing support. Anything with an unmet prerequisite cannot land in this build.
7. **Put a figure only where it is defensible.** Hours per month returned is duration times frequency on the steps touched, from the workspace. Where either is missing on a step, mark the figure "not defensible: missing duration or frequency" and ask instead of estimating. Never quote dollars unless the Impact Analyst has priced it.
8. **Propose the roadmap in chat** before it is written to Drive, and before any changelog entry.

## Output format

```
# AI Opportunity Roadmap: <client>
Built from the current state map on <date>. <n> workflows, <n> steps in scope.

## Summary
- <n> opportunities: <n> automate, <n> AI agent, <n> assist
- Lands in this build: <n>. Later: <n>. Needs a decision first: <n>.
- Hours per month returned where defensible: <n> (on <n> of <n> steps with costing inputs)

## Ranked opportunities
### 1. <Opportunity name>: <Automate | AI agent | Assist>
Steps touched: <workflow: step (id), ...>
Pain points resolved: <from the changelog or the recaps>
What changes: <two lines>
Prerequisites: <system, data, integration, decision, build>
Phase: <this build | later | ongoing support>
Hours per month returned: <n> | not defensible: <reason>
Risk or trade-off: <one line>

### 2. ...

## Kept human, and why
- <step>: <reason>

## Decisions the client needs to make first
- ...
```

## Rules
- Every opportunity names steps that exist in the workspace. No opportunity without a step.
- Never claim a platform can do something you have not verified on the vendor's page or in the tech stack research.
- Regulated parts in `consultant.md` are never automated without the client's explicit decision, recorded in the changelog.
- The roadmap is a proposal. The Process Architect and the consultant decide what goes in the future state.
