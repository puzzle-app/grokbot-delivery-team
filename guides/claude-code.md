# Send the work to Claude Code

[Back to the team](../README.md)

Grok Bot is good at running a team: clear jobs, group chats, reliable scheduled tasks. For the work itself (a map in Puzzle, a recap in your format, a report, a deck, a build spec), Claude Code with the skills in this repo does a better job, and its subscription is cheaper than Grok Bot credits. So Grok Bot orchestrates, and Claude Code does the work.

## The handoff

Any Bot that needs something produced hands the Chief of Staff a unit of work with four parts:

| Part | Example |
|---|---|
| Outcome | The current state recap for Tuesday's call with the finance team, in my format |
| Inputs | The transcript, the survey entries for that team, the client's workspace |
| Skill | `recap-email` |
| Limits | Draft only, no sending, no numbers I haven't confirmed, mention each topic once |

## How the Chief of Staff runs it

1. It starts Claude Code in a persistent terminal session (tmux) inside this repo, with one git worktree or branch per task.
2. It sends the outcome, inputs, skill and limits as one prompt, waits, and reads the result.
3. It brings you the file, the draft or the branch to review.

Because these are ordinary terminal sessions, you can attach at any time to watch, interrupt or take over. When you have something specific to build, open the terminal and work with Claude Code directly.

## Where it runs

Delivery work runs on your Mac. That is where your Drive, your call recorder, your Gmail and your Puzzle workspaces are logged in, and where Claude Code's MCP connections to them live. Grok Bot reaches it through local execution, and each command asks for your approval until you allow it in the settings.

Keep Claude Code logged in on the Mac itself, so your subscription never passes through the chat. Never give any Bot access to a client's production system.

## Skills

The skills in [skills/](../skills/) are discovered by Claude Code through `.claude/skills`, which links to the same folder. Each `SKILL.md` says what it produces, what it needs, and the procedure. Three of them come from Puzzle's own consulting practice (`build-puzzle-process`, `create-changelog-entry`, `recap-support-calls`); the rest were written for this team. The Foreman asks Claude Code to write new ones when a Bot needs a deliverable no skill covers.

## No Claude Code yet?

The team still works. Delete the "hand it to the Chief of Staff" line from a Bot's instructions and it does the work itself, inside Grok Bot. You can add the handoff later, one Bot at a time.
