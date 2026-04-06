# Workflow Overview

This is the portable default workflow for Godot development across agentic tools.

## Main Flow

1. Main session receives the task.
2. Design role refines the request into a minimal spec.
3. Planning role turns the approved spec into task packets.
4. Main session decides what can be delegated.
5. Implementation role executes narrow task packets.
6. Validation role checks evidence after implementation.
7. Review role checks behavior and maintainability before final completion.
8. Main session handles shared-file integration and go/no-go decisions.

## Shared-File Rule

Keep these in the main session unless the orchestrator explicitly decides otherwise:

- `project.godot`
- `autoload/*`
- shared `.tscn`
- core player scripts
- shared event or state infrastructure

## When to Stay Serial

Stay serial when:

- file ownership is unclear
- work spans multiple high-risk files
- the system boundary is changing
- the task packet is still vague

## When to Parallelize

Parallelize only when:

- task packets have clear ownership
- files do not overlap
- validation can still be done independently
