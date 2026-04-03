# PSVC: {SERVICE NAME}

| Field | Value |
|-------|-------|
| **Date** | <!-- YYYY-MM-DD --> |
| **Status** | <!-- Draft \| Review \| Approved \| Deprecated --> |
| **Service Owner** | <!-- Team or role accountable for this service --> |
| **Version** | <!-- e.g. 1.0.0 --> |
| **Category** | <!-- Networking \| Security \| Data \| Compute \| Observability \| Developer Tooling --> |

---

## Purpose

<!-- Describe what this platform service provides and why it exists.
     What problem does it solve for consuming teams? -->

## Service Contract

### Capabilities

<!-- List what the service does — the features and functions it provides. -->

- <!-- Capability 1 -->
- <!-- Capability 2 -->

### API / Interface

<!-- Document the interface(s) exposed by this service. -->

| Interface | Type | Description |
|-----------|------|-------------|
| <!-- Endpoint / Resource --> | <!-- REST \| CLI \| SDK \| Event \| Terraform Module --> | <!-- What it does --> |

### Inputs & Outputs

| Parameter | Direction | Type | Required | Description |
|-----------|-----------|------|----------|-------------|
| <!-- name --> | <!-- Input \| Output --> | <!-- string \| bool \| object --> | <!-- Yes \| No --> | <!-- Description --> |

## Service Level Objectives

| SLO | Target | Measurement |
|-----|--------|-------------|
| Availability | <!-- e.g. 99.9% --> | <!-- How measured --> |
| Latency (p99) | <!-- e.g. < 500ms --> | <!-- How measured --> |
| Error Rate | <!-- e.g. < 0.1% --> | <!-- How measured --> |

## Onboarding Guide

<!-- Step-by-step instructions for a consuming team to start using this service. -->

1. <!-- Step 1 -->
2. <!-- Step 2 -->
3. <!-- Step 3 -->

## Operational Responsibilities

| Responsibility | Owned By |
|----------------|----------|
| Service deployment & upgrades | <!-- Platform Team --> |
| Consumer onboarding | <!-- Platform Team --> |
| Incident response | <!-- Platform Team --> |
| Cost attribution | <!-- Consumer Team --> |

## Platform Policies Applied

- <!-- PLCY-XXXX: Policy name -->

## Related Documents

- <!-- Link to Operating Model Spec (OMS), Cross Cutting Concerns (XCUT), or Composition Maps (MAP) -->
