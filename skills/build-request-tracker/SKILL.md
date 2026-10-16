---
name: build-request-tracker
description: "Keep the build request tracker for an engagement: every request from the recaps with its source call, workflow, system, status, and the decision it depends on, plus the build spec per workflow, the test plan, and the Loom walkthrough script. Use when the Build Specialist or the consultant asks to log a build request, write a build spec, prepare a test plan, script a walkthrough, or see what is left to build."
---

# Build request tracker

The tracker is the single list of what is being built, where each item came from, and what it is waiting on. The build spec is what the human configures from. The test plan is what Test and Iterate runs. The Loom script is how the build gets reviewed and taught.

Read `context/glossary.md` (build request, change request, request window) and `context/clients/<client>/engagement.md` (request window dates, systems in scope) first.

## The tracker
A sheet in the client's Drive folder, mirrored as step status in the workspace.

| Column | Meaning |
|---|---|
| ID | BR-001 and up, per engagement |
| Request | One line, the client's words where possible |
| Source | Call type and date, with the transcript timestamp |
| Workflow | The section in the workspace |
| Step(s) | The step ids it touches, once mapped |
| System | Where it gets built |
| Type | New build, change to a build, data, training, out of scope |
| Status | Logged, Needs decision, Approved, In build, In testing, Live, Declined, After window |
| Depends on | A decision, another request, a client prerequisite |
| Owner | The consultant, or the client person who owes a prerequisite |
| Logged by | The Recap Writer's extraction block, or the consultant |

Requests that arrive after the request window closes are logged with status After window and flagged to the Change Manager. They never move to In build without a decision from the consultant.

## Procedure: logging
1. Take the extraction block from each recap. One row per build request.
2. Match each to a workflow and, once the future state map exists, to step ids.
3. Set Depends on where the request needs a decision, a prerequisite or another build.
4. Flag duplicates against existing rows; keep one, note the second source.
5. Propose the new rows in chat; write them after the consultant's OK.

## Procedure: the build spec (per workflow)
From the future state map. The human configures from this, so it is complete.

```
# Build spec: <workflow> in <system>
Future state section: <id>. Requests covered: BR-...

## Objects and fields
| Object | Field | Type | Required | Source of truth | Notes |

## Automations
| Trigger | Condition | Action(s) | System(s) | Step(s) | Failure handling |

## Integrations
| From | To | What moves | Direction | Platform (Zapier/Make/n8n/native) |

## Views, forms, templates
- ...

## Client prerequisites (before build can start)
- <what>, owned by <who>, due <date>

## Test cases
| # | Scenario | Steps | Expected result | Pass/fail |

## Open questions
- ...
```

## Procedure: the test plan
One row per test case across the workflow's builds, ordered as the workflow runs. Each case names the step, the role who tests it, the input to use, and the expected result. Add the exception paths from the interview guide. The Test and Iterate call runs the plan; the Recap Writer records the results and the new requests.

## Procedure: the Loom script (per finished build)
Under three minutes per workflow. For each step in run order: what the step does, who does it, in which tool, what to click, what to type, what happens next. Open with the pain point it resolves. Close with where to ask for help. Written for the client's affected team, used first for the consultant's internal review.

## Rules
- Nothing in the tracker is marked Live without the consultant's OK, and the workspace step status follows the tracker, never the other way.
- A request that changes scope is a change request. It goes to the Change Manager, not into a build.
- The spec names what the human must verify in the system. It never claims a feature the vendor page does not show.
