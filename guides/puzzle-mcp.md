# Puzzle and the MCP

[Back to the team](../README.md)

The team runs on one Puzzle workspace per client. The map is the deliverable the client keeps, the status board the engagement runs on, and the context every Bot reads before it drafts. This guide says what is in the workspace, which Bot touches what, and what the Puzzle MCP lets Claude Code do with it.

## What a client workspace holds

Four connected canvases, and everything links to everything that touches it.

| Canvas | What it holds | Who fills it |
|---|---|---|
| Workflow | Tabs for Current State and Future State. One section per workflow. Steps with a type, a status, an executor (Person, Automation, AI Agent), the responsible role, the tools, the attributes read or written, the duration and frequency, a note, tags, and comment threads | Current State Mapper, Process Architect, Build Specialist (status) |
| Team and People | Teams; roles with hourly rates, a status (draft, planned, hiring, filled, archived) and a type (internal, external); the people in them, with Details (Active or Inactive, phone, location, time zone, start and end date) | Current State Mapper, Process Architect (roles the future state needs) |
| Tools | Every system in the operation and what it costs | Current State Mapper, Tech Stack Researcher (proposals) |
| Data Model | Entities and attributes per tool, and how they relate | Current State Mapper, Data Cleaner (mapping) |

On top of the canvases:

- **Process costing.** Duration times frequency times the role's hourly rate per step, plus the allocated tool cost. The Impact Analyst's current state baseline.
- **The changelog's cost analysis.** An entry names its current state (before) and future state (after) as sections or whole tabs. Puzzle rolls each side up into labor cost, tool cost, total and hours, monthly and annual, plus the net (future minus current; negative is a saving). Steps can be excluded from the future side by status or tag. Optimizer plan. The Impact Analyst's scenario of record.
- **Tags.** Tag groups on steps, for what the map has no field for: the trigger cadence, where work waits or breaks, customer steps, handoffs. Never a role, team, person, tool, executor or status.
- **Comments.** Threads on a step or a section, each with a type (question, idea, pain_point, decision, note) and a resolved flag. Open questions are the client's homework; open pain points feed the future state (the client gives the proposed solution in the thread, the delivery team resolves it once that solution is Live); a decision comment points to its changelog entry.
- **The changelog.** Entries with a status (idea, planned, in progress, completed), an owner from the People canvas, the rationale, and links to the steps and tools they touch. The Change Manager's record, and the source of the Innovation Report.
- **Tasks.** Checklist items on a step or section, outstanding or completed. The team's to-dos on the map: what a build still needs. Not the client's homework, which stays in question comments.
- **Tab folders.** Folders in each canvas's sidebar that group its tabs. A client who organises tabs into folders keeps them; new tabs go in the folder they belong to.
- **Shared views.** A public, curated subset of the workspace, open to anyone with the link. How maps reach a team without giving everyone the whole operation.

## Conventions the Bots assume

- One workspace per client, connected to Claude Code as its own MCP server.
- Two tabs on the Workflow canvas named Current State and Future State. The future state is a copy that changes, never an edit of the current state.
- One section per workflow, named for the workflow. No workflow split across sections.
- Every Person step carries a responsible role with an hourly rate, a duration and a frequency. That is what makes costing work.
- Every automated or AI step in the future state is annotated with the pain point it resolves.
- A changelog entry for every decision, linked to the steps it touches, with its current state and future state set when it changes cost.
- The step note is the procedure; comments are the conversation. A pain point or an unconfirmed fact is a comment on its step, not a line in the note. A confirmed answer moves into the step and its thread is resolved.
- The consultant exists on the client's People canvas, as themselves or as a vendor record, so entries have an owner.

## What the MCP lets Claude Code do

The Puzzle MCP exposes the workspace to any agent. The Bots name these in plain words; this is what the words mean.

| In the Bot's words | What Claude Code does with the MCP |
|---|---|
| Read the map | List tabs, sections and steps with their roles, tools, attributes, duration, frequency, notes and connections |
| Build the current state | Create roles and tools, create entities and attributes, create a process (section, steps, connections) in one call, then link attributes and approver, consulted and informed roles to steps, then set connector handles |
| Build the future state | The same on the Future State tab, with executors set to Automation or AI Agent and notes carrying the pain point resolved |
| Update step status | Update a workflow's steps from Draft to Testing to Live |
| Share the maps | Create a shared view per team from the sections in scope |
| Log a decision | Create a changelog entry with body, owner and status, then add the steps and tools it touches, then set its current state, future state and future state exclusions |
| Read the costs | Read duration, frequency and role rates per step; read an entry's cost analysis |
| Tag the steps | Read the tag groups and tags, create the starter set when there is none, link tags to steps |
| Comment on the map | Post a question, pain point, idea, decision or note on a step or section, reply in its thread, resolve it |
| Read the comments | List comments by step, section, type or resolved flag: the open questions, the open pain points |
| Watch a tool | List the steps that use a tool, across the workspace |
| Staff the map | Set each role's status and type, and each person's Details; list the open seats (planned, hiring) and who has left (inactive) |
| Track the build | Put the build's to-dos on its steps as tasks, mark them done as the build lands |
| Organise the tabs | List, create and rename sidebar folders, and put tabs in them |

