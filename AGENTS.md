# Project Specific Rules

- This repository is a Swift package for shared icon identifiers and icon-related helpers.
- Keep a development journal in `Extras/Journal/`.

# Standard Rules

- Write modern, idiomatic code; fix root causes, keep interfaces explicit and small, avoid hidden coupling and surprising side effects, and keep documentation aligned with the current state.
- Apply DRY and Single Source Of Truth. Apply KISS, YAGNI, illegal-state prevention, dependency injection, composition, command-query separation, the Law of Demeter, structured concurrency, design by contract, and idempotency where relevant.
- Understand request boundaries and inspect relevant code and documentation before editing. Keep focused changes coherent, and use repository-wide scope for cleanup, review, modernization, and consistency work.
- Use red/green TDD for non-UI code, add or update tests for behavior changes, and create previews for UI code when the tooling supports them.
- Run the narrowest relevant validation first, then broaden to project checks. Report commands run, skipped checks with reasons, validation gaps, and residual risks.
- Keep paths portable: use repository-relative paths for repository files and home-relative paths for shared resources.
- Never expose or commit credentials or secrets. Do not perform irreversible destructive actions without explicit approval.
- If unexpected workspace changes appear, pause and confirm direction.
- Prefer trusted primary sources for technical decisions, especially official language, platform, package, API, and dependency documentation.

# Skills

- Follow the `coding-standards` skill for all coding and review work.
- Use the `swift` skill for Swift language and source-organization guidance.
- Use the `swiftui` skill for SwiftUI APIs and extensions.
- Use the `swift-concurrency-pro` skill for isolation and concurrency-sensitive code.
- Use the `swift-testing-pro` skill for Swift Testing code.
- Use the `validation-flow` skill after changing Swift code.
- Use the `codex-git` skill for git operations.

To refresh this file, use the `refresh` skill.
