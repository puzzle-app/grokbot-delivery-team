# The delivery team's notes on the puzzle-skills set

[Back to context](README.md)

Fifteen of the skills the Bots hand to Claude Code are the [puzzle-skills](https://github.com/puzzle-app/puzzle-skills) set, installed as a Claude Code plugin (`puzzle-skills:<name>`). Their text lives in that repo and is never edited here. What this team needs on top of them is below, one note per skill the Bots use. The Chief of Staff names this file as an input whenever a unit of work uses one of these skills.

## read-the-map

Every Bot that reads a client workspace follows this skill first. Each client has its own workspace, connected as its own MCP server, with Current State and Future State tabs on the Workflow canvas; read `context/clients/<client>/engagement.md` to know which workspace and which tab is in scope before answering anything.

Comments are part of the map. `list_comments` by step, type and resolved flag: open question comments are the client's homework, open pain_point comments are the input to the future state (the client gives the proposed solution in each thread; the delivery team resolves the comment once that solution is Live), a decision comment points to the changelog entry that holds the rationale. Older workspaces hold `build_request` comments; read them as build requests. For "what does this change cost", the answer is the changelog entry's current state, future state and cost analysis (`list_changelog_entries` with `cost_analysis`), not a figure worked out by hand.

## interview-for-a-process

Read `context/consultant.md` (industries, regulated parts, map conventions) and `context/clients/<client>/engagement.md` (scope, contacts, workflows, survey entries) first. The conversation is a one-hour current state mapping call with one project contact; the Current State Mapper prepares the guide, the consultant runs the call, and the Recap Writer uses the listening checklist afterwards. The checklist's output is a comment plan: the step, the type (question, pain_point, idea, decision, note), the person's words, the source and the date. The Recap Writer hands it to the Current State Mapper, who posts it with the map. Where `consultant.md` names regulated parts, add the questions that surface them.

## build-puzzle-process

Read `context/consultant.md` (map conventions, regulated parts) and `context/glossary.md` first. The delivery team uses two tabs per client workspace: the Current State Mapper builds on Current State, the Process Architect on Future State; confirm the tab with `list_tabs` before anything else. Every future-state Automation or AI Agent step carries the pain point it resolves in its note, and the Process Architect replies on that pain_point comment naming the step. The solution in the thread is the client's; resolving the comment is the delivery team's, once the step is Live. Writes to the client's workspace happen only after the consultant's OK on the proposal.

Tags mark what the map has no field for. Use the client's own tags first. A workspace with none gets the starter set proposed once, in the push plan: Trigger Cadence ("The cadence that steps are triggered": Daily, Weekly, Monthly, Quarterly) on the trigger step of a scheduled process only, and Operations Tags ("Where work waits, breaks, or changes hands": Bottleneck, Error-prone, Customer steps, Handoff). Never a tag for a role, team, person, tool, executor or status; steer the request to that field. A cadence tag agrees with the step's frequency; if they disagree and the schedule is confirmed, fix the frequency.

From a transcript, questions and pain points go in the push plan as comments, not into step notes: the note is the procedure, comments are the conversation. Anything unconfirmed is an open question comment on its step. Show a count by type and one sample; post after the OK.

## find-automation-opportunities

Read `context/consultant.md` (platforms, industries, regulated parts) and `context/glossary.md` first. The Process Architect runs this as the AI Opportunity Roadmap after discovery, from the current state map, the recaps and the tech stack research. Regulated parts named in `consultant.md` are never proposed for automation without the client's explicit decision, recorded in the changelog. Phases map to the engagement: Now is this build, Next is a later phase, Later is ongoing support. Read the open pain_point comments (`list_comments` with type pain_point, resolved false) with the recaps. Each opportunity becomes an idea comment on its steps, with its tier, in place of a line in the step note. A future state that changes cost goes on a changelog entry with both sides set, through the Change Manager. The roadmap is proposed in chat before it is written anywhere.

## cost-a-process

Read `context/consultant.md` (where labor rates come from, whether clients see dollar figures) and `context/glossary.md` first. The Impact Analyst runs this at gate 1 as the Quantification of Impact and again after the demo as the baseline for the Innovation Report, from the same model both times. One-time costs come from `context/clients/<client>/engagement.md`. If `consultant.md` says clients don't see dollar figures, the client document shows hours and counts and the dollar version stays internal. The consultant confirms every figure before a client sees it.

The scenario of record is the changelog entry's current state, future state and cost analysis (`list_changelog_entries` with `cost_analysis`: labor, tool, total and hours, monthly and annual, per side, and the net, where negative is a saving). `has_current` and `has_future` must both be true. A zero total on a side that has steps means missing inputs: report them, never fill them. The skill's own step model stays for the gaps report and for cuts the roll-up doesn't make: by tag (`list_steps` with `tag_id`, such as what the Error-prone or Bottleneck steps cost) and by role. Don't paste a cost table into the entry body; point at the entry. A future state figure is a projection until its steps are Live.

## log-a-decision

Read `context/consultant.md` and `context/glossary.md` first. The Change Manager owns this skill: one entry in the client's workspace for every decision, scope change and change request, after the consultant's OK. The consultant exists on the client's People canvas (as themselves or as a vendor record) so entries have an owner; if that record is missing, say so instead of guessing.

Every entry that changes cost gets its current state and future state set right after it is created (`create_changelog_entries` has no state fields): `update_changelog_entries` with `add_current_state_section_ids` or `add_current_state_tab_ids`, and `add_future_state_section_ids` or `add_future_state_tab_ids`. Steps that won't run after the change are excluded with `future_state_exclude` {statuses, tag_ids}, which replaces the whole filter: by status first (Archived, Draft), by tag only for a scope cut. The current side has its own `current_state_exclude`; a source can sit on both sides only while the two filters differ (one section holding today's steps and the proposed Draft steps: current excludes Draft, future excludes Archived). Read the entry back with `cost_analysis` and check `has_current` and `has_future`. Leave a decision comment on each touched step that points at the entry, never the rationale. The title is the body's first H1, with the heading text on the same line as the `#`: a rewrite once saved `# ` with the title on the next line and the entry read "Untitled".

## audit-the-map

When a Bot runs it on a client workspace, check these too: open question comments older than 30 days, pain_point comments with no reply, tags that duplicate a field (role, team, person, tool, executor, status), a cadence tag that disagrees with the step's frequency, entries that change cost without both sides set, and an entry with a side that rolls up to zero.

## The other eight

start-here, map-the-team, map-tools-and-data, map-tool-assets, share-the-map, brief-a-role, change-impact and evaluate-the-stack are installed with the plugin and need no note yet. When a Bot starts using one, add its note here.
