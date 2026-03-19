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
