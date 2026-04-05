# AAC Framework Copilot Instructions

This repository defines an Architecture as Code (AAC) framework made up of Markdown templates and YAML registries. Prefer small, schema-aligned edits over broad rewrites.

## Scripts

Scaffold a new document (PowerShell 7+):

```powershell
pwsh ./scripts/new-document.ps1 -DocType <doctype-id> -Slug <slug> [-CloudScope azr|gcp] [-Version v1] [-OutputDir docs] [-Owner "Role Name"]
```

Run framework validation locally (same check the CI runs):

```powershell
pwsh ./scripts/validate-framework.ps1
```

The CI workflow (`.github/workflows/validate-framework.yml`) runs `validate-framework.ps1` on every PR and push to `main` that touches any `.yaml`, `.yml`, or `.md` file.

## What validation checks

- No tab characters in any YAML file.
- `doctypes/config.yaml` must set `registry_file: registry.yaml`.
- Every doctype in `doctypes/registry.yaml` must have: a `template` path matching `templates/<id>/template.md`, a `naming_pattern`, at least one `required_metadata` field, a valid `labels.category`, and at least one valid `labels.status` value.
- Every doctype in `doctypes/registry.yaml` must be registered in `templates/config.yaml` with a matching template path.
- No Markdown file may reference the legacy doctype file (`doctypes.yaml`) or the old relative path — always point to `doctypes/registry.yaml`.

## Core principles

- Treat YAML files as machine-readable source of truth and Markdown files as human-readable guidance.
- Preserve the repository structure and naming patterns already defined in `config/framework.yaml`, `doctypes/registry.yaml`, `templates/config.yaml`, `naming/naming-conventions.yaml`, and `labels/taxonomy.yaml`.
- Keep changes minimal and focused. Do not rename files, folders, IDs, or labels unless the task explicitly requires it.
- Follow existing formatting: UTF-8 text (no BOM), LF line endings, and 2-space indentation in YAML. Never use tabs in YAML.

## Canonical sources and legacy files

- `doctypes/registry.yaml` is the single source of truth for document types. The legacy `doctypes.yaml` file must not be edited or referenced.
- `labels/taxonomy.yaml` is the current label source. `labels/labels.yaml` is a legacy file — do not edit or reference it.
- When a doctype changes, keep these files aligned:
  - `doctypes/registry.yaml`
  - `templates/<doctype-id>/template.md`
  - `templates/config.yaml`
  - `naming/naming-conventions.yaml`
  - `labels/taxonomy.yaml`
  - any affected README documentation

## Naming rules

- Markdown and YAML file names: `kebab-case`.
- YAML keys: `snake_case`.
- Doctype IDs, label names, and slugs: lowercase, hyphen-separated.
- Sequence numbers in filenames: 4-digit zero-padded (`0001`, `0042`). The scaffold script auto-generates the next sequence based on existing files in the output directory.
- Valid `{cloud-scope}` values: `azr` (Azure) and `gcp` only. `aws` and `azure` are not valid.
- Slugs: lowercase, hyphens only, 3–6 words. Strip special characters and collapse consecutive hyphens.
- When adding examples, use realistic AAC values: platform policies, composition maps, engineering specifications, operating model specs, personas, and RACI matrices.

## Document lifecycle

Status values progress as: `draft` → `review` → `accepted` → `deprecated` / `superseded`

Use only status values defined in `labels/taxonomy.yaml`. The initial status when scaffolding is `Draft` (injected into the template's status comment placeholder).

## Working in docs and templates

- Reuse the established template style and section structure from existing files in `templates/` and `docs/`.
- Template placeholder tokens replaced by the scaffold script: `{TITLE}`, `{NUMBER}`, `{CONCERN NAME}`, `{SERVICE NAME}`, `{SERVICE / DOMAIN NAME}`, and HTML comment patterns for status and owner fields.
- Keep Markdown practical and operational. Avoid filler text, marketing language, and vague placeholders.
- If a document references labels or statuses, use values that exist in `labels/taxonomy.yaml`.
- If a document references a doctype, use an ID that exists in `doctypes/registry.yaml`.
- When updating README files, describe actual repo behaviour rather than aspirational workflow.

## Change safety

- Do not invent new schema fields in YAML unless the task explicitly requires a schema change across the repo.
- Do not delete existing required metadata, label mappings, or template registrations without checking all related files.
- Prefer updating existing documentation and configuration consistently rather than adding parallel or duplicate files.
- If the request is ambiguous, choose the most conservative change that preserves the current framework conventions.
