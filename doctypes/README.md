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
# DocTypes

This directory defines the document-type registry for the Architecture As Code
(AaC) framework.

## What Is a DocType?

A DocType is a named, versioned category of document with:

- A canonical **template** to copy when creating a new document.
- A **naming pattern** that determines the file name.
- Allowed **statuses** that track the document's lifecycle.
- **Required fields** that must be present in every document of that type.
- Default **reviewers** (by persona) who should be asked to review the document.
- **Labels** that should be applied automatically.

## Document Type Registry

See [`doctypes.yaml`](./doctypes.yaml) for the machine-readable registry.

| DocType ID | Name | Template | Primary Audience |
|------------|------|----------|-----------------|
| `adr` | Architecture Decision Record | [`templates/adr.md`](../templates/adr.md) | Architects, Tech Leads |
| `rfc` | Request for Comments | [`templates/rfc.md`](../templates/rfc.md) | All engineers |
| `system-context` | System Context | [`templates/system-context.md`](../templates/system-context.md) | Architects |
| `component-design` | Component Design | [`templates/component-design.md`](../templates/component-design.md) | Engineers, Architects |
| `runbook` | Runbook | [`templates/runbook.md`](../templates/runbook.md) | DevOps / On-call |
| `post-mortem` | Post-Mortem | [`templates/post-mortem.md`](../templates/post-mortem.md) | All engineers |

## Document Lifecycle

```
Draft → Review → Approved / Accepted / Published
                   │
                   └──► Deprecated / Superseded / Outdated
```

All valid status transitions are defined per DocType in `doctypes.yaml`.

## Adding a New DocType

1. Add a new entry to `doctypes.yaml` following the existing schema.
2. Create the corresponding template in [`../templates/`](../templates/).
3. Add naming rules in [`../naming/naming-conventions.yaml`](../naming/naming-conventions.yaml).
4. Add corresponding labels in [`../labels/labels.yaml`](../labels/labels.yaml).
5. Add a row to the table above.
