# XCUT: {CONCERN NAME}

| Field | Value |
|-------|-------|
| **Date** | <!-- YYYY-MM-DD --> |
| **Status** | <!-- Draft \| Review \| Accepted \| Deprecated --> |
| **Owner** | <!-- Team or role accountable for this concern --> |
| **Domains Affected** | <!-- Comma-separated list: e.g. Compute, Networking, Data, All --> |
| **Version** | <!-- e.g. 1.0.0 --> |

---

## Purpose

<!-- Describe the cross-cutting concern and why it requires a consistent, platform-wide approach.
     What risk or quality attribute does this concern address? -->

## Scope

<!-- Specify which platform services, workloads, or environments this concern applies to.
     Call out any explicit exclusions. -->

## Standards & Requirements

<!-- Define the mandatory standards all platform services and workloads must meet
     for this concern. Use SHALL / MUST for mandatory, SHOULD for recommended. -->

| # | Requirement | Applies To | Enforcement |
|---|-------------|------------|-------------|
| 1 | <!-- MUST/SHALL statement --> | <!-- All services \| Specific scope --> | <!-- Automated \| Manual --> |
| 2 | | | |

## Platform Implementation

<!-- Describe how the platform addresses this concern centrally.
     Reference the Platform Services (PSVC) and tooling that implement it. -->

| Capability | Platform Service / Tool | Notes |
|------------|------------------------|-------|
| <!-- e.g. Centralised logging --> | <!-- PSVC: Observability Stack --> | <!-- Any configuration required by consumers --> |

## Consumer Responsibilities

<!-- Describe what consuming teams must do to comply with this concern.
     Distinguish between what the platform provides vs what the consumer must configure. -->

- <!-- Responsibility 1 -->
- <!-- Responsibility 2 -->

## Verification & Audit

<!-- Describe how compliance is verified across the platform. -->

| Verification Method | Frequency | Responsible |
|--------------------|-----------|-------------|
| <!-- e.g. Automated policy gate in CI --> | <!-- Per PR \| Daily \| Weekly --> | <!-- Platform Team --> |

## Exceptions Process

<!-- How can a team request an exception? Who approves it and how is it tracked? -->

## Related Documents

- <!-- Link to related PLCYs, PSVCs, CMPs, or OMS documents -->
