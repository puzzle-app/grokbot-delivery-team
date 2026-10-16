# Quantification of Impact: Northstar Home Services (synthetic)

From the Puzzle workspace on 2026-03-12. Rates: client-supplied. Figures in USD per month unless stated. Projection; measured at the 45-day check-in. Produced by the Impact Analyst with the `quantify-impact` skill for gate 1.

## Summary
| | Current state | Future state | Net per month |
|---|---|---|---|
| Labor | $6,840 | $2,410 | $4,430 |
| Tools | $310 | $545 | ($235) |
| Total | $7,150 | $2,955 | $4,195 |

Hours returned per month: 112. One-time costs (build, migration, training): $11,800. Payback: 2.8 months.

## By workflow
### Inbound call to booked job
| Step | Executor now → future | Role | Min × runs/mo | Rate | Labor now | Labor future |
|---|---|---|---|---|---|---|
| Answer and capture the call | Person → Person | Office Manager | 6 × 260 | $38 | $988 | $988 |
| Type the job into the sheet | Person → Automation | Office Manager | 4 × 260 | $38 | $659 | $0 |
| Create the customer in HubSpot | Person → Automation | Office Manager | 3 × 180 | $38 | $342 | $0 |
| Find a slot on the whiteboard | Person → Person | Office Manager | 5 × 260 | $38 | $823 | $329 (2 min on the board) |
| Confirm by text | Person → Automation | Office Manager | 2 × 260 | $38 | $329 | $0 |
Tools now: Google Sheets $0, HubSpot $50 allocated share. Tools future: Workiz $120 allocated share, HubSpot $50. Net: $1,774. Scenario: changelog entry 14.

### Dispatch and day-of changes
| Step | Executor now → future | Role | Min × runs/mo | Rate | Labor now | Labor future |
|---|---|---|---|---|---|---|
| Build the day's route | Person → Person | Dispatcher | 25 × 22 | $32 | $293 | $117 |
| Notify techs | Person → Automation | Dispatcher | 10 × 22 | $32 | $117 | $0 |
| Day-of change | Person → Person + Automation | Dispatcher | 8 × 132 | $32 | $563 | $141 |
| Office status check | Person → Person | Office Manager | 3 × 264 | $38 | $502 | $28 |
Tools now: $0. Tools future: Workiz $130 allocated share. Net: $1,059. Scenario: changelog entry 15.

### Job completion to invoice
| Step | Executor now → future | Role | Min × runs/mo | Rate | Labor now | Labor future |
|---|---|---|---|---|---|---|
| Tech sends photos and notes | Person → Person | Technician | 6 × 240 | $41 | $984 | $328 (close in app) |
| Retype into QuickBooks | Person → Automation | Office Manager | 7 × 240 | $38 | $1,064 | $0 |
| Email the invoice | Person → Automation | Office Manager | 2 × 240 | $38 | $304 | $0 |
| Match the payment | Person → Person | Bookkeeper | 3 × 240 | $45 | $540 | $540 |
Tools now: QuickBooks $90 allocated share. Tools future: Workiz $110, QuickBooks $90, Zapier $45. Net: $1,319. Scenario: changelog entry 16.

### Warranty callbacks
| Step | Executor now → future | Role | Min × runs/mo | Rate | Labor now | Labor future |
|---|---|---|---|---|---|---|
| Find the original job | Person → Person | Office Manager | 9 × 18 | $38 | $103 | $11 (search in Workiz) |
| Book the callback | Person → Person | Office Manager | 5 × 18 | $38 | $57 | $23 |
| Tell the dispatcher | Person → Automation | Office Manager | 2 × 18 | $38 | $23 | $0 |
Tools: HubSpot $20 → Workiz $30. Net: $139. Scenario: changelog entry 17.

## Steps missing costing inputs (not estimated)
- Job completion to invoice: "Chase a missing photo": frequency unknown. Priya estimated "a few times a week"; not used.
- Warranty callbacks: "Argue about whether it's covered": duration unknown. Not used.

## Assumptions and sources
- Runs per month from the job log export (1,912 jobs over 7.4 months, 258 per month, rounded per workflow).
- Workiz pricing from workiz.com/pricing on 2026-03-10, 8 users. Zapier Starter from zapier.com/pricing on 2026-03-10.
- One-time costs from the signed SOW.
- Labor at role rates supplied by Dana on 2026-03-06. Allocated tool shares weighted by duration × frequency per the glossary.
