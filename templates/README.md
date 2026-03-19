# Templates

This directory contains reusable document templates for architectural and operational
artifacts. Each sub-directory holds:

- `config.yaml` — machine-readable metadata for the template.
- `template.md` — the Markdown template to copy and fill in.

## Available templates

| ID | Name | Purpose |
|----|------|---------|
| `adr` | Architecture Decision Record | Record a significant architectural decision |
| `rfc` | Request for Comments | Propose and review a change or new feature |
| `system-context` | System Context | Describe a system and its external interfaces |
| `component-design` | Component Design | Detail the design of a software component |
| `runbook` | Operational Runbook | Step-by-step operational procedures |
| `post-mortem` | Incident Post-Mortem | Root-cause analysis after an incident |

## Usage

1. Copy the desired template file into your project's `docs/` directory.
2. Rename the file following the conventions in `naming/rules.yaml`.
3. Replace all `<!-- placeholder -->` comments with real content.
4. Apply the appropriate labels from `labels/taxonomy.yaml`.
