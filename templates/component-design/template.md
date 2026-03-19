# Component Design: <!-- Component Name -->

| Field | Value |
|-------|-------|
| **Component** | <!-- name --> |
| **Owner / team** | <!-- team or person --> |
| **Date** | <!-- YYYY-MM-DD --> |
| **Version** | <!-- e.g. 1.0 --> |
| **Status** | <!-- draft \| reviewed \| approved --> |

## Overview

<!-- One paragraph describing what this component does and why it exists. -->

## Responsibilities

<!-- Bullet list of what this component is responsible for. -->

- <!-- responsibility 1 -->
- <!-- responsibility 2 -->

## Interfaces

### Provided (API / events this component exposes)

| Name | Type | Description |
|------|------|-------------|
| <!-- endpoint/event --> | <!-- REST \| gRPC \| event --> | <!-- description --> |

### Required (dependencies on other components)

| Component | Interface | Purpose |
|-----------|-----------|---------|
| <!-- name --> | <!-- interface --> | <!-- why needed --> |

## Data model

<!-- Describe the key data entities owned or managed by this component. -->

## Non-functional requirements

| Attribute | Target |
|-----------|--------|
| Availability | <!-- e.g. 99.9% --> |
| Latency (p99) | <!-- e.g. < 200 ms --> |
| Scalability | <!-- e.g. horizontal, 1–N instances --> |

## Security considerations

<!-- Authentication, authorisation, data encryption, secret management. -->

## Open questions

<!-- List any unresolved design decisions. -->
