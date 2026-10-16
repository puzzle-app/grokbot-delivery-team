---
name: create-changelog-entry
description: "Use this skill whenever the consultant and Claude have worked through an operational or technological decision and the decision needs to be recorded as a Puzzle Changelog entry. Trigger on phrases like \"create a changelog entry\", \"log this decision\", \"add this to the changelog\", \"record this in Puzzle\". Also proactively suggest this skill whenever the consultant and Claude have just scoped a workflow, picked or deprecated a tool, made a data model decision, chosen a stack architecture, or answered substantive client questions in a Puzzle workspace — these decisions need durable capture beyond the conversation. Captures rationale, specifications, and technical requirements; assigns owner from the People Canvas; sets status; associates relevant steps and tools. Works across all of the consultant's client workspaces."
---

> Adapted for the Grok Bot delivery team from Puzzle's own consulting practice. Read `context/consultant.md` and `context/glossary.md` first. Anything in `{{braces}}` comes from `consultant.md`.


# Create Changelog Entry

This skill creates a Puzzle Changelog entry that captures the rationale, specifications, and technical requirements behind a decision made in a Puzzle workspace. Changelogs are the durable record of WHY decisions were made — they outlive conversations and let future viewers of a workspace understand the reasoning behind the current state.

## When to use this skill

Use this skill any time a meaningful operational or technological decision has been worked through in a Puzzle workspace. Common triggers:

- A new workflow has been mapped or scoped
- A tool has been selected, added, deprecated, or migrated away from
- A data model decision was made (new entities, attributes, cross-system reference fields)
- A stack architecture was chosen (e.g., "HubSpot for demand gen, Workiz for delivery")
- A process redesign was approved
- A build phase has been planned
- Client follow-up questions have been answered with substantive architectural reasoning

If the consultant has just spent a meaningful chunk of conversation working through a decision with you, ASK whether they want a changelog entry created. Don't wait for him to ask. The pattern is:

> "This is a substantial decision — want me to capture it as a changelog entry on the [workspace] workspace?"

If you don't see the right tool, use `tool_search` to find it. Always confirm which workspace before creating the entry.

## Workflow

### Step 1 — Confirm workspace and scope

Before doing anything, confirm:

1. **Which workspace** the changelog entry belongs to (e.g., "Should this go on the [company name] workspace or another workspace?"). If only one workspace has been active in the conversation, you can name it and confirm rather than asking open-ended.

2. **What the entry covers** — summarize the decision back to the consultant in one or two sentences so they can correct scope before you write the full entry.

### Step 2 — Draft the title

The title is the first H1 heading inside the body markdown. It must be:

- **Succinct: 10–15 words maximum.** Shorter is better. Aim for 3–6 words when possible.
- **Specific enough to identify the decision** without being a full sentence.
- **Not generic** — "HubSpot Implementation" is better than "Marketing Decision"; "Migrate to HubSpot Marketing Hub" is better than "Tech Stack Update".

**Good examples:**
- "HubSpot Marketing Hub Implementation"
- "Clio to CasePeer Migration"
- "Workiz Genius Marketing Evaluation"
- "Switch to Single-Zap Closed-Loop Attribution"
- "Sensitive Field Visibility Architecture"

**Bad examples (too long, too vague, or full sentences):**
- "We decided to implement HubSpot Marketing Hub as the demand generation platform alongside Workiz" (full sentence)
- "Marketing changes" (too vague)
- "Updates to how we handle leads in the system going forward into next quarter" (full sentence + vague)

### Step 3 — Resolve the owner (person_id)

The changelog entry must be owned by a person from the workspace's People Canvas. The owner is whoever is responsible for the decision or the build.

