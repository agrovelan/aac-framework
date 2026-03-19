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
