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
4. Attach or link the RACI from the relevant document (Platform Policy, Composition Map, or project brief).

## Adding a New Matrix

1. Copy `raci-template.md` (for a Markdown matrix) or an existing `.yaml` file
   (for a machine-readable matrix) as a starting point.
2. Name the file using the [naming conventions](../naming/naming-conventions.yaml)
   (lowercase, hyphen-separated, descriptive verb-noun: e.g. `security-review.yaml`).
3. Ensure every activity row has exactly one `A`.
4. Add a row to the table above.
