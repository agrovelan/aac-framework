# Naming Conventions

This directory defines the naming conventions used across the Architecture As
Code (AaC) framework for files, directories, components, and identifiers.

## Why Naming Conventions Matter

Consistent names make documents predictable, discoverable, and automatable.
They reduce cognitive overhead when navigating a repository and enable tooling
to parse, index, and validate framework artefacts without manual configuration.

## Convention Rules

All rules are specified in [`naming-conventions.yaml`](./naming-conventions.yaml).
Below is a summary.

### General Rules

| Rule | Example ✅ | Counter-example ❌ |
|------|-----------|-------------------|
| Lowercase letters, digits, and hyphens only | `api-gateway` | `APIGateway`, `api_gateway` |
| Do not start or end with a hyphen | `order-service` | `-order-service` |
| Prefer full words over abbreviations | `authentication-service` | `auth-svc` |

### File Naming Patterns

| DocType | Pattern | Example |
|---------|---------|---------|
| ADR | `adr-{####}-{slug}.md` | `adr-0001-use-postgresql.md` |
| RFC | `rfc-{####}-{slug}.md` | `rfc-0015-migrate-to-kubernetes.md` |
| System Context | `{system-slug}-system-context.md` | `payments-system-context.md` |
| Component Design | `{component-slug}-design.md` | `order-service-design.md` |
| Runbook | `{service-slug}-runbook-{operation-slug}.md` | `payments-api-runbook-restart-consumer.md` |
| Post-Mortem | `{YYYY-MM-DD}-post-mortem-{incident-slug}.md` | `2024-03-15-post-mortem-db-exhaustion.md` |
| RACI | `{activity-slug}.yaml` | `technology-selection.yaml` |

### Component & Repository Names

| Rule | Example ✅ | Counter-example ❌ |
|------|-----------|-------------------|
| Lowercase noun phrase | `order-service` | `OrderService` |
| Include functional suffix | `checkout-service`, `email-worker` | `checkout`, `emailer` |
| Repository name = component name | repo `order-service` for the Order Service | repo `orders` or `svc-orders` |

### Identifiers (YAML `id` fields)

| Rule | Example ✅ | Counter-example ❌ |
|------|-----------|-------------------|
| Lowercase, hyphen-separated | `solution-architect` | `SolutionArchitect` |
| DocType IDs match `doctypes.yaml` | `adr`, `rfc` | `ADR`, `RFC` |
| Label keys follow `{category}:{value}` | `doctype:adr` | `ADR`, `doctype-adr` |
