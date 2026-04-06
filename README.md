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
Example ownership model: **Owner = Private Cloud**.

## Scaffold a new document

See [Scaffold a new document](https://github.com/agrovelan/acc-platform#scaffold-a-new-document)
in the [acc-platform](https://github.com/agrovelan/acc-platform) repository for detailed instructions
on using `new-document.ps1` to create documents from these templates.

## Contributing

- All changes require at least one approving review.
- YAML files must be valid (use a YAML linter).
- Markdown files must follow the style guide in `naming/README.md`.

## License

See [LICENSE](LICENSE).
