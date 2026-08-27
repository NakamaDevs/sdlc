# LINEAR

Companion guidance extracted from the SDLC document.

This file is the focused reference for issue, milestone, ownership, status, progress, and review tracking.
## Project management and Linear-style tracking

Use the available project-management system.

The examples below use Linear terminology.

The process applies to any equivalent tool.

### Work-item requirements

Every planned item must have:

- a clear title;
- one owner;
- one project;
- one milestone or parent goal;
- scope;
- acceptance criteria;
- test requirements;
- dependencies;
- current status;
- document links;
- known risks.

### Status rules

Use statuses that reflect reality:

- planned work stays queued;
- active work moves to `In Progress`;
- completed implementation moves to review;
- approved work moves to merge or release;
- blocked work records the exact blocker;
- completed work moves to `Done` only after acceptance passes.

Do not move an item to completion because the code looks finished.

### Comment and update rules

Post an update after:

- research completion;
- specification changes;
- reproduction;
- RED evidence;
- implementation progress;
- GREEN evidence;
- review findings;
- quality-check completion;
- a meaningful group of completed tasks;
- a blocker;
- milestone progress.

Each update should state:

- the answer or current result;
- what changed;
- evidence;
- remaining risk;
- decision or recommendation;
- owner;
- current status.

Use STE or STS for the prose.

Keep commands, paths, identifiers, and error messages exact.

Do not hide failures.

### Milestone rules

Group related work into logical milestones.

Each milestone must have:

- an outcome;
- child tasks;
- dependencies;
- acceptance evidence;
- current progress;
- known blockers;
- completion criteria.

Update the milestone after a meaningful group of tasks completes.

Keep milestone progress aligned with child-task status and evidence.

