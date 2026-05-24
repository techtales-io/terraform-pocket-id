# Agent Rules

- NEVER push directly to the `main` or `master` branch without explicit user permission. This is a hard rule.
- NEVER force push (`git push -f` or `git push --force`) to any branch without explicit user permission. If an update to a PR is needed, create a new commit instead of amending and force pushing, unless explicitly instructed otherwise.
- ALWAYS use the `git-commit` skill when making commits.
- NEVER resolve or close the Renovate Dashboard issue. Renovate manages this issue automatically. Do not use keywords like "Resolves #<issue_number>" or "Closes #<issue_number>" referencing the Renovate Dashboard in PRs or commit messages.

## Environment & Tooling

- **Tool Management**: This repo uses `mise` (`.mise.toml`) for managing tool versions (Terraform, Trivy, pre-commit, tflint, etc.). If a tool is missing, run `mise install`.
- **Task Runner**: Use `task` (`Taskfile.yaml`) for executing common operations.
  - Setup pre-commit: `task pre-commit:init`
  - Run linters/hooks: `task pre-commit:run`
- **Terraform Directory**: The main entrypoint for Terraform configuration is the `terraform/` directory (not the root). `atlantis.yaml` is configured to run plans from this directory.

## Code Quality & Linting

- **Pre-commit**: Heavy reliance on `pre-commit` hooks for validation. This includes `terraform fmt`, `tflint`, `trivy`, `gitleaks`, `yamllint`, `markdownlint`, and `prettier`. Run `task pre-commit:run` or `pre-commit run --all-files` to verify changes locally before committing.

## Operational Workflows

- **Vault Secrets Sync**: There is a specific task to sync Pocket ID OIDC credentials to Vault: `task vault:sync-oidc-credentials CLIENT=<clientname> TARGET=<vault_path>`. It reads `infra/pocketid/clients/<CLIENT>` and patches `<TARGET>` with `OAUTH_CLIENT_ID` and `OAUTH_CLIENT_SECRET`.
