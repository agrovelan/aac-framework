# Labels

This directory defines the label taxonomy for the Architecture As Code (AaC)
framework. Labels are applied to documents, issues, and pull requests to make
content filterable, searchable, and machine-processable.

## Label Format

All labels follow the pattern:

```
{category}:{value}
```

For example: `doctype:adr`, `status:review`, `priority:high`.

This prefix format prevents collisions between categories and makes it
immediately clear what dimension of a document a label describes.

## Label Categories

See [`labels.yaml`](./labels.yaml) for the machine-readable taxonomy.

### `doctype` — Document Type

Identifies what kind of document this is. Apply **exactly one** `doctype` label
to every document.

| Label | Description |
|-------|-------------|
| `doctype:adr` | Architecture Decision Record |
| `doctype:rfc` | Request for Comments |
| `doctype:system-context` | System Context document |
| `doctype:component-design` | Component Design document |
| `doctype:runbook` | Operational runbook |
| `doctype:post-mortem` | Incident post-mortem |

### `status` — Lifecycle Stage

Tracks where a document is in its lifecycle. Apply **exactly one** `status` label.

| Label | Description |
|-------|-------------|
| `status:draft` | Work in progress |
| `status:review` | Actively seeking review |
| `status:accepted` | Decision or proposal accepted |
| `status:rejected` | Proposal rejected |
| `status:deprecated` | No longer current; kept for reference |
| `status:superseded` | Replaced by a newer document |
| `status:published` | Finalised and published |

### `priority` — Priority

Indicates the urgency of the document or its related action items.

| Label | Description |
|-------|-------------|
| `priority:critical` | Immediate attention required |
| `priority:high` | Current sprint or milestone |
| `priority:medium` | Next sprint or milestone |
| `priority:low` | Addressable when capacity allows |

### `severity` — Incident Severity

Applied to post-mortem documents.

| Label | Description |
|-------|-------------|
| `severity:sev-1` | Complete or near-complete service loss |
| `severity:sev-2` | Significant feature degradation |
| `severity:sev-3` | Limited customer impact |

### `environment` — Deployment Environment

Indicates the deployment environment relevant to the document.

| Label | Description |
|-------|-------------|
| `environment:production` | Production |
| `environment:staging` | Staging / pre-production |
| `environment:development` | Development |

### `area` — Technical Domain

Cross-cutting concern or technical domain the document addresses. Multiple
`area` labels may be applied.

| Label | Description |
|-------|-------------|
| `area:security` | Security-related |
| `area:scalability` | Scalability / performance |
| `area:reliability` | Reliability / availability |
| `area:data` | Data modelling or processing |
| `area:api` | API design or breaking change |
| `area:infrastructure` | Infrastructure or platform |
| `area:cost` | Cost optimisation |

## Adding a New Label

1. Add the new label to the appropriate category in `labels.yaml`, or create a
   new category if none of the existing ones fits.
2. Choose a `color` value (6-digit hex without `#`) that is distinct within
   the category.
3. Update the relevant table in this README.
4. If the label is a required label for a DocType, update
   [`../doctypes/doctypes.yaml`](../doctypes/doctypes.yaml).
