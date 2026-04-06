# Nightly Automation Protocol

Nightly automation should be task-file driven.

## Modes

- `safe`
  Only planning, validation, review, reporting, and documentation.
- `low-risk`
  Limited edits to low-risk files only.
- `task-packet`
  Execute a prepared task packet with allowed and forbidden file boundaries.

## Required Inputs

Before a nightly run, define:

- Goal
- Context
- Allowed Files
- Forbidden Files
- Validation
- Definition of Done

## Required Outputs

Every nightly run should leave:

- Outcome
- Files Changed
- Validation Performed
- Open Risks
- Suggested First Step For Tomorrow

## Safety Rule

High-risk shared-file integration stays in the main session.