1. Use `list_people` on the target workspace's MCP server (e.g., `companyname:list_people`) to find the person.
2. Search by name (e.g., `query: their First Name` or `query: their Last Name` or `query: Their company name"`).
3. If the record exists with his name, use that `id`.
4. If the consultant operates on the workspace as a vendor record (see `consultant.md`, "How the consultant appears on a client's People canvas"), the person record may carry the firm's name with no last name. Use that `id`.
5. If no matching person is found AND the decision is owned by someone else (e.g., a client engineer), confirm with the consultant before guessing.

### Step 4 — Set the status

The `status` field accepts exactly one of:

- **`idea`** — Decision is still being explored; nothing committed yet
- **`planned`** — Decision is made and scoped, but build hasn't started
- **`in_progress`** — Build is actively underway
- **`completed`** — Build is fully shipped and operational

Confirm with the consultant which status applies. Don't default to `planned` without checking — sometimes a changelog entry is created retroactively after something is already done (in which case `completed`), or it's just an idea being captured for later (in which case `idea`).

### Step 5 — Identify the steps to associate

The changelog should link to every workflow step in the Puzzle workspace that pertains to the change. This is what makes the changelog navigable from the workflow side later — anyone viewing those steps can see "this step is part of [decision X]."

**Two scenarios:**

**Scenario A — Step IDs are already known.** If this skill is being run at the end of a conversation where Claude already built or modified specific steps, the step IDs are in the conversation history. Use those directly.

**Scenario B — Step IDs need to be researched.** If the decision touches existing steps in the workflow canvas that haven't been called out explicitly, use `list_steps` or `list_sections` to find them. Search by section name or step name. Ask the consultant to confirm the list before associating, especially if there are ambiguous matches.

If a step ID returned from a previous part of the conversation is no longer found (e.g., it was deleted during reorganization), skip it gracefully and report which IDs failed. Don't block the changelog creation on a few missing steps.

### Step 6 — Identify the tools to associate

Tools associated with the changelog give it a "this change involves these systems" tag. Include every tool meaningfully impacted by the decision:

- The new tool(s) being introduced
- Existing tools that are being modified, extended, or bridged
- Tools that are being deprecated as part of the change

Use `list_tools` with `scope: "workspace"` to get the `account_tool_id` for each (NOT the catalogue `id`). The `create_changelog_entries` tool associates by `account_tool_id`.

### Step 7 — Write the body content

The body is markdown that will be rendered as HTML inside the Puzzle changelog UI. Use this structure as a baseline, but adapt for the decision at hand — not every section is needed for every entry:

```markdown
# [Title]

**Status:** [Idea / Planning / In Progress / Completed]
**Owner:** [Person name]
**Decision date:** [Month YYYY]
**Stakeholders:** [Anyone else with a stake in this — client contacts, vendors, team members]

---

## Summary

[2–4 sentences describing what was decided and why it matters. This is the elevator pitch. Someone reading just this paragraph should understand the gist.]

---

## The architectural principle (or core mechanic)

[ONE paragraph or short list capturing the central operating principle of the decision. For a stack architecture, this is the "X owns Y, Z owns W" rule. For a process redesign, this is the central before/after distinction. Skip this section if it doesn't apply.]

---

## Key decisions and the rationale behind each

### 1. [Decision name]
[2–4 sentences of context + the decision]

**Rationale:** [Why this was the right call. Be honest about trade-offs.]

### 2. [Next decision]
...

[Capture every meaningful decision. Number them. ALWAYS include the rationale — that's the whole point of the changelog. Decisions without rationale are not changelog entries, they're status updates.]

---

## Specifications

[Technical specs, field mappings, data model details, API behaviors, etc. Use tables or bullet lists. Skip this section if the decision is strategic rather than technical.]

---

## Open items still to resolve

[Numbered list of things that aren't yet decided. Include who needs to resolve them and any blocking dependencies.]

---

## Phase plan (if multi-phase)

- **Phase 1 ([status]):** [Scope]
- **Phase 2 ([future]):** [Scope]
- **Phase 3 ([future]):** [Scope]

---

## Reference materials

[Links to: Puzzle map sections, Loom walkthroughs, emails/documents, supporting research, related changelog entries]
```

