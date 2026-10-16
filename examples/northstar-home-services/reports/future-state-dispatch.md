# Future state recommendation: Dispatch and day-of changes (synthetic)

Workflow: Dispatch and day-of changes. Team: Field and dispatch. Drafted by the Process Architect, 2026-03-11, for the Propose Future State call on 2026-03-12. Future state section: `fs-dispatch` on the Future State tab.

## The change
Dispatch moves from the whiteboard to Workiz's schedule board. Day-of changes are made once, on the board, and reach the technician's phone as a push notification with the updated job card. The office sees each job's status (en route, on site, complete) from the technician's app without texting.

## Pain points this resolves
- Whiteboard changes don't reach techs already on the road (discovery, Priya, 2026-03-04).
- Dispatcher re-texts every change to every tech (discovery, Marcus, 2026-03-06).
- Office doesn't know a job is done until the tech comes back (discovery, Priya).

## Steps, current to future
| Step | Now | Future | Executor |
|---|---|---|---|
| Build the day's route | Whiteboard, 25 min, daily | Workiz schedule board with map view, 10 min, daily | Person (Dispatcher) |
| Notify techs of their jobs | Group text, 10 min, daily | Push from the board when a job is assigned | Automation |
| Make a day-of change | Erase, rewrite, text affected techs, 8 min, 6×/day | Drag on the board; the tech is notified | Person (Dispatcher) then Automation |
| Tech confirms en route / on site | Text to office, when remembered | Status tap in the app; office board updates | Person (Technician), 10 seconds |
| Office checks status | Text the tech, 3 min, 12×/day | Read the board | Person (Office Manager), 10 seconds |
| Job complete | Tech texts "done" with photos | Tech closes the job in the app with photos attached; feeds the invoice workflow | Person (Technician) |

Steps kept human: route building (judgment on travel, skills and parts), every change (judgment), closing a job (the tech is the only one who knows).

## The build it needs
Workiz: service zones, technician accounts with the mobile app, job statuses (en route, on site, complete), the schedule board views for office and dispatch. Zapier: none for this workflow; the notifications are native. See build spec BS-02.

## Trade-offs
- Techs need the app on their phones and a data plan the company pays for. Dana agreed in principle on 2026-03-06; confirm at gate 1.
- The whiteboard goes away entirely, or it becomes a mirror no one trusts. Recommendation: remove it on launch day.

## Homework for the client
- Marcus: list of service zones and the techs who cover each, by 2026-03-16.
- Dana: company phones or stipend decision, by 2026-03-13 (gate 1).

## Figures (from the Impact Analyst, projection)
Dispatcher: 25 + 10 + (8 × 6) = 83 minutes/day to 10 + (2 × 6) = 22 minutes/day. Office Manager status checks: 36 minutes/day to 2. Roughly 35 hours/month returned across the two roles. Labor rates from the client. See the Quantification of Impact.
