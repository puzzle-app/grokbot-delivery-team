# Puzzle and the MCP

[Back to the team](../README.md)

The team runs on one Puzzle workspace per client. The map is the deliverable the client keeps, the status board the engagement runs on, and the context every Bot reads before it drafts. This guide says what is in the workspace, which Bot touches what, and what the Puzzle MCP lets Claude Code do with it.

## What a client workspace holds

Four connected canvases, and everything links to everything that touches it.

| Canvas | What it holds | Who fills it |
|---|---|---|
| Workflow | Tabs for Current State and Future State. One section per workflow. Steps with a type, a status, an executor (Person, Automation, AI Agent), the responsible role, the tools, the attributes read or written, the duration and frequency, and a note | Current State Mapper, Process Architect, Build Specialist (status) |
| Team | Teams, roles with hourly rates, and the people in them | Current State Mapper |
| Tools | Every system in the operation and what it costs | Current State Mapper, Tech Stack Researcher (proposals) |
| Data Model | Entities and attributes per tool, and how they relate | Current State Mapper, Data Cleaner (mapping) |

On top of the canvases:

- **Process costing.** Duration times frequency times the role's hourly rate per step, plus the allocated tool cost. The Impact Analyst's current state baseline.
- **Cost scenarios.** A Cost tab on a changelog entry: current state and future state side by side, with the net. The Impact Analyst's future state figure.
- **The changelog.** Entries with a status (idea, planned, in progress, completed), an owner from the People canvas, the rationale, and links to the steps and tools they touch. The Change Manager's record, and the source of the Innovation Report.
- **Shared views.** A public, curated subset of the workspace. How maps reach a team without giving everyone the whole operation.

## Conventions the Bots assume

- One workspace per client, connected to Claude Code as its own MCP server.
- Two tabs on the Workflow canvas named Current State and Future State. The future state is a copy that changes, never an edit of the current state.
- One section per workflow, named for the workflow. No workflow split across sections.
- Every Person step carries a responsible role with an hourly rate, a duration and a frequency. That is what makes costing work.
- Every automated or AI step in the future state is annotated with the pain point it resolves.
- A changelog entry for every decision, linked to the steps it touches, with a cost scenario when it changes cost.
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
| Log a decision | Create a changelog entry with body, owner and status, then add the steps and tools it touches |
| Read the costs | Read duration, frequency and role rates per step; read the cost scenario on an entry |
| Watch a tool | List the steps that use a tool, across the workspace |

The `build-puzzle-process` skill carries the full procedure for building a map that is complete in one shot: one intake round, a proposed map in chat, one create call, the handle pass, the visual check, and the changelog entry.

## The write rule

Every Bot reads. Four write, and only after you approve the proposal in chat: the Current State Mapper (current state), the Process Architect (future state), the Build Specialist (step status), the Change Manager (changelog). Nothing else writes. No Bot deletes.

## If you don't use Puzzle yet

A free workspace at [puzzleapp.io](https://puzzleapp.io) is enough to run the team on one client. The Bots don't need a paid plan to start; they need the four canvases, the two tabs, costing inputs on the steps, and the changelog.
