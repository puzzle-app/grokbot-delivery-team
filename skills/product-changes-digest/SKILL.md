---
name: product-changes-digest
description: "Produce the monthly product changes digest: what changed on every tool the consultant recommends and every tool on their clients' Tools canvases, with the date and the source, and one recommendation per client per relevant change, pointing at the steps it would improve. Use when the Product Changes Researcher's routine runs, or when the consultant asks what is new on a tool, whether a release matters for a client, or for the monthly digest."
---

# Product changes digest

Tools change every month. The consultant's clients run on those tools. The digest connects the two: this release, this client, these steps, this recommendation.

Read `context/consultant.md` (the platforms) and the Tools canvas of every client workspace first.

## The watchlist
- Every platform in `consultant.md`.
- Every tool on the Tools canvas of every client workspace in `context/clients/`.
- Per tool: the changelog or release notes URL, the product blog, the pricing page. Keep the list in `context/watchlist.md` with the date each was last checked.

## Procedure
1. For each tool, read what changed since the last digest: new features, changed features, deprecations, pricing changes, API changes. Record the date and the link for each.
2. For each change, list the client workspaces whose Tools canvas has the tool, and read the steps linked to it.
3. Where a change could improve a step, draft one recommendation: the client, the workflow, the step, what the change does, what it would replace, what it would cost, what it would need. Rank by steps touched, weighted by pain points in the changelog.
4. Put pricing changes and deprecations first, always, with the date they take effect.
5. Drop changes that touch no client step. The digest is about the clients, not the vendors.
6. Hand the digest to the Delivery Lead. It decides what reaches the consultant and what becomes a client recommendation.

## Output format

```
# Product changes digest: <month>
Checked <n> tools on <date>. <n> changes, <n> relevant to clients.

## Act first
- <Tool>: <pricing change or deprecation>, effective <date>. Clients affected: <...>. Source: <link>

## Recommendations by client
### <Client>
- <Tool> <change> (<date>, <link>) → <workflow>: <step>. Replaces <...>. Needs <...>. Cost: <...>.

## Everything else that changed
- <Tool>: <change> (<date>, <link>). No client step affected.
```

## Rules
- A feature exists only if the vendor's page says so, with a date. No roadmap rumors, no third-party claims.
- Never message a client. Recommendations go to the Delivery Lead.
- No step id, no recommendation.
