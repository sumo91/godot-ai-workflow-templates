---
description: Debug a Godot issue in OpenCode without skipping root-cause analysis.
agent: build
---

Act as the main orchestrator for a Godot bugfix.

Process:

1. Restate the bug clearly.
2. Identify likely high-risk shared files.
3. Investigate root cause before proposing a fix.
4. If the bug touches shared scenes or player logic, keep work in the main session.
5. After the fix, invoke `@validation` and then `@review` if needed.

Output:

- Bug Summary
- Root-Cause Hypothesis
- Safe File Scope
- Validation Plan
