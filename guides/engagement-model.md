# The engagement model

[Back to the team](../README.md)

The default method the team runs. Seven phases over about ten weeks, two sign-off gates, one request window, one month of support after launch. Change it in `context/consultant.md` if yours differs; the Delivery Lead enforces whatever is written there.

## Scope in units

An engagement is scoped by counting five things. The task list, the price and the calendar all scale from them.

| Unit | What it counts |
|---|---|
| Account | The client. Kickoff, the deck, the Innovation Report happen once per account |
| Project contact | A person who walks you through current state and signs off on future state. One mapping call per contact |
| Workflow | A process in scope. One section in the workspace, one build, one Loom |
| Team | A department or group whose workflows are in scope. One training, one office hours, one shared view |
| System | A primary database or platform you configure or migrate. One audit, one vet-and-demo, one migration |

Two kinds of people on the client side. **Project contacts** supply the expertise, do the homework, give feedback on builds, and attend every meeting. The **affected team** is everyone who works in the workflows: they submit pain points through the survey, give feedback in Test and Iterate, get trained, and join office hours.

## The phases

| Week | Phase | Meetings | What the Bots produce | What the human does |
|---|---|---|---|---|
| 0 | Onboarding | Kickoff with project contacts | Reply to the kickoff email, the Updates & Deliverables deck from your template, every call on the calendar, the kickoff follow-up with the current state survey | Hosts the kickoff |
| 1 to 2 | Current State Discovery | One mapping call per project contact | Interview questions per contact, recap per call, current state map per workflow, shared view per team, the weekly update | Hosts the calls. Audits the current systems |
| 3 | Propose Future State | One call per team | Tech stack research and cost comparison, future state recommendation per workflow, future state map, prototype spec, Quantification of Impact, recap | Vets and demos the tools. Hosts the call. **Gate 1: the client signs off on the future state** |
| 4 to 5 | Build Future State | None | Build spec per workflow, build request tracker, Loom walkthrough script per build | Configures the systems |
| 6 to 7 | Test and Iterate | One call per team | Test plan, recap per call with build requests, finalization list, finalized future state maps | Hosts the feedback calls. Finalizes the builds |
| 8 | Future State Demo | One call per team | Recap with the request window closed and the training homework, the Innovation Report | Hosts the demo. **Gate 2: the client signs off on the builds.** Request window closes |
| 8 | Data Migration (optional) | None | Source list, export review with risks, field mapping, converted data, import file and error log | Exports and imports |
| 9 | Training | One training per team, recorded | Training deck, Loom script per workflow, post-training email | Presents and records |
| 10 | Roll Out and Support | Two 30-minute launch Q&A sessions, a 50-minute check-in at 45 days | Rollout email with the documentation, office hours recap, final before-and-after recap, 45-day check-in agenda | Hosts office hours and the check-in |
| 11 to 14 | Ongoing Support (one month) | Tactical meetings as agreed | Workshop recaps, request board updates | Runs the meetings |

The request window opens at kickoff and closes at the Future State Demo. Requests after that are logged by the Change Manager and need a decision before they reach a build.

## Internal reviews

Before each client call there is an internal review: current state maps before they are sent, the future state before it is proposed, the builds before Test and Iterate, the demo before it is held. The Delivery Lead preps them. If you work solo, the review is you reading what the Bots produced, with the decisions listed first.

## The weekly update

Every week, per team: what was accomplished, what's next, the risks, the meetings scheduled and not scheduled, the homework outstanding. It lives on the deck and goes to the client as a draft. It is the one artifact a client reads every week, so it is never skipped.

## Memorialize twice

Every call becomes a recap email to the client and, where a decision was made, a changelog entry in the client's workspace. The email is for the client's memory. The changelog is the roadmap of the build and the record of why, and the Impact Analyst counts from it at the end.

## Core principles

Written for the client at kickoff, and the lens every Bot designs through.

- **Define it.** Terminology, phases and stages get defined with their criteria so there is one shared understanding.
- **Measure it.** Current state is quantified before any decision about future state.
- **Consider the trade-offs.** There is no solution for every pain point. Decisions solve for the most important ones and name what was given up.
- **Refer to the truth source.** One place for each kind of information. No duplicate documentation.
- **Change never stops.** Processes are built to adapt without being thrown out.
- **Maintain the system.** Small iterations are expected. Everyone should feel confident making them or escalating them.
- **Inputs and outputs.** Improving a process means fewer inputs and more outputs, and both get measured.
- **Automation where necessary.** Automation removes time and clicks. Some work needs a human, and automation is not always the answer.

What the team listens for on every call: pain points, inputs, outputs, data entry, definitions, opportunities for automation, and how long each step takes.
