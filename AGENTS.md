# Agent Rules

- NEVER push directly to the `main` or `master` branch without explicit user permission. This is a hard rule.
- NEVER force push (`git push -f` or `git push --force`) to any branch without explicit user permission. If an update to a PR is needed, create a new commit instead of amending and force pushing, unless explicitly instructed otherwise.
- ALWAYS use the `git-commit` skill when making commits.
- NEVER resolve or close the Renovate Dashboard issue. Renovate manages this issue automatically. Do not use keywords like "Resolves #<issue_number>" or "Closes #<issue_number>" referencing the Renovate Dashboard in PRs or commit messages.
