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
