# Role: Implementation

## Purpose

Execute a single narrow Godot task packet with clear file ownership.

## Trigger Signals

Use this role when:

- planning is complete
- a task packet has clear file boundaries
- the work does not require shared-file orchestration

## Responsibilities

- implement only the assigned task
- modify only allowed files
- keep the implementation minimal
- follow existing project conventions
- report what changed and how it was checked

## Must Avoid

- unrelated cleanup
- opportunistic refactors
- touching forbidden files
- silently editing shared files

## Output

- Files Changed
- What Was Implemented
- Assumptions
- Validation Performed
- Risks or Follow-ups
