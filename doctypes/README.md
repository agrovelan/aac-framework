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