The `build-puzzle-process` skill (from the puzzle-skills plugin) carries the full procedure for building a map that is complete in one shot: one intake round, a proposed map in chat, one create call, the handle pass, the visual check, and the changelog entry.

## Comments, tags and the cost analysis

The tools behind the three newer rows above.

**Comments.**

- `create_comments`: `body` in Markdown, `type` question, idea, pain_point, decision or note. `step_id` or `section_id` starts a new thread; `parent_id` replies in an existing one.
- `list_comments`: filters `resolved`, `type`, `section_id`, `step_id`, `top_level`, `query`. Check a step's threads before starting a new one.
- `update_comments`: anyone can set `resolved`; only the author can change the `body` or the `type`.
- Comments post as the connected user and send no notifications. Older workspaces hold comments of type `build_request`: the MCP reads them but can't write that type.

**Tags.**

- `list_tag_groups` and `list_tags` to read what the client already has; `create_tags` and `update_tags` to add or change them.
- `link_to_steps` with type tag to tag steps; `unlink_from_steps` with type step_tag to remove one. `list_steps` with `tag_id` lists the steps carrying a tag.

**The changelog's current state, future state and cost analysis** (Optimizer plan).

- `create_changelog_entries` takes no sources. Set them right after with `update_changelog_entries`: `add_current_state_section_ids` or `add_current_state_tab_ids`, `add_future_state_section_ids` or `add_future_state_tab_ids`.
- `future_state_exclude` and `current_state_exclude`, each {statuses, tag_ids}, leave steps out of that side (both can also go on the create call). Each replaces its whole filter. Exclude by status first (Archived, Draft); use a tag only for a scope cut.
- A section or tab can sit on both sides only while the two filters differ: the same tab as the future side whole, and as the current side without its proposed Draft steps. With separate Current State and Future State tabs, the current side needs no filter.
- `list_changelog_entries` with `current_state`, `future_state` and `cost_analysis`: labor, tool, total and hours, monthly and annual, per side, and the net (negative is a saving). `has_current` and `has_future` say whether each side is set. A zero total on a side that has steps means missing inputs, not a free process.
- The entry's title is the body's first H1. Keep the heading text on the same line as the `#`, or the entry reads "Untitled".

## Roles, people, tasks and tab folders

The tools behind the three newest rows above.

**Roles and people.**

- `create_org_structure` and `update_org` take a role's `status` and `type`. Status is one of five: `draft` (the default, not reviewed), `planned` (decided, nobody in it yet), `hiring`, `filled` (someone holds it), `archived`. The old values `future` and `open` are refused; use `planned`. Type is `internal` (default) or `external`, for a seat an agency, contractor or vendor holds. `list_roles` filters by both and returns them with `include: ["status", "type"]`. Roles that existed before status did were set to `filled` if someone held them and `draft` if not.
- `create_people` and `update_people` take `active` (true Active, false Inactive), `phone`, `location`, `time_zone` (an IANA name such as `America/Chicago`), `start_date` and `end_date` (`YYYY-MM-DD`). Pass `""` or `null` to clear one. `list_people` filters by `active` and returns the fields when included.
- Someone who has left: `active: false` with an `end_date`, out of their roles with `remove_role_ids`, and each of those roles set to `hiring` or `planned`. Never deleted.

**Tasks.**

- `create_tasks` with `name` and a `step_id` or `section_id`; `update_tasks` with `completed: true` to mark one done (or false to reopen), or a new `step_id` or `section_id` to move it; `list_tasks` with `completed: false` for what is outstanding.

**Tab folders.**

- `list_tabs` with `include_folders: true` returns the folders as rows with `type: "folder"`; tabs carry `folder_id` (null at the top level) and `position`.
- `create_tab` and `update_tab` take `folder_id` (a folder on the same canvas, or null for the top level) and `position`. `create_tab_folder` and `update_tab_folder` create, rename and reorder folders. Removing a folder moves its tabs to the top level, and no Bot deletes, so that one is the client's to do in the app.

**Subflows.** `update_workflow` and `create_process` take `target_section_id: null` to clear the section a subflow step runs, when that section is gone and its replacement isn't built yet.

## The write rule

Every Bot reads. Four write, and only after you approve the proposal in chat: the Current State Mapper (current state, roles with status and type, people with their Details, tags, question and pain point comments), the Process Architect (future state, planned roles it needs, idea comments and replies on pain points), the Build Specialist (step status, build tasks, question comments on build blockers), the Change Manager (changelog with both state filters, decision comments). Nothing else writes. No Bot deletes.

## If you don't use Puzzle yet

A free workspace at [puzzleapp.io](https://puzzleapp.io) is enough to run the team on one client. The Bots don't need a paid plan to start; they need the four canvases, the two tabs, costing inputs on the steps, and the changelog. The changelog's cost analysis needs the Optimizer plan; without it the Impact Analyst costs from the steps with cost-a-process's own model.
