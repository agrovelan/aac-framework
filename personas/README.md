# Personas

This directory defines the roles (personas) that interact with the AAC framework.
Each persona has clear responsibilities, a set of documents it **produces**, and a
set of documents it **approves**.

## Defined personas

| ID | Name | Produces | Approves |
|----|------|----------|----------|
| `public-cloud-solution-architect` | Public Cloud Solution Architect | Platform Policy, Composition Map, Composite Pattern, Operating Model Specification | Platform Policy, Composition Map, Composite Pattern, Cross Cutting Concern |
| `cloud-adoption-solution-architect` | Cloud Adoption Solution Architect | Platform Policy, Composition Map, Platform Service, Operating Model Specification | Platform Policy, Composition Map, Platform Service, Composite Pattern |
| `public-cloud-business-cloud-solution-architect` | Public Cloud Business Cloud Solution Architect | Platform Policy, Composition Map, Cross Cutting Concern, Operating Model Specification | Platform Policy, Composition Map, Operating Model Specification, Cross Cutting Concern |
| `public-cloud-platform-engineer` | Public Cloud Platform Engineer | Operating Model Specification, Cross Cutting Concern, Platform Service, Platform Policy | Operating Model Specification, Cross Cutting Concern, Platform Service |
| `engineering-platform-engineer` | Engineering Platform Engineer | Operating Model Specification, Cross Cutting Concern, Composite Pattern, Composition Map | Operating Model Specification, Cross Cutting Concern, Composite Pattern |
| `public-cloud-business-cloud-engineer` | Public Cloud Business Cloud Engineer | Platform Service, Operating Model Specification, Cross Cutting Concern, Composition Map | Composition Map, Platform Service |
| `public-cloud-software-engineer` | Public Cloud Software Engineer | Platform Service, Operating Model Specification, Cross Cutting Concern, Composite Pattern | Composite Pattern, Platform Service |

## Using personas in RACI matrices

Reference a persona by its `id` field (e.g., `public-cloud-solution-architect`,
`engineering-platform-engineer`) when building a RACI matrix. See
`raci/config.yaml` and `raci/matrix-template.md` for examples.

## Adding a new persona

1. Add an entry to `personas/config.yaml` following the existing schema.
2. Create a corresponding `<id>.yaml` file in this directory.
3. Update the table above.
4. Update any RACI matrices that should include the new persona.


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
| [`public-cloud-solution-architect.yaml`](./public-cloud-solution-architect.yaml) | Public Cloud Solution Architect |
| [`cloud-adoption-solution-architect.yaml`](./cloud-adoption-solution-architect.yaml) | Cloud Adoption Solution Architect |
| [`public-cloud-business-cloud-solution-architect.yaml`](./public-cloud-business-cloud-solution-architect.yaml) | Public Cloud Business Cloud Solution Architect |
| [`public-cloud-platform-engineer.yaml`](./public-cloud-platform-engineer.yaml) | Public Cloud Platform Engineer |
| [`engineering-platform-engineer.yaml`](./engineering-platform-engineer.yaml) | Engineering Platform Engineer |
| [`public-cloud-business-cloud-engineer.yaml`](./public-cloud-business-cloud-engineer.yaml) | Public Cloud Business Cloud Engineer |
| [`public-cloud-software-engineer.yaml`](./public-cloud-software-engineer.yaml) | Public Cloud Software Engineer |

## Adding a New Persona

1. Copy the closest existing persona file as a starting point.
2. Set a unique `id` (lowercase, hyphen-separated) and fill in all fields.
3. Update the RACI matrices in [`../raci/`](../raci/) to include the new role where appropriate.
4. Add a row to the table above.
