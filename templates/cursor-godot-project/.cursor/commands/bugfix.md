Use the Godot debugging and bugfix workflow for this issue.

Bug description:

$ARGUMENTS

Process:

1. Restate the bug clearly.
2. Gather evidence before changing code.
3. Identify likely affected scenes, scripts, resources, and shared files.
4. Define a minimal reproduction or validation path.
5. Create a small fix packet.
6. Verify the result and check regressions.
7. Review the fix before calling it done.

Important:

- Prefer the smallest safe fix.
- Do not bundle unrelated cleanup into the bugfix.
- If high-risk shared files are involved, keep the work in the main session.

Output:

- Bug Summary
- Evidence
- Suspected Scope
- Shared File Risks
- Fix Packet
- Validation Result
- Residual Risks
