# Contributing

Thanks for helping improve this repository.

## Goals

Keep this repository:

- reusable across machines
- reusable across users
- safe for public sharing
- focused on project-local workflow templates

## Contribution Rules

- Do not add private API endpoints.
- Do not add auth files or tokens.
- Do not hardcode machine-specific Godot paths.
- Prefer shared-core changes over duplicating the same rule in multiple platform templates.
- Keep nightly workflows task-file driven.
- Keep high-risk Godot integration in the main session guidance.

## Recommended Change Process

1. Update the shared core if the change is cross-platform.
2. Update only the affected platform starter if the change is platform-specific.
3. Update the matching smoke test when behavior changes.
4. Update docs when installer steps or starter contents change.

## Pull Request Checklist

- The change does not add private or machine-bound configuration.
- The changed starter still installs into a clean project directory.
- The relevant smoke test still matches the starter behavior.
- Docs and templates stay aligned.
