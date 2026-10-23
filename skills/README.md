# The skills

[Back to the team](../README.md)

The procedures the Bots hand to Claude Code. Each folder holds a `SKILL.md` that says what it produces, what it needs, the steps, and the output format. Claude Code discovers them through `.claude/skills`, which links here. The fifteen [puzzle-skills](https://github.com/puzzle-app/puzzle-skills) (read-the-map, build-puzzle-process, interview-for-a-process, log-a-decision, cost-a-process, find-automation-opportunities and nine more) come from the plugin, not from this folder; this team's notes on them are in [context/puzzle-skills-notes.md](../context/puzzle-skills-notes.md).

| Skill | Produces | Used by |
|---|---|---|
| [recap-email](recap-email/SKILL.md) | The recap draft after any call, one template per call type, plus the extraction block for the team | Recap Writer, Trainer |
| [recap-support-calls](recap-support-calls/SKILL.md) | The recap for an ongoing-support session: topics, pending, build requests, homework | Recap Writer |
| [innovation-report](innovation-report/SKILL.md) | What was introduced and what was resolved, before and after, by department or by tool | Impact Analyst |
| [build-request-tracker](build-request-tracker/SKILL.md) | The tracker, the build spec per workflow, the test plan, the Loom script | Build Specialist |
| [training-deck](training-deck/SKILL.md) | The training deck for a team from the template and the future state map | Trainer |
| [product-changes-digest](product-changes-digest/SKILL.md) | The monthly digest of tool changes with one recommendation per client per relevant change | Product Changes Researcher |

Five of these were written for this team, and `recap-support-calls` comes from Puzzle's own consulting practice with its specifics turned into variables that `context/consultant.md` fills. The map-reading, interviewing, building, decision, costing and opportunity work is done by the puzzle-skills plugin skills; install it as in [guides/claude-code.md](../guides/claude-code.md) and keep the team's notes in [context/puzzle-skills-notes.md](../context/puzzle-skills-notes.md).

The glossary in [context/glossary.md](../context/glossary.md) is the vocabulary every skill uses. When a skill and the glossary disagree, fix the skill.

Need a skill that isn't here? Ask the Foreman. It hands Claude Code a unit of work to write it, in this shape, and reviews it before it reaches you.
