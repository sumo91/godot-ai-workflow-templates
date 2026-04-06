---
description: Use the Superpowers planning flow to turn an approved Godot spec into task packets
argument-hint: [approved feature or spec]
---

Use `superpowers:writing-plans` for this Godot planning request:

$ARGUMENTS

Use `godot-planning-agent` to keep the output focused on Godot file ownership and low-conflict task design.

Requirements:
- Assume the design is already approved, or briefly confirm what approved design you are planning from.
- Split the work into small task packets with clear file boundaries.
- Explicitly mark which tasks are safe for delegated execution.
- Explicitly mark which tasks must stay in the main session because they touch shared files.

For each task packet, include:
- Task ID
- Goal
- Allowed Files
- Forbidden Files
- Expected Changes
- Dependencies
- Validation Steps
- Definition of Done

Output:
- Planning Source
- Shared Files
- Parallel-Safe Tasks
- Serial-Only Tasks
- Recommended Execution Order
- Task Packets
