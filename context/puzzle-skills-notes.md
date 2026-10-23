# The delivery team's notes on the puzzle-skills set

[Back to context](README.md)

Fifteen of the skills the Bots hand to Claude Code are the [puzzle-skills](https://github.com/puzzle-app/puzzle-skills) set, installed as a Claude Code plugin (`puzzle-skills:<name>`). Their text lives in that repo and is never edited here. What this team needs on top of them is below, one note per skill the Bots use. The Chief of Staff names this file as an input whenever a unit of work uses one of these skills.

## read-the-map

Every Bot that reads a client workspace follows this skill first. Each client has its own workspace, connected as its own MCP server, with Current State and Future State tabs on the Workflow canvas; read `context/clients/<client>/engagement.md` to know which workspace and which tab is in scope before answering anything.

## interview-for-a-process

Read `context/consultant.md` (industries, regulated parts, map conventions) and `context/clients/<client>/engagement.md` (scope, contacts, workflows, survey entries) first. The conversation is a one-hour current state mapping call with one project contact; the Current State Mapper prepares the guide, the consultant runs the call, and the Recap Writer uses the listening checklist afterwards. Where `consultant.md` names regulated parts, add the questions that surface them.

## build-puzzle-process

Read `context/consultant.md` (map conventions, regulated parts) and `context/glossary.md` first. The delivery team uses two tabs per client workspace: the Current State Mapper builds on Current State, the Process Architect on Future State; confirm the tab with `list_tabs` before anything else. Every future-state Automation or AI Agent step carries the pain point it resolves in its note. Writes to the client's workspace happen only after the consultant's OK on the proposal.

## find-automation-opportunities

Read `context/consultant.md` (platforms, industries, regulated parts) and `context/glossary.md` first. The Process Architect runs this as the AI Opportunity Roadmap after discovery, from the current state map, the recaps and the tech stack research. Regulated parts named in `consultant.md` are never proposed for automation without the client's explicit decision, recorded in the changelog. Phases map to the engagement: Now is this build, Next is a later phase, Later is ongoing support. The roadmap is proposed in chat before it is written anywhere.

## cost-a-process

Read `context/consultant.md` (where labor rates come from, whether clients see dollar figures) and `context/glossary.md` first. The Impact Analyst runs this at gate 1 as the Quantification of Impact and again after the demo as the baseline for the Innovation Report, from the same model both times. One-time costs come from `context/clients/<client>/engagement.md`. If `consultant.md` says clients don't see dollar figures, the client document shows hours and counts and the dollar version stays internal. The consultant confirms every figure before a client sees it.

## log-a-decision

Read `context/consultant.md` and `context/glossary.md` first. The Change Manager owns this skill: one entry in the client's workspace for every decision, scope change and change request, after the consultant's OK. The consultant exists on the client's People canvas (as themselves or as a vendor record) so entries have an owner; if that record is missing, say so instead of guessing. Every entry that changes cost gets a cost scenario from the Impact Analyst.

## The other nine

start-here, map-the-team, map-tools-and-data, map-tool-assets, audit-the-map, share-the-map, brief-a-role, change-impact and evaluate-the-stack are installed with the plugin and need no note yet. When a Bot starts using one, add its note here.
