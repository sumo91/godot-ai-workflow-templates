# Security Policy

## Supported Versions

Security fixes are expected to land on the latest default branch state. If tagged releases are added later, the newest maintained release should be treated as the supported public version unless stated otherwise.

## Reporting a Vulnerability

If you discover a security issue in this repository's templates, scripts, or documentation:

1. Do not publish exploit details, credentials, or private environment data in a public issue.
2. Use GitHub's private vulnerability reporting feature if it is enabled for the repository.
3. If private reporting is not available, open a minimal public issue that says a security concern exists and ask the maintainers for a private contact path.

Please include:

- the affected file or workflow area
- the risk you identified
- reproduction steps or conditions
- suggested mitigation, if you have one

## Security Boundaries

This repository is designed to avoid shipping user-specific secrets or machine-bound configuration. Contributions that add tokens, auth files, private endpoints, or machine-specific local paths should be treated as security-sensitive and should not be merged.
