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
This directory contains YAML definitions for each stakeholder persona recognised
by the Architecture As Code (AaC) framework.

## What Is a Persona?

A persona represents a distinct role in the software-delivery process. Each
persona file defines:

| Field | Description |
|-------|-------------|
| `id` | Unique machine-readable identifier |
| `name` | Human-readable role name |
| `aliases` | Alternative role names used in different organisations |
| `description` | Short narrative description of the role |
| `responsibilities` | Key duties relevant to the AaC framework |
| `skills` | Core competencies expected of someone in this role |
| `typical_docs_authored` | DocTypes this persona typically creates |
| `typical_docs_reviewed` | DocTypes this persona is expected to review |
| `raci_roles` | Default RACI assignment for common activities |

## Available Personas

| File | Role |
|------|------|
| [`solution-architect.yaml`](./solution-architect.yaml) | Solution Architect |
| [`software-engineer.yaml`](./software-engineer.yaml) | Software Engineer |
| [`product-manager.yaml`](./product-manager.yaml) | Product Manager |
| [`technical-lead.yaml`](./technical-lead.yaml) | Technical Lead |
| [`devops-engineer.yaml`](./devops-engineer.yaml) | DevOps / Platform Engineer |
| [`security-engineer.yaml`](./security-engineer.yaml) | Security Engineer |

## Adding a New Persona

1. Copy the closest existing persona file as a starting point.
2. Set a unique `id` (lowercase, hyphen-separated) and fill in all fields.
3. Update the RACI matrices in [`../raci/`](../raci/) to include the new role where appropriate.
4. Add a row to the table above.
