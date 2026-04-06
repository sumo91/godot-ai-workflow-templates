---
description: Run final pre-completion checks for a Godot task or feature
argument-hint: [task or feature]
---

For this Godot work:

$ARGUMENTS

Align with Superpowers by using:
- `superpowers:verification-before-completion`
- `superpowers:finishing-a-development-branch` when the branch is ready for merge or review

Run a final completion gate:
1. Summarize the requested behavior.
2. Confirm what was implemented.
3. Confirm what verification actually ran.
4. Check whether review happened.
5. Identify unresolved risks, assumptions, or missing tests.
6. State whether this is ready to consider complete.

Important:
- Evidence before claims.
- If verification is incomplete, say so clearly.
- If there are findings, list them before summarizing readiness.

Output:
- Requested Behavior
- Implemented Scope
- Verification Evidence
- Open Risks
- Completion Recommendation
