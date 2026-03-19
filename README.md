# aac-framework — Architecture As Code Framework

> **Architecture As Code (AaC)** is the practice of managing architectural
> knowledge — decisions, designs, personas, responsibilities, and conventions —
> as version-controlled, reviewable artefacts alongside the software they describe.

---

## Contents

| Directory | Purpose |
|-----------|---------|
| [`templates/`](./templates/) | Document templates ready to copy (ADR, RFC, System Context, Component Design, Runbook, Post-Mortem). |
| [`personas/`](./personas/) | YAML definitions for each stakeholder persona and their AaC responsibilities. |
| [`raci/`](./raci/) | RACI matrices for common engineering activities (system design, incident response, technology selection). |
| [`doctypes/`](./doctypes/) | Machine-readable registry of all recognised document types, their lifecycle statuses, and reviewer rules. |
| [`naming/`](./naming/) | Naming conventions for files, components, repositories, and identifiers. |
| [`labels/`](./labels/) | Label taxonomy (`{category}:{value}`) for documents, issues, and pull requests. |

---

## Quick Start

### 1. Create an Architecture Decision Record

```bash
# From the root of your project repository
cp path/to/aac-framework/templates/adr.md \
   docs/architecture/adr-0001-choose-database.md
```

Fill in the placeholders, apply the labels `doctype:adr` and `status:draft`,
and open a pull request. See [templates/README.md](./templates/README.md).

### 2. Understand Who Reviews What

Each [persona](./personas/) lists the DocTypes they typically author and review,
and their default RACI role. For example, a Solution Architect is `Accountable`
for ADRs and `Consulted` on incident response.

### 3. Follow the Naming Conventions

All file names must use **lowercase letters, digits, and hyphens** only.
See [naming/README.md](./naming/README.md) for per-DocType patterns.

### 4. Apply Labels

Every document should have at minimum:
- A `doctype:{type}` label (e.g. `doctype:adr`)
- A `status:{stage}` label (e.g. `status:draft`)

See [labels/README.md](./labels/README.md) for the full taxonomy.

---

## Framework Components

### Templates

Pre-structured Markdown files covering the most common architectural document
types. Each template includes all required sections with guidance comments.

| Template | Description |
|----------|-------------|
| `adr.md` | Architecture Decision Record |
| `rfc.md` | Request for Comments |
| `system-context.md` | System Context (C4 Level 1) |
| `component-design.md` | Component Design (C4 Level 3) |
| `runbook.md` | Operational runbook |
| `post-mortem.md` | Blameless incident post-mortem |

### Personas

Six stakeholder personas describe who participates in architecture activities
and what documents they produce or review:

| Persona | Role Summary |
|---------|-------------|
| Solution Architect | Owns end-to-end technical vision; authors and approves ADRs. |
| Technical Lead | Provides technical direction for a squad; accountable for component quality. |
| Software Engineer | Builds components; authors Component Designs and Runbooks. |
| DevOps Engineer | Owns platform reliability; authors Runbooks and drives Post-Mortems. |
| Security Engineer | Accountable for security reviews and threat modelling. |
| Product Manager | Voice of the customer; informed on architectural decisions. |

### RACI

Three worked RACI matrices and a blank template cover:

- **New System Design** — from requirements to production handover.
- **Incident Response** — from detection to action-item completion.
- **Technology Selection** — from criteria definition to ADR publication.

### DocTypes

A YAML registry (`doctypes/doctypes.yaml`) defines every recognised document
type with its template, naming pattern, lifecycle statuses, required fields,
and default reviewers.

### Naming Conventions

Rules in `naming/naming-conventions.yaml` govern file names, component names,
repository names, and YAML identifiers, ensuring all artefacts are lowercase,
hyphen-separated, and unambiguous.

### Labels

A `{category}:{value}` label taxonomy covers six dimensions:

| Category | Example Labels |
|----------|---------------|
| `doctype` | `doctype:adr`, `doctype:rfc` |
| `status` | `status:draft`, `status:accepted` |
| `priority` | `priority:high`, `priority:low` |
| `severity` | `severity:sev-1`, `severity:sev-2` |
| `environment` | `environment:production` |
| `area` | `area:security`, `area:scalability` |

---

## Contributing

1. Follow the [naming conventions](./naming/README.md).
2. Use the appropriate [template](./templates/) as a starting point.
3. Apply correct [labels](./labels/README.md).
4. Open a pull request and assign reviewers based on the relevant [RACI](./raci/).
