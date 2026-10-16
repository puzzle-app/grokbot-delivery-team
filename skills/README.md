# The skills

[Back to the team](../README.md)

The procedures the Bots hand to Claude Code. Each folder holds a `SKILL.md` that says what it produces, what it needs, the steps, and the output format. Claude Code discovers them through `.claude/skills`, which links here.

| Skill | Produces | Used by |
|---|---|---|
| [current-state-interview-guide](current-state-interview-guide/SKILL.md) | The questions for one project contact's mapping call, and the listening checklist | Current State Mapper |
| [build-puzzle-process](build-puzzle-process/SKILL.md) | A complete process in the client's Puzzle workspace: section, steps, roles, tools, attributes, costing, connectors, changelog | Current State Mapper, Process Architect |
| [recap-email](recap-email/SKILL.md) | The recap draft after any call, one template per call type, plus the extraction block for the team | Recap Writer, Trainer |
| [recap-support-calls](recap-support-calls/SKILL.md) | The recap for an ongoing-support session: topics, pending, build requests, homework | Recap Writer |
| [ai-opportunity-roadmap](ai-opportunity-roadmap/SKILL.md) | Every automation and AI opportunity ranked, with steps, prerequisites, phase | Process Architect |
| [quantify-impact](quantify-impact/SKILL.md) | Current state cost, future state cost, net, hours returned, payback, from Puzzle's costing and scenarios | Impact Analyst |
| [innovation-report](innovation-report/SKILL.md) | What was introduced and what was resolved, before and after, by department or by tool | Impact Analyst |
| [build-request-tracker](build-request-tracker/SKILL.md) | The tracker, the build spec per workflow, the test plan, the Loom script | Build Specialist |
| [create-changelog-entry](create-changelog-entry/SKILL.md) | A changelog entry in the client's workspace with owner, status, rationale, and linked steps and tools | Change Manager |
| [training-deck](training-deck/SKILL.md) | The training deck for a team from the template and the future state map | Trainer |
| [product-changes-digest](product-changes-digest/SKILL.md) | The monthly digest of tool changes with one recommendation per client per relevant change | Product Changes Researcher |

Three skills (`build-puzzle-process`, `create-changelog-entry`, `recap-support-calls`) come from Puzzle's own consulting practice, with the practice's specifics turned into variables that `context/consultant.md` fills. The rest were written for this team.

The glossary in [context/glossary.md](../context/glossary.md) is the vocabulary every skill uses. When a skill and the glossary disagree, fix the skill.

Need a skill that isn't here? Ask the Foreman. It hands Claude Code a unit of work to write it, in this shape, and reviews it before it reaches you.