**Critical content rules:**

1. **Always include rationale.** Every key decision needs a "why." A changelog entry without rationale is just documentation; the rationale is what makes it durable knowledge.
2. **Be candid about trade-offs.** If a decision involved choosing one option over another, name the trade-off. Future readers benefit from seeing what was weighed.
3. **Concede points where they're legitimately conceded.** If a stakeholder raised a concern that turned out to be partially right, the changelog should reflect that — not paper over it.
4. **Capture client follow-up answers if they're durable.** If the consultant answered substantive questions from a client, the answers belong in the changelog so they outlive the email thread.
5. **Cross-reference the workflow.** Reference specific step IDs, section names, or data model entities when the decision touches them. This is what makes the changelog navigable.
6. **Don't fabricate decisions or rationale.** If something is unknown, say so. If a decision was made on instinct, say that. The changelog is honest record-keeping.

### Step 8 — Create the entry

Call `create_changelog_entries` on the right workspace MCP server. Pass:

- `body`: The full markdown body
- `person_id`: From Step 3
- `status`: From Step 4

The tool returns the changelog entry `id`. Note it for Step 9.

### Step 9 — Associate steps and tools

Call `update_changelog_entries` with the `add_steps` and `add_tools` arrays. Each association needs the `change_id` (the entry ID from Step 8) plus either `step_id` or `account_tool_id`.

Steps and tools that come back as "not found" should be reported but don't block completion — log the failures clearly so the consultant can resolve them if needed.

### Step 10 — Confirm to the consultant

Report back with:

- The changelog entry title and ID
- The URL (format: `/workspaces/{workspace_id}/changelog/{id}/edit`)
- The status
- A count of associated steps and tools (and any associations that failed)
- A brief summary of the body contents (the sections included)

Example confirmation:

> Created changelog entry **#35 "HubSpot Marketing Hub Implementation"** on the [workspace name] workspace.
>
> - Status: Planned
> - Owner: Puzzle
> - Associated with: 25 workflow steps, 7 tools
> - URL: /workspaces/134/changelog/35/edit
>
> Includes summary, architectural principle, 10 key decisions with rationale, IHMS follow-up Q&A, 7 open items, three-phase plan, and reference links.

## Quality bar

A good changelog entry should pass this test: **someone landing on the workspace 6 months from now should be able to read this entry and understand not just what was decided, but why each piece was decided that way — including the trade-offs accepted, the points conceded, and the open questions still on the table.**

If the entry doesn't pass that test, expand the rationale, add the trade-offs, or capture the open items more clearly.

## Common pitfalls to avoid

1. **Title too long.** If the title is a full sentence, shorten it.
2. **No rationale.** Every decision must have a "why."
3. **Owner is wrong.** Always verify against the People Canvas. Don't default to user if the decision is owned by a client or vendor.
4. **Status doesn't match reality.** Don't mark something `planned` if it's already shipped, and don't mark something `completed` if there are still open items.
5. **Steps not associated.** A changelog entry without step associations is harder to navigate from. Always do the linking step.
6. **Tools not associated.** Same logic — tool associations make the changelog discoverable from the Tools canvas later.
7. **Glossing over trade-offs.** If a decision had legitimate trade-offs, name them. Don't sanitize the rationale.
8. **Fabricating completeness.** If something is unresolved, mark it as an open item. Don't make up a resolution.

## When NOT to use this skill

- For non-Puzzle changelogs (e.g., GitHub release notes, product changelogs for Puzzle's own product features destined for users)
- For ephemeral notes that don't represent a decision (e.g., "I read this article today" — that's not a changelog entry)
- For pure status updates without decisional content ("we shipped the feature" without any rationale or context)
- For client-facing communication — the changelog is for the operational record; client comms are separate

In those cases, redirect to the appropriate channel (docs, email, Slack, product update email skill, etc.).