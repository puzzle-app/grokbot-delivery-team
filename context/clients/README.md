# Client folders

One folder per engagement, ignored by git. Nothing in here is ever committed.

```text
clients/<client-slug>/
  engagement.md     Scope in units, the phase calendar with dates, the gates and their status,
                    the request window dates, project contacts and their roles, the workspace
                    and its MCP server name, the Drive folder, the deck link
  recaps/           One file per call, the draft as sent plus the extracted requests,
                    decisions and homework
  research/         Tech stack research, cost comparisons, product changes recommendations
  reports/          Quantification of Impact, the AI Opportunity Roadmap, the Innovation Report
  builds/           Build specs, the build request tracker, test plans, Loom scripts
  migration/        Only on engagements with a data migration: source list, review,
                    mapping, change log, error log. Exports stay in the client's Drive.
```

The Delivery Lead creates the folder and `engagement.md` at kickoff. Every Bot reads `engagement.md` before it works on that client. The example in [examples/northstar-home-services/](../../examples/northstar-home-services/) shows a populated folder.
