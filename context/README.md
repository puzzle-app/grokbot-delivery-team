# Context

[Back to the team](../README.md)

What the Bots read before they work. The glossary is the standard every Bot and skill uses; the consultant file is you; the client folders are each engagement.

```text
glossary.md               The terms. Every Bot and skill uses these words and no others.
consultant.template.md    The questions the setup asks. Fill it, save as consultant.md.
consultant.md             You. Ignored by git. Every Bot reads it first.
deliverables.md           What each deliverable looks like, by phase.
clients/README.md         How a client folder is laid out.
clients/<client>/         One per engagement. Ignored by git.
```

Rules for this folder:

- Unknown facts stay empty. A blank is better than a guess, and the Bots know to ask.
- `consultant.md` and `clients/` never go in a public commit. The `.gitignore` already excludes them.
- When a term in the glossary and a term in a skill disagree, the glossary wins. Fix the skill.
