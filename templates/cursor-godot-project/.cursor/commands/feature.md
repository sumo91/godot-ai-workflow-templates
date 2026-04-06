Use the Godot multi-agent workflow to plan and coordinate this new feature.

Feature request:

$ARGUMENTS

Follow this sequence:

1. Refine the request into a minimal Godot feature spec.
2. Identify shared files and conflict risks.
3. Keep the main session as the orchestrator.
4. Break the work into low-conflict task packets.
5. Mark which tasks are safe for delegation and which must stay in the main session.
6. After implementation, validate and review before claiming completion.

Godot safety rules:

- Treat `.tscn`, `project.godot`, `autoload/*`, and core player scripts as high-risk shared files.
- Default to serial execution when ownership is unclear.
- Keep shared-file integration in the main session.

Output:

- Goal
- Minimal Spec
- Shared Files
- Task Packets
- Parallelization Decision
- Validation Plan
- Recommended Next Step
