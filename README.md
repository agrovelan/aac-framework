# AAC Framework

> Architecture as Code (AAC) — bring all data together in a structured, Git-stored framework.

## Overview

The AAC Framework provides a set of reusable templates, persona definitions, RACI matrices,
document-type registries, naming conventions, and label taxonomies. Every artifact is
described both as a **YAML configuration** (machine-readable) and as **Markdown documentation**
(human-readable), and everything lives in Git as the single source of truth.

## Repository structure

```
aac-framework/
├── config/
│   └── framework.yaml          # Top-level framework configuration
├── templates/                  # Reusable document templates
│   ├── config.yaml
│   ├── README.md
│   ├── adr/                    # Architecture Decision Record
│   ├── rfc/                    # Request for Comments
│   ├── system-context/         # System Context diagram brief
│   ├── component-design/       # Component design document
│   ├── runbook/                # Operational runbook
│   └── post-mortem/            # Incident post-mortem
├── personas/                   # Role definitions
│   ├── config.yaml
│   └── README.md
├── raci/                       # RACI accountability matrices
│   ├── config.yaml
│   ├── README.md
│   └── matrix-template.md
├── doctypes/                   # Document-type registry
│   ├── config.yaml
│   ├── registry.yaml
│   └── README.md
├── naming/                     # Naming-convention rules
│   ├── config.yaml
│   ├── rules.yaml
│   └── README.md
└── labels/                     # Label taxonomy
    ├── config.yaml
    ├── taxonomy.yaml
    └── README.md
```

## Quick start

1. Pick a **template** from `templates/` that matches your artifact type.
2. Copy the template into your project's `docs/` directory and fill in the placeholders.
3. Apply the **naming conventions** defined in `naming/rules.yaml`.
4. Tag the document with the relevant **labels** from `labels/taxonomy.yaml`.
5. Assign ownership using the **RACI matrix** in `raci/matrix-template.md`.

## Contributing

- All changes require at least one approving review.
- YAML files must be valid (use a YAML linter).
- Markdown files must follow the style guide in `naming/README.md`.

## License

See [LICENSE](LICENSE).
