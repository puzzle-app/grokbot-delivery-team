# The skills

[Back to the team](../README.md)

The procedures the Bots hand to Claude Code. Each folder holds a `SKILL.md` that says what it produces, what it needs, the steps, and the output format. Claude Code discovers them through `.claude/skills`, which links here.

| Skill | Produces | Used by |
|---|---|---|
| [read-the-map](read-the-map/SKILL.md) | Any answer from a client workspace: a process in order, owners, what runs on a tool, data per step, costs, decisions, outstanding work. Every Bot loads it first | Every Bot that reads a workspace |
| [interview-for-a-process](interview-for-a-process/SKILL.md) | The questions for one project contact's mapping call, in run order, and the listening checklist | Current State Mapper |
| [build-puzzle-process](build-puzzle-process/SKILL.md) | A complete process in the client's Puzzle workspace: section, steps, roles, tools, attributes, costing, connectors, changelog | Current State Mapper, Process Architect |
| [recap-email](recap-email/SKILL.md) | The recap draft after any call, one template per call type, plus the extraction block for the team | Recap Writer, Trainer |
| [recap-support-calls](recap-support-calls/SKILL.md) | The recap for an ongoing-support session: topics, pending, build requests, homework | Recap Writer |
| [find-automation-opportunities](find-automation-opportunities/SKILL.md) | Every automation and AI opportunity ranked, with steps, prerequisites, phase | Process Architect |
| [cost-a-process](cost-a-process/SKILL.md) | Current state cost, future state cost, net, hours returned, payback, from Puzzle's costing and scenarios | Impact Analyst |
| [innovation-report](innovation-report/SKILL.md) | What was introduced and what was resolved, before and after, by department or by tool | Impact Analyst |
| [build-request-tracker](build-request-tracker/SKILL.md) | The tracker, the build spec per workflow, the test plan, the Loom script | Build Specialist |
| [log-a-decision](log-a-decision/SKILL.md) | A changelog entry in the client's workspace with owner, status, rationale, and linked steps and tools | Change Manager |
| [training-deck](training-deck/SKILL.md) | The training deck for a team from the template and the future state map | Trainer |
| [product-changes-digest](product-changes-digest/SKILL.md) | The monthly digest of tool changes with one recommendation per client per relevant change | Product Changes Researcher |

Six skills (`read-the-map`, `build-puzzle-process`, `interview-for-a-process`, `log-a-decision`, `cost-a-process`, `find-automation-opportunities`) are the [puzzle-skills](https://github.com/puzzle-app/puzzle-skills) set, copied here verbatim with a delivery-team note under the frontmatter (the notes live in [context/skill-preambles/](../context/skill-preambles/)). Refresh them from a sibling checkout with `scripts/sync-from-puzzle-skills.sh`; edit the notes here and the skills there. The other five were written for this team, and `recap-support-calls` comes from Puzzle's own consulting practice with its specifics turned into variables that `context/consultant.md` fills.

The glossary in [context/glossary.md](../context/glossary.md) is the vocabulary every skill uses. When a skill and the glossary disagree, fix the skill.

Need a skill that isn't here? Ask the Foreman. It hands Claude Code a unit of work to write it, in this shape, and reviews it before it reaches you.
