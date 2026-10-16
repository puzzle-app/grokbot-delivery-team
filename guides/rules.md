# The rules that keep the team safe

[Back to the team](../README.md)

Thirteen Bots with access to your clients' Puzzle workspaces, your Drive, your inbox and your call recordings need a few hard rules. These are already in every Bot's instructions. The setup prompt keeps them exactly as strict as written.

## 1) Nothing goes out without your yes

No Bot sends, posts, schedules, writes to a client system, pays for or deletes anything without your explicit yes on that exact item. Drafts are the default output everywhere: recap emails are Gmail drafts, deck changes are proposals, changelog entries are proposed in chat before they are written.

## 2) The client's workspace is written by four Bots, after your OK

The client's Puzzle workspace is the shared memory, and every Bot reads it. Only the Current State Mapper, the Process Architect, the Build Specialist and the Change Manager write to it, each in its own part (current state maps, future state maps, step status, the changelog), and each only after you approve the proposal in chat.

## 3) Client systems are never touched

No Bot configures, changes, connects or imports into a client's system. The automation platforms are read only. The human builds. The Data Cleaner prepares files; the human imports them.

## 4) Numbers trace or they don't exist

Every figure a Bot shows a client traces to a step, a rate, a scenario or a vendor page. Where duration or frequency is missing in the workspace, the Impact Analyst says the figure is not defensible and asks. No invented rates, no invented savings, no vendor claims presented as facts.

## 5) Each Bot names its connectors

Grok Bot has no per-Bot connector switch: once you connect Gmail, every Bot could use it. So each Bot's instructions end with the only connectors it may use, and the Chief of Staff holds the team to it.

| Bot | Connectors |
|---|---|
| Chief of Staff | What the unit of work needs, plus local execution on your Mac for Claude Code |
| Foreman | Grok Bot's Bot settings, GitHub (this repo) |
| Delivery Lead | Puzzle workspace (read), Google Drive, Google Calendar (read; create only when told), Gmail drafts only |
| Recap Writer | Call recorder (read), Gmail drafts only, Google Drive, Puzzle workspace (read) |
| Trainer | Google Drive, Puzzle workspace (read), Gmail drafts only |
| Current State Mapper | Call recorder (read), Google Drive, Puzzle workspace (read and write after OK) |
| Tech Stack Researcher | Web search, call recorder (read), Google Drive and Sheets, Puzzle workspace (read) |
| Product Changes Researcher | Web search, client Puzzle workspaces (read), Google Drive |
| Process Architect | Puzzle workspace (read and write after OK), Google Drive, call recorder (read) |
| Impact Analyst | Puzzle workspace (read), Google Drive and Sheets |
| Build Specialist | Puzzle workspace (read; step status after OK), Google Drive and Sheets, automation platforms read only |
| Data Cleaner | Google Drive and Sheets, Puzzle workspace (read the data model) |
| Change Manager | Puzzle workspace (changelog read and write after OK), Gmail read only, Google Drive |

## 6) The Delivery Lead routes, it doesn't execute

The Delivery Lead plans, assigns and gates. When it starts doing the work itself, the lane gets messy fast. The same goes for the Chief of Staff: it runs units of work in Claude Code, it doesn't draft them in Grok Bot.

## 7) Scope changes are never absorbed

A request that changes scope, or arrives after the request window closes, goes to the Change Manager as a change request and comes back to you as a decision. It never reaches a build on its own.

## 8) Keep routines rare

Two routines: the Chief of Staff's weekday morning note, and the Product Changes Researcher's monthly digest. A routine earns its place only if you read what it produces every time. Before any Bot adds one, it tells you what the routine will produce and why you would read it.

## 9) Client material stays out of this repo

Transcripts, exports, recaps, reports and anything with a client's name live in the client's Drive folder and in `context/clients/`, which is ignored by git. A populated `context/consultant.md` belongs in your private working copy.
