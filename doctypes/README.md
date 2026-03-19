# Document Types

This directory contains the registry of all document types recognised by the AAC framework.

## Registry (`registry.yaml`)

The registry is the single source of truth for document-type metadata. Each entry
defines:

| Field | Description |
|-------|-------------|
| `id` | Unique identifier used in config references |
| `name` | Human-readable display name |
| `abbreviation` | Short abbreviation (e.g., `ADR`, `RFC`) |
| `template` | Path to the Markdown template |
| `naming_pattern` | File-naming pattern (see `naming/rules.yaml`) |
| `naming_example` | Concrete example of a valid file name |
| `labels` | Applicable label categories and status values |
| `required_metadata` | Fields that must be present in every document of this type |
| `description` | Short description of the document type's purpose |

## Registered document types

| ID | Name | Abbrev | Template |
|----|------|--------|---------|
| `adr` | Architecture Decision Record | ADR | `templates/adr/template.md` |
| `rfc` | Request for Comments | RFC | `templates/rfc/template.md` |
| `system-context` | System Context | SC | `templates/system-context/template.md` |
| `component-design` | Component Design | CD | `templates/component-design/template.md` |
| `runbook` | Operational Runbook | RB | `templates/runbook/template.md` |
| `post-mortem` | Incident Post-Mortem | PM | `templates/post-mortem/template.md` |

## Adding a new document type

1. Add an entry to `registry.yaml` following the existing schema.
2. Create a template in `templates/<id>/template.md` and a matching
   `templates/<id>/config.yaml`.
3. Update the table above.
4. Add any new labels to `labels/taxonomy.yaml`.
5. Add any new naming patterns to `naming/rules.yaml`.
