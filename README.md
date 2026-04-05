# AAC Framework

> Architecture as Code (AAC) — bring all data together in a structured, Git-stored framework.

## Overview

The AAC Framework provides a set of reusable templates, persona definitions, RACI matrices,
document-type registries, naming conventions, and label taxonomies. Every artifact is
described both as a **YAML configuration** (machine-readable) and as **Markdown documentation**
(human-readable), and everything lives in Git as the single source of truth.

## Repository structure

```text
aac-framework/
├── .github/
│   └── workflows/
│       └── validate-framework.yml
├── config/
│   └── framework.yaml          # Top-level framework configuration
├── doctypes/                   # Document-type registry
│   ├── config.yaml
│   ├── doctypes.yaml
│   ├── registry.yaml
│   └── README.md
├── labels/                     # Label taxonomy
│   ├── config.yaml
│   ├── labels.yaml
│   ├── taxonomy.yaml
│   └── README.md
├── naming/                     # Naming-convention rules
│   ├── config.yaml
│   ├── naming-conventions.yaml
│   ├── rules.yaml
│   └── README.md
├── personas/                   # Role definitions
│   ├── config.yaml
│   ├── cloud-adoption-solution-architect.yaml
│   ├── engineering-platform-engineer.yaml
│   ├── public-cloud-business-cloud-engineer.yaml
│   ├── public-cloud-business-cloud-solution-architect.yaml
│   ├── public-cloud-platform-engineer.yaml
│   ├── public-cloud-software-engineer.yaml
│   ├── public-cloud-solution-architect.yaml
│   └── README.md
├── raci/                       # RACI accountability matrices
│   ├── config.yaml
│   ├── incident-response.yaml
│   ├── matrix-template.md
│   ├── new-system-design.yaml
│   ├── raci-template.md
│   ├── technology-selection.yaml
│   └── README.md
├── scripts/                    # Local automation and validation tools
│   ├── new-document.ps1
│   └── validate-framework.ps1
├── templates/                  # Reusable document templates
│   ├── config.yaml
│   ├── composite-pattern/
│   ├── composition-map/
│   ├── cross-cutting-concern/
│   ├── enterprise-service-design/
│   ├── operating-model-spec/
│   ├── platform-policy/
│   └── platform-service/
└── README.md
```

## Quick start

1. Pick a **template** from `templates/` that matches your artifact type.
2. Scaffold a new document using `scripts/new-document.ps1`.
3. Fill in the placeholders and metadata.
4. Apply the **naming conventions** defined in `naming/naming-conventions.yaml`.
5. Tag the document with the relevant **labels** from `labels/taxonomy.yaml`.
6. Assign ownership using the **RACI matrix** in `raci/matrix-template.md`.

## Document Types

| DocType ID | Abbreviation | Naming pattern |
| ----------- | ------------ | ---------------- |
| `platform-policy` | PLCY | `plcy-{NNNN}-{slug}.md` |
| `composition-map` | MAP | `map-{slug}.md` |
| `platform-service` | PSVC | `psvc-{slug}.md` |
| `enterprise-service-design` | ESVC | `esvc-{slug}.md` |
| `pattern-overview` | PO | `po-{slug}.md` |
| `engineering-specification` | ENGS | `tp-{cloud-scope}-engs-{####}-{slug}.md` |
| `composite-pattern` | CMP | `cmp-{NNNN}-{slug}.md` |
| `cross-cutting-concern` | XCUT | `xcut-{slug}.md` |
| `operating-model-spec` | OMS | `oms-{slug}.md` |

`enterprise-service-design` is for services your platform depends on but does not own.
Example ownership model: **Owner = Public Cloud**.

## Scaffold a new document

Create documents with the scaffold script in `scripts/new-document.ps1`.

How it works:

1. You choose a `DocType`.
2. The script reads the matching naming pattern from `naming/naming-conventions.yaml`.
3. The script resolves required placeholders such as `cloud-scope`, `version`, `slug`, and sequence number.
4. A file is created in your target folder from the configured template.

Common parameters:

| Parameter | Required | Description |
| --------- | -------- | ----------- |
| `-DocType` | Yes | Doctype ID (example: `engineering-specification`) |
| `-Slug` | Conditional | Required when naming pattern contains `{slug}` |
| `-CloudScope` | Conditional | Required when naming pattern contains `{cloud-scope}`. Allowed values: `azr`, `gcp` |
| `-Version` | Conditional | Required when naming pattern contains `{version}` |
| `-Title` | No | Optional display title for template placeholders |
| `-OutputDir` | No | Output folder (default: `docs`) |
| `-Status` | No | Initial status value (default: `Draft`) |
| `-Owner` | No | Owner value injected into supported template placeholders |

Example commands for each doctype:

`platform-policy`

```powershell
pwsh ./scripts/new-document.ps1 -DocType platform-policy -Slug network-topology-and-connectivity -OutputDir docs -Owner "Cloud Adoption Solution Architect"
```

`composition-map`

```powershell
pwsh ./scripts/new-document.ps1 -DocType composition-map -Slug data-ingestion-pipeline -OutputDir docs -Owner "Public Cloud Solution Architect"
```

`platform-service`

```powershell
pwsh ./scripts/new-document.ps1 -DocType platform-service -Slug secret-management -OutputDir docs -Owner "Public Cloud Platform Engineer"
```

`enterprise-service-design`

```powershell
pwsh ./scripts/new-document.ps1 -DocType enterprise-service-design -Slug public-cloud-identity-provider -OutputDir docs -Owner "Public Cloud"
```

`pattern-overview`

```powershell
pwsh ./scripts/new-document.ps1 -DocType pattern-overview -Slug reference-integration-architecture -OutputDir docs -Owner "Public Cloud Business Cloud Solution Architect"
```

`engineering-specification`

```powershell
pwsh ./scripts/new-document.ps1 -DocType engineering-specification -CloudScope azr -Slug identity-federation-golden-path -OutputDir docs -Owner "Public Cloud Platform Engineer"
```

`composite-pattern`

```powershell
pwsh ./scripts/new-document.ps1 -DocType composite-pattern -Slug event-driven-data-sync -OutputDir docs -Owner "Public Cloud Solution Architect"
```

`cross-cutting-concern`

```powershell
pwsh ./scripts/new-document.ps1 -DocType cross-cutting-concern -Slug observability-standards -OutputDir docs -Owner "Engineering Platform Engineer"
```

`operating-model-spec`

```powershell
pwsh ./scripts/new-document.ps1 -DocType operating-model-spec -Slug incident-management -OutputDir docs -Owner "Engineering Platform Engineer"
```

Tip: `-Title` is optional and only used for template display placeholders; filename generation uses naming placeholders (`-Slug`, `-CloudScope`, `-Version`) based on the selected doctype pattern.

## Contributing

- All changes require at least one approving review.
- YAML files must be valid (use a YAML linter).
- Markdown files must follow the style guide in `naming/README.md`.

## License

See [LICENSE](LICENSE).
