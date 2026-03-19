# Naming Conventions

This directory defines the naming conventions that apply to all files, directories,
Git branches, labels, and YAML identifiers within the AAC framework.

## Quick reference

| Artifact | Pattern | Example |
|----------|---------|---------|
| Markdown file | `kebab-case.md` | `adr-0001-use-postgresql.md` |
| YAML file | `kebab-case.yaml` | `registry.yaml` |
| Directory | `kebab-case` | `system-context/` |
| Git branch | `<type>/kebab-case` | `feat/add-runbook-template` |
| YAML key | `snake_case` | `schema_version` |
| Document ID | `kebab-case` | `tech-lead` |
| Sequence number | `NNNN` (4-digit, zero-padded) | `0001` |

## Detailed rules

See `rules.yaml` for machine-readable patterns, examples, and rationale for each rule.

## Document-type naming patterns

Each document type has a specific naming pattern defined in `doctypes/registry.yaml`:

| Type | Pattern | Example |
|------|---------|---------|
| ADR | `adr-{NNNN}-{slug}.md` | `adr-0001-use-postgresql.md` |
| RFC | `rfc-{NNNN}-{slug}.md` | `rfc-0001-event-driven-migration.md` |
| System Context | `system-context-{slug}.md` | `system-context-payment-service.md` |
| Component Design | `component-design-{slug}.md` | `component-design-order-processor.md` |
| Runbook | `runbook-{slug}.md` | `runbook-restart-api-gateway.md` |
| Post-Mortem | `post-mortem-{YYYY-MM-DD}-{slug}.md` | `post-mortem-2024-03-15-db-outage.md` |

## Slug rules

A **slug** is a concise, descriptive identifier derived from the document title:

1. Convert to lowercase.
2. Replace spaces and special characters with hyphens (`-`).
3. Remove consecutive hyphens.
4. Keep it short (3–6 words).

**Example**: "Use PostgreSQL as Primary Database" → `use-postgresql-as-primary-database`
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
