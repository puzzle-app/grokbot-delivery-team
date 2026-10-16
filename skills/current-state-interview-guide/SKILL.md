---
name: current-state-interview-guide
description: "Prepare the questions for a current state mapping call with one project contact, from the current state survey entries and the engagement scope. Use before any current state call, when the Current State Mapper or the consultant asks to prep a discovery call, an interview, or a mapping session. Output is a guide the human runs the call from, and a listening checklist for the recap."
---

# Current state interview guide

A current state mapping call is one hour with one project contact, and the map is only as good as what that hour surfaces. This skill turns the survey entries and the scope into the questions for that hour, in the order a workflow runs, so nothing the map needs is left to a follow-up.

Read `context/consultant.md` (industries, regulated parts, map conventions) and `context/clients/<client>/engagement.md` (scope, contacts, workflows) first.

## Inputs
- The project contact: name, role, team, the workflows they own or work in.
- Their survey entries, and the entries from their affected team.
- The scope: which workflows and systems are in.
- Anything the kickoff call said about this contact's workflows.

## Procedure

1. **Read the survey entries for this contact and their team.** List every workflow mentioned, every tool, every time estimate, every pain point, every wish. Note the gaps: steps with no tool named, workflows with no trigger, pains with no step attached.
2. **Draft the walk-through per workflow, in run order.** For each workflow in scope, the guide asks the contact to walk it from the trigger to the end, and the questions below sit under each stage. Lead with "walk me through what happens when..." and ask the specifics only where the walk-through skips them.
3. **Write the listening checklist.** The seven things the team listens for on every call: pain points, inputs, outputs, data entry, definitions, opportunities for automation, and how long each step takes. The Recap Writer uses the same list after the call.
4. **Mark what is already known** from the survey so the call confirms it instead of re-asking.
5. **Keep the guide to one page per workflow.** The human runs the call; the guide is a prompt sheet, not a script.

## The questions, by stage

**Trigger.** What starts this? A form, an email, a date, a signed document, a threshold? How do you know it has started? What if it starts wrong?

**Steps.** What happens first, then next? Who does it (the role, not the person)? In which tool? What gets typed or copied, and from where? What decision gets made here, and what are the possible outcomes? Where does it wait, and on whom?

**Handoffs.** When it leaves you, who gets it and how do they find out? How do you find out it came back? What falls through?

**Data.** Which record gets created or updated, in which system? Which fields? Where else does that same information live?

**Time.** How long does this step take you, start to finish? How many times a week or month? When it goes wrong, how long then?

**Exceptions.** What are the versions of this that don't follow the path? How often? Who handles them?

**Pain.** Where does this hurt? What do you redo, chase, or work around? What would you stop doing tomorrow if you could?

**Wish.** If one step disappeared, which one? What have you tried already?

**Definitions.** Any word that came up twice with two meanings: ask for the definition and write it down for the glossary.

## Industry and compliance
Where `consultant.md` names regulated parts, add the questions that surface them: who must approve, what must be retained, what cannot be automated, what data cannot leave which system.

## Output format

```
# Current state interview: <contact name>, <role>, <team>
Client: <client> · Call: <date> · Workflows: <list>

## Already known from the survey (confirm, don't re-ask)
- ...

## Workflow 1: <name>
Trigger: ...
Walk-through prompt: "Walk me through what happens when..."
Ask if skipped: ... (one line per stage: steps, handoffs, data, time, exceptions, pain, wish)
Survey pain points to probe: ...

## Workflow 2: ...

## Listening checklist (for the recap)
Pain points · Inputs · Outputs · Data entry · Definitions · Automation opportunities · Time per step

## Open questions from the survey
- ...
```

## Rules
- Never put a fact the contact hasn't said into the guide as if known. Survey entries are "they said", not confirmed.
- Roles, not names, for who does a step. The map is owned by roles.
- One hour, one contact, their workflows only. Scope creep starts in the interview.
- The guide is a draft for the consultant; it is never sent to the client.
