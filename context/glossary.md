# Glossary

[Back to context](README.md)

The standard vocabulary. Every Bot, every skill and every deliverable uses these words. When a Bot or a skill uses a different word for one of these, it is wrong, not the glossary.

## The workspace

| Term | Meaning |
|---|---|
| Workspace | One Puzzle workspace per client. The client's map, status board and record. |
| Canvas | One of the four connected views of a workspace: Workflow, Team, Tools, Data Model. |
| Tab | A page on the Workflow canvas. The team uses two: Current State and Future State. |
| Section | One workflow (process) on a tab. Never split a workflow across sections. |
| Step | One activity in a section. Verb first, four to eight words. |
| Step type | What kind of step it is: a task, a conditional (a question with labeled outcomes), a delay (an explicit wait), a go-to (a jump to a step more than three steps away), a terminator (an end with no role or tool). |
| Executor | Who or what performs the step: Person, Automation, or AI Agent. |
| Status | Where a step is in the build: Draft, In Progress, Testing, Live, Archived. |
| Trigger | What starts a workflow. Always the first step of the map. |
| Handoff | A step where work passes from one role or team to another. Counted in the Innovation Report. |
| Role | A job on the Team canvas, with an hourly rate. Steps are owned by roles, never by people. |
| RACI | The roles on a step: responsible (does it), approver, consulted, informed. Every Person step has a responsible role. |
| Team | A department or group on the Team canvas. |
| Project contact | A client person who supplies the expertise and signs off. Counted as a unit. |
| Affected team | Everyone who works in the workflows in scope. Surveyed, trained, supported. |
| Tool | A system on the Tools canvas, with its cost. |
| Entity, attribute | A data object in a tool and its fields, on the Data Model canvas. A step reads or writes attributes. |
| Duration, frequency | Minutes per run and runs per month on a Person step. The costing inputs. |
| Process costing | Duration times frequency times the role's hourly rate per step, plus the allocated tool cost, rolled up per section. |
| Cost scenario | The Cost tab on a changelog entry: current state and future state side by side, with the net. One scenario per entry. |
| Changelog entry | A record in the workspace of a decision, with an owner, a status (idea, planned, in progress, completed), the rationale, and links to the steps and tools it touches. |
| Shared view | A public, curated subset of the workspace, sent to a team. |
| Vendor record | The consultant on the client's People canvas, so entries have an owner. |

## The engagement

| Term | Meaning |
|---|---|
| Unit | One of the five things an engagement is scoped by: account, project contact, workflow, team, system. |
| Phase | One of the seven: Onboarding, Current State Discovery, Propose Future State, Build Future State, Test and Iterate, Future State Demo, Training, Roll Out and Support. Data Migration is optional and sits beside the build. |
| Gate | A client sign-off the engagement cannot pass without. Gate 1 after Propose Future State. Gate 2 after the Future State Demo. |
| Request window | The period when build requests are accepted. Opens at kickoff, closes at the Future State Demo. |
| Build request | A specific change the client asks for, logged with its source call, workflow, status and the decision it depends on. |
| Change request | A request that changes scope, or arrives after the window closes. Needs a decision before it reaches a build. |
| Homework | A task owned by a named person, on either side, with a deliverable. |
| Pending / On Hold | Discussed, not decided, waiting on homework or information. |
| Internal review | The read-through before each client call: current state maps, the future state, the builds, the demo. |
| Weekly update | Per team: accomplished, next, risks, meetings scheduled and not, homework outstanding. On the deck, to the client as a draft. |
| Recap | The email after every call: what was reviewed, decided, built, pending, and who owes what. |
| Current state survey | The questionnaire the affected team fills before discovery: their steps, tools, time and pain points. |
| Interview guide | The questions per project contact for a mapping call, built from the survey and the scope. |
| Future state recommendation | Per workflow: the change, the rationale, the trade-off, the build, the homework. |
| Prototype | What gets built in the recommended system to show at the Propose Future State call. |
| AI Opportunity Roadmap | Every automation and AI opportunity ranked, with prerequisites and the phase it lands in. |
| Quantification of Impact | Current state cost, future state cost, and the difference, from Puzzle's costing and scenarios, at gate 1. |
| Innovation Report | After the demo: what was introduced and what was resolved, by department or by tool. |
| Build spec | Per workflow: system, objects and fields, automations and triggers, integrations, test cases, client prerequisites. |

## The Innovation Report metrics

Each has a definition and a before value, or it isn't a metric.

| Metric | Definition |
|---|---|
| Automated steps | Steps the system takes instead of a team member. Executor is Automation. |
| AI agent steps | Steps an AI agent takes. Executor is AI Agent. |
| Handoff automations | Handoffs between roles or teams that now happen without a person. |
| Tools per workflow | Average number of tools a team member touches to complete a workflow. |
| Digitized workflows | Workflows that ran in email, meetings or on paper and now run in a system. |
| Workflow visibility | Workflows where another team can see status without asking. |
| Pain points resolved | Pain points from discovery that a changelog entry marks resolved. |

## The team

| Term | Meaning |
|---|---|
| Bot | One Grok Bot agent with one job. |
| Lane | Coordination (the Delivery Lead, Recap Writer, Trainer) or Architecture (the mappers, researchers, architect, analyst, builder, cleaner). |
| Unit of work | What a Bot hands the Chief of Staff for Claude Code: outcome, inputs, skill, limits. |
| Skill | A procedure in `skills/` that Claude Code follows to produce one kind of deliverable. |
| The five human things | Hosting the calls, auditing the client's systems, vetting and demoing tools, configuring the systems, delivering the training. |
| Drafts only | The default output of every Bot. Nothing goes out without the consultant's yes on that item. |
