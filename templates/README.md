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
This directory contains the standard document templates used across the Architecture As Code (AaC) framework.

## Available Templates

| Template File | DocType | Purpose |
|---------------|---------|---------|
| [`adr.md`](./adr.md) | `adr` | Architecture Decision Record — capture a significant architectural decision, its context, and consequences. |
| [`rfc.md`](./rfc.md) | `rfc` | Request for Comments — propose and gather feedback on a significant design or process change before implementation. |
| [`system-context.md`](./system-context.md) | `system-context` | System Context — document the high-level context of a system, its actors, and external dependencies. |
| [`component-design.md`](./component-design.md) | `component-design` | Component Design — detail the design, interfaces, and operational characteristics of a single component. |
| [`runbook.md`](./runbook.md) | `runbook` | Runbook — step-by-step operational procedures for common or critical tasks. |
| [`post-mortem.md`](./post-mortem.md) | `post-mortem` | Post-Mortem — blameless incident review capturing timeline, root cause, and follow-up actions. |

## How to Use a Template

1. Copy the relevant template file to the appropriate location in your repository.
2. Rename the file following the [naming conventions](../naming/naming-conventions.yaml).
3. Fill in every section marked with `<!-- … -->` or placeholder text in `{BRACES}`.
4. Apply the correct [labels](../labels/labels.yaml) and [DocType](../doctypes/doctypes.yaml).
5. Open a pull request and assign reviewers using the [RACI matrix](../raci/).

## Adding a New Template

1. Copy the closest existing template as a starting point.
2. Register the new DocType in [`../doctypes/doctypes.yaml`](../doctypes/doctypes.yaml).
3. Add a row to the table above and update [`../naming/naming-conventions.yaml`](../naming/naming-conventions.yaml) if a new naming pattern is required.
