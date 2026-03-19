# Labels

This directory defines the label taxonomy for categorising, triaging, and filtering
AAC framework artifacts, issues, and pull requests.

## Label categories

### `status:` — Lifecycle state

| Label | Colour | Description |
|-------|--------|-------------|
| `status: draft` | ![#ededed](https://via.placeholder.com/12/ededed/ededed.png) `#ededed` | Work in progress — not ready for review |
| `status: open` | ![#0075ca](https://via.placeholder.com/12/0075ca/0075ca.png) `#0075ca` | Ready for community review and comment |
| `status: proposed` | ![#cfd3d7](https://via.placeholder.com/12/cfd3d7/cfd3d7.png) `#cfd3d7` | Proposal submitted, awaiting decision |
| `status: accepted` | ![#0e8a16](https://via.placeholder.com/12/0e8a16/0e8a16.png) `#0e8a16` | Accepted and ready for implementation |
| `status: rejected` | ![#d73a4a](https://via.placeholder.com/12/d73a4a/d73a4a.png) `#d73a4a` | Rejected; see document for rationale |
| `status: deprecated` | ![#e4e669](https://via.placeholder.com/12/e4e669/e4e669.png) `#e4e669` | No longer recommended |
| `status: superseded` | ![#e4e669](https://via.placeholder.com/12/e4e669/e4e669.png) `#e4e669` | Replaced by a newer document |
| `status: withdrawn` | ![#e4e669](https://via.placeholder.com/12/e4e669/e4e669.png) `#e4e669` | Withdrawn by the author |
| `status: closed` | ![#6e7781](https://via.placeholder.com/12/6e7781/6e7781.png) `#6e7781` | Resolved; no further action required |

### `category:` — Domain

| Label | Description |
|-------|-------------|
| `category: architecture` | Architecture decisions, context, and design documents |
| `category: proposal` | Requests for Comments and feature proposals |
| `category: operations` | Runbooks, operational procedures, infrastructure |
| `category: incident` | Incident reports and post-mortems |
| `category: design` | Component designs and technical specifications |
| `category: governance` | Framework rules, naming, label taxonomy |

### `priority:` — Urgency

| Label | Description |
|-------|-------------|
| `priority: critical` | Must be resolved immediately |
| `priority: high` | Should be resolved in the current iteration |
| `priority: medium` | Should be resolved in the next one or two iterations |
| `priority: low` | Nice to have; schedule when capacity allows |

### `env:` — Environment

| Label | Description |
|-------|-------------|
| `env: production` | Affects the production environment |
| `env: staging` | Affects the staging environment |
| `env: development` | Affects development environments |
| `env: all` | Affects all environments equally |

### `type:` — Nature of change

| Label | Description |
|-------|-------------|
| `type: bug` | Something is broken or incorrect |
| `type: enhancement` | New feature or improvement |
| `type: documentation` | Documentation additions or corrections |
| `type: maintenance` | Routine maintenance, dependency updates, refactoring |
| `type: security` | Security-related change or vulnerability fix |

## Full taxonomy

See `taxonomy.yaml` for the complete machine-readable taxonomy including
hex colour codes.

## Applying labels

- Apply at least one `category:` label and one `status:` label to every document or PR.
- Apply a `priority:` label to every issue.
- Apply `env:` labels when the scope of a change is environment-specific.
- Apply a `type:` label to every pull request.
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
