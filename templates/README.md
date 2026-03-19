# Templates

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
