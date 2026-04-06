# Session and Threading

## Core Principle

One session should own one primary responsibility.

Recommended session types:

- main orchestration session
- implementation thread
- validation thread
- overnight automation session

## Daytime Pattern

- main session writes or updates the spec
- main session plans the work
- implementation threads handle low-risk task packets
- validation thread verifies
- main session integrates or redirects

## Overnight Pattern

- main session prepares a task file
- overnight session runs in `safe`, `low-risk`, or `task-packet` mode
- next-day handoff session reviews the summary before continuing

## Thread Hygiene

Open a new thread when:

- the goal changes
- the role changes
- new high-risk files enter scope
- old context is getting noisy

Continue an existing thread when:

- the task packet is unchanged
- the file boundary is unchanged
- the role is unchanged
