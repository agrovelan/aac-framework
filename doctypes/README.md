# Document Types

This directory contains the document-type registry for the AAC framework.

## Source of truth

`registry.yaml` is the canonical machine-readable source for all document types.
Other files must align to it.

Each entry in `registry.yaml` defines:

| Field | Description |
|-------|-------------|
| `id` | Unique identifier used in config references |
| `name` | Human-readable display name |
| `abbreviation` | Short abbreviation |
| `template` | Path to the Markdown template |
| `naming_pattern` | File-naming pattern (see `naming/naming-conventions.yaml`) |
| `naming_example` | Concrete example of a valid file name |
| `labels` | Applicable category and status values |
| `required_metadata` | Fields that must be present in every document of this type |
| `description` | Short description of the document type's purpose |

## Registered document types

| ID | Name | Abbrev | Template |
|----|------|--------|----------|
| `platform-policy` | Platform Policy | PLCY | `templates/platform-policy/template.md` |
| `composition-map` | Composition Map | MAP | `templates/composition-map/template.md` |
| `platform-service` | Platform Service | PSVC | `templates/platform-service/template.md` |
| `enterprise-service-design` | Enterprise Service Design | ESVC | `templates/enterprise-service-design/template.md` |
| `pattern-overview` | Pattern Overview | PO | `templates/pattern-overview/template.md` |
| `engineering-specification` | Engineering Specification | ENGS | `templates/engineering-specification/template.md` |
| `composite-pattern` | Composite Pattern | CMP | `templates/composite-pattern/template.md` |
| `cross-cutting-concern` | Cross Cutting Concern | XCUT | `templates/cross-cutting-concern/template.md` |
| `operating-model-spec` | Operating Model Specification | OMS | `templates/operating-model-spec/template.md` |

## Document lifecycle

```text
draft -> review -> accepted/approved
                   |
                   +-> deprecated/superseded/outdated
```

## Adding a new document type

1. Add an entry to `registry.yaml` following the existing schema.
2. Create `templates/<id>/template.md`.
3. Add the template metadata in `templates/config.yaml`.
4. Add any new naming patterns to `naming/naming-conventions.yaml`.
5. Add any new labels to `labels/taxonomy.yaml`.
