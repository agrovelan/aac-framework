# RACI Matrices

This directory contains RACI (Responsible, Accountable, Consulted, Informed) matrices
for the key activities within the AAC framework lifecycle.

## RACI key

| Letter | Meaning | Rule |
|--------|---------|------|
| **R** | Responsible | Does the work. At least one per activity. |
| **A** | Accountable | Owns the outcome; ultimately answerable. Exactly one per activity. |
| **C** | Consulted | Provides input before the work is done (two-way communication). |
| **I** | Informed | Notified of progress or outcome (one-way communication). |

## Framework RACI matrix

| Activity | Architect | Developer | Product Manager | Tech Lead | DevOps Engineer | Security Engineer |
|----------|-----------|-----------|----------------|-----------|-----------------|-------------------|
| Create ADR | A | C | I | R | I | C |
| Review ADR | A | C | C | R | I | C |
| Create RFC | C | R | C | A | I | C |
| Create System Context | R | C | C | A | C | C |
| Create Component Design | A | R | I | C | I | C |
| Create Runbook | I | C | I | A | R | I |
| Create Post-Mortem | C | C | I | A | R | C |

## Using the matrix template

Copy `matrix-template.md` into your project and fill in the activities and personas
relevant to your team. Reference the persona IDs defined in `personas/config.yaml`.
# RACI

This directory contains RACI (Responsible, Accountable, Consulted, Informed)
matrices for common activities in the Architecture As Code (AaC) framework.

## RACI Key

| Letter | Role | Description |
|--------|------|-------------|
| **R** | **Responsible** | Does the work to complete the activity. |
| **A** | **Accountable** | Owns the outcome; approves the work. There must be **exactly one A** per activity. |
| **C** | **Consulted** | Provides expertise or input before or during the activity (two-way communication). |
| **I** | **Informed** | Kept up to date on progress or decisions (one-way communication). |

## Available Matrices

| File | Activity |
|------|----------|
| [`raci-template.md`](./raci-template.md) | Blank template — copy this for any new activity. |
| [`new-system-design.yaml`](./new-system-design.yaml) | Designing and delivering a new system end-to-end. |
| [`incident-response.yaml`](./incident-response.yaml) | Managing a production incident to resolution. |
| [`technology-selection.yaml`](./technology-selection.yaml) | Evaluating and selecting a significant new technology. |

## How to Use

1. Identify which matrix covers your activity, or copy [`raci-template.md`](./raci-template.md)
   to create a new one.
2. Map the participants in your team to the [personas](../personas/) in the matrix.
3. Confirm there is exactly one **A** per activity row.
4. Attach or link the RACI from the relevant document (ADR, RFC, project brief).

## Adding a New Matrix

1. Copy `raci-template.md` (for a Markdown matrix) or an existing `.yaml` file
   (for a machine-readable matrix) as a starting point.
2. Name the file using the [naming conventions](../naming/naming-conventions.yaml)
   (lowercase, hyphen-separated, descriptive verb-noun: e.g. `security-review.yaml`).
3. Ensure every activity row has exactly one `A`.
4. Add a row to the table above.
