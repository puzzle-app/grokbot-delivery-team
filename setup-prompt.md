# The Grok Bot import

A Grok Bot can create other Bots, group chats and routines from its chat. This prompt uses that to build the whole delivery team in one go, after eight questions about how you work.

1. In Grok Bot, create a new Bot and call it **Chief of Staff**.
2. Paste the prompt below into its chat.
3. Answer its questions. It creates the rest and tells you what it couldn't do.

```text
Set up my Grok Bot delivery team from github.com/puzzle-app/grokbot-delivery-team.

1. Read README.md, guides/rules.md and every file in agents/ and context/.
   The raw files are at
   https://raw.githubusercontent.com/puzzle-app/grokbot-delivery-team/main/<path>
2. Ask me these 8 questions in 1 message, then wait for my answers:
   - Who I am: my name, my firm, and whether I work solo or split the
     work (one person hosts calls and builds, another writes to the client)
   - The platforms I'm expert in and recommend, by category (CRM, project
     management, automation, industry systems), and the ones I refuse
   - The industries I serve: specialized or agnostic, and the regulated
     parts that constrain how I design a process
   - The clients I serve: typical size, team count, and the roles I sit
     across from
   - The engagements I sell: current state audit only, full build, data
     migration, ongoing support, or combinations
   - My method: the seven-phase default in guides/engagement-model.md or my
     own, where the client signs off, and my request-window policy
   - My stack: call recorder, automation tools, file store, email,
     calendar, and whether I keep one Puzzle workspace per client
   - My boundaries: where Claude Code runs for me, anything the Bots may
     never touch beyond the defaults in guides/rules.md, and which Bots I
     want now (default: all of them, Data Cleaner off)
3. Write my answers into context/consultant.md using context/consultant.template.md.
   Leave unknown facts empty. Never invent a platform, an industry or a rate.
4. Take on the Chief of Staff instructions from agents/01-chief-of-staff.md.
5. Create each Bot I picked, with its name and the instructions block from
   its file, adapted to my answers. Keep every rule about approvals, client
   systems, spend and connectors exactly as strict as written.
6. Create a group chat called Delivery Room with the Chief of Staff, the
   Delivery Lead and every specialist I created.
7. Create 2 routines: the Chief of Staff, weekdays at 08:00 in my time zone,
   the morning status note; the Product Changes Researcher, the first
   weekday of each month, the product changes digest. No other routines.
8. Show me what you created, and anything you couldn't create, with the
   step I need to do in the app.

During setup, don't connect any tool, send any message, write to any
workspace or spend credits.
```

After setup, connect your tools in Grok Bot's settings. Each Bot's instructions already say which connectors it may use, because Grok Bot has no per-Bot connector switch.

On the Mac where Claude Code runs, install the puzzle-skills plugin once, so the Bots can hand Claude Code the map, build, interview, decision, costing and opportunity work:

```bash
claude plugin marketplace add puzzle-app/puzzle-skills
```

```bash
claude plugin install puzzle-skills@puzzle-skills --scope user
```

The skills then load as `puzzle-skills:<name>`. The Chief of Staff names `context/puzzle-skills-notes.md` as an input whenever a unit of work uses one of them; the file holds this team's notes on each.

Some things the Bots need are collected later, by the Bot that needs them, the first time it works: the Recap Writer asks for a recap you were proud of and your opener and closer; the Impact Analyst asks where your labor rates come from and whether clients see dollar figures; the Trainer asks for your deck template; the Current State Mapper asks for your map conventions; the Change Manager asks who owns changelog entries on client workspaces.

## Prefer to do it by hand?

Create each Bot in the app and paste the instructions block from its file in [agents/](agents/). Start with the Chief of Staff, the Delivery Lead and the Recap Writer; the others can wait until an engagement needs them. Fill [context/consultant.template.md](context/consultant.template.md) yourself and save it as `context/consultant.md`.
