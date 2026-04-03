# Naming Conventions

This directory defines naming conventions for files, directories, branches,
labels, and identifiers used across the AAC framework.

## Quick reference

| Artifact | Pattern | Example |
|----------|---------|---------|
| Markdown file | `kebab-case.md` | `plcy-0001-network-segmentation-policy.md` |
| YAML file | `kebab-case.yaml` | `registry.yaml` |
| Directory | `kebab-case` | `cross-cutting-concern/` |
| Git branch | `<type>/kebab-case` | `docs/update-platform-policy-template` |
| YAML key | `snake_case` | `schema_version` |
| Document ID | `kebab-case` | `platform-policy` |
| Sequence number | `NNNN` (4-digit, zero-padded) | `0001` |

## Detailed rules

See `rules.yaml` for machine-readable patterns, examples, and rationale.

## Document naming patterns

Each doctype pattern is defined in `naming-conventions.yaml`:

| DocType | Pattern | Example |
|---------|---------|---------|
| Platform Policy | `tp-{doctype}-{####}-{slug}.md` | `tp-plcy-0001-avd.md` |
| Composition Map | `map-{cloud-scope}-{slug}-{####}.md` | `map-azr-data-ingestion-pipeline-0001.md` |
| Platform Service | `tp-{cloud-scope}-psvc-{####}-{slug}.md` | `tp-azr-psvc-0001-secret-management.md` |
| Enterprise Service Design | `tp-esvc-{version}-{slug}.md` | `tp-esvc-v1-public-cloud-identity-provider.md` |
| Pattern Overview | `po-{slug}.md` | `po-reference-integration-architecture.md` |
| Engineering Specification | `tp-{cloud-scope}-engs-{####}-{slug}.md` | `tp-azr-engs-0001-identity-federation-golden-path.md` |
| Composite Pattern | `tp-{cloud-scope}-comp-{####}-{slug}.md` | `tp-azr-comp-0001-event-driven-data-sync.md` |
| Cross Cutting Concern | `tp-xcut-{####}-{slug}.md` | `tp-xcut-0001-observability-standards.md` |
| Operating Model Specification | `oms-{cloud-scope}-{version}-{####}-{slug}.md` | `oms-azr-v1-0001-incident-management.md` |

## Slug rules

A slug is a concise identifier derived from the title:

1. Convert to lowercase.
2. Replace spaces and special characters with hyphens (`-`).
3. Remove consecutive hyphens.
4. Keep it short (3-6 words).

Example: "Network Segmentation Baseline" -> `network-segmentation-baseline`

## Identifier rules

| Rule | Example | Counter-example |
|------|---------|-----------------|
| Lowercase, hyphen-separated | `platform-policy` | `PlatformPolicy` |
| DocType IDs match `doctypes/registry.yaml` | `platform-policy`, `composition-map` | `platform_policy`, `map` |
| Label keys follow `{category}:{value}` | `doctype:platform-policy` | `doctype-platform-policy` |
