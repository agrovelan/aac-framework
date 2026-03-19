# Personas

This directory defines the roles (personas) that interact with the AAC framework.
Each persona has clear responsibilities, a set of documents it **produces**, and a
set of documents it **approves**.

## Defined personas

| ID | Name | Produces | Approves |
|----|------|----------|----------|
| `architect` | Architect | ADR, System Context, Component Design | ADR, RFC, System Context |
| `developer` | Developer | RFC, Component Design, Runbook | RFC |
| `product-manager` | Product Manager | — | RFC |
| `tech-lead` | Tech Lead | ADR, RFC | ADR, RFC, Component Design, Runbook |
| `devops-engineer` | DevOps Engineer | Runbook, Post-Mortem | Runbook, Post-Mortem |
| `security-engineer` | Security Engineer | ADR | ADR, Component Design, Post-Mortem |

## Using personas in RACI matrices

Reference a persona by its `id` field (e.g., `architect`, `tech-lead`) when building
a RACI matrix. See `raci/config.yaml` and `raci/matrix-template.md` for examples.

## Adding a new persona

1. Add an entry to `personas/config.yaml` following the existing schema.
2. Update the table above.
3. Update any RACI matrices that should include the new persona.
