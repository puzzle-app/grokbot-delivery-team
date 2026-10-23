# Send the work to Claude Code

[Back to the team](../README.md)

Grok Bot is good at running a team: clear jobs, group chats, reliable scheduled tasks. For the work itself (a map in Puzzle, a recap in your format, a report, a deck, a build spec), Claude Code with the puzzle-skills plugin and the skills in this repo does a better job, and its subscription is cheaper than Grok Bot credits. So Grok Bot orchestrates, and Claude Code does the work.

## Install the puzzle-skills plugin first

The fifteen skills that make Claude Code competent in a Puzzle workspace (read the map, build a process, interview for one, map the team, tools, data and assets, log a decision, cost a process, find what to improve, audit, share, brief a role, change impact, evaluate the stack) live in [puzzle-skills](https://github.com/puzzle-app/puzzle-skills), not in this repo. Install them once on the Mac where Claude Code runs:

```bash
claude plugin marketplace add puzzle-app/puzzle-skills
```

```bash
claude plugin install puzzle-skills@puzzle-skills --scope user
```

They load as `puzzle-skills:<name>`, for example `puzzle-skills:build-puzzle-process`, and `claude plugin update puzzle-skills@puzzle-skills` pulls new versions. This team's notes on them (which tab, which context file, who confirms what) are in [context/puzzle-skills-notes.md](../context/puzzle-skills-notes.md); the Chief of Staff names that file as an input whenever a unit of work uses one of these skills.

## The handoff

Any Bot that needs something produced hands the Chief of Staff a unit of work with four parts:

| Part | Example |
|---|---|
| Outcome | The current state recap for Tuesday's call with the finance team, in my format |
| Inputs | The transcript, the survey entries for that team, the client's workspace |
| Skill | `recap-email` (from this repo), or `puzzle-skills:build-puzzle-process` (from the plugin) |
| Limits | Draft only, no sending, no numbers I haven't confirmed, mention each topic once |

When the skill is one of the puzzle-skills, the inputs include `context/puzzle-skills-notes.md`.

## How the Chief of Staff runs it

1. It starts Claude Code in a persistent terminal session (tmux) inside this repo, with one git worktree or branch per task.
2. It sends the outcome, inputs, skill and limits as one prompt, waits, and reads the result.
3. It brings you the file, the draft or the branch to review.

Because these are ordinary terminal sessions, you can attach at any time to watch, interrupt or take over. When you have something specific to build, open the terminal and work with Claude Code directly.

## Where it runs

Delivery work runs on your Mac. That is where your Drive, your call recorder, your Gmail and your Puzzle workspaces are logged in, and where Claude Code's MCP connections to them live. Grok Bot reaches it through local execution, and each command asks for your approval until you allow it in the settings.

Keep Claude Code logged in on the Mac itself, so your subscription never passes through the chat. Never give any Bot access to a client's production system.

## Skills

Claude Code runs two sets. The fifteen puzzle-skills come from the plugin above and are the same text for every consultant; this repo never copies them. The six skills in [skills/](../skills/) (recap-email, recap-support-calls, innovation-report, build-request-tracker, training-deck, product-changes-digest) were written for this team and are discovered through `.claude/skills`, which links to that folder; `recap-support-calls` comes from Puzzle's own consulting practice with its specifics turned into variables. Each `SKILL.md` says what it produces, what it needs, and the procedure. The Foreman asks Claude Code to write new ones in `skills/` when a Bot needs a deliverable no skill covers; it never rewrites a puzzle-skills skill, it adds a note in `context/puzzle-skills-notes.md`.

## No Claude Code yet?

The team still works. Delete the "hand it to the Chief of Staff" line from a Bot's instructions and it does the work itself, inside Grok Bot. You can add the handoff later, one Bot at a time.
