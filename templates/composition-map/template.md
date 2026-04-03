# MAP: {TITLE}

| Field | Value |
|-------|-------|
| **Date** | <!-- YYYY-MM-DD --> |
| **Status** | <!-- Draft \| Review \| Approved \| Outdated --> |
| **Owner** | <!-- Role or team responsible for this composition map --> |
| **Scope** | <!-- Domain, product, or capability this map covers --> |
| **Version** | <!-- e.g. 1.0.0 --> |

---

## Purpose

<!-- Describe the capability or outcome this composition map documents.
     What business or technical problem does this composition solve? -->

## Composition Overview

<!-- Provide a high-level narrative of how services and capabilities fit together.
     Reference a diagram where possible (embed image or link to diagram file). -->

```
<!-- Insert ASCII diagram, Mermaid block, or reference to an external diagram -->
```

## Components

| Component | Type | Description | Owned By |
|-----------|------|-------------|----------|
| <!-- Service/capability name --> | <!-- Platform Service \| External \| Workload --> | <!-- Brief description --> | <!-- Team or persona --> |

## Data & Integration Flows

<!-- Describe the key data flows and integration points between components.
     Identify synchronous vs asynchronous communication patterns. -->

| Source | Target | Protocol / Pattern | Data / Event |
|--------|--------|--------------------|--------------|
| <!-- Component A --> | <!-- Component B --> | <!-- REST / Event / Queue --> | <!-- Payload description --> |

## Platform Policies Applied

<!-- List the Platform Policies (PLCY) that govern this composition. -->

- <!-- PLCY-XXXX: Policy name -->

## Cross Cutting Concerns

<!-- List any XCUT documents that apply to services within this composition. -->

- <!-- XCUT: Concern name -->

## Operating Model

<!-- Reference the Operating Model Specification (OMS) that covers day-to-day
     operation of this composition, or note if one is pending. -->

- <!-- OMS: Operating model name -->

## Related Documents

- <!-- Link to related Composite Patterns, Platform Services, or Platform Policies -->
