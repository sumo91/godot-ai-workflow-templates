Execute an existing Godot plan or task packet.

$ARGUMENTS

Execution rules:

- Keep the main session as the orchestrator.
- Delegate only narrow, file-bounded tasks.
- Keep shared-file integration in the main session.
- Separate implementation from validation.
- Review before declaring completion.

Godot risk model:

- Do not delegate concurrent edits to the same `.tscn`.
- Do not delegate `project.godot`, `autoload/*`, or core player scripts unless explicitly decided by the main session.

Output:

- Current Task
- Delegation Plan
- Validation Plan
- Risks
- Next Action
