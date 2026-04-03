# OMS: {SERVICE / DOMAIN NAME}

| Field | Value |
|-------|-------|
| **Date** | <!-- YYYY-MM-DD --> |
| **Status** | <!-- Draft \| Review \| Approved \| Deprecated --> |
| **Owner** | <!-- Team or role accountable for operations in this domain --> |
| **Scope** | <!-- Service name, domain, or capability covered --> |
| **Version** | <!-- e.g. 1.0.0 --> |
| **Review Cadence** | <!-- e.g. Quarterly --> |

---

## Purpose

<!-- Describe what this Operating Model Specification covers and why it exists.
     What service, capability, or domain does it govern day-to-day? -->

## Responsibilities

<!-- Define who does what in the ongoing operation of this service or domain. -->

| Responsibility | Owner | Escalation |
|----------------|-------|-----------|
| Day-to-day operations | <!-- Team / Role --> | <!-- Next tier --> |
| Incident response | <!-- Team / Role --> | <!-- Next tier --> |
| Change management | <!-- Team / Role --> | <!-- Next tier --> |
| Capacity planning | <!-- Team / Role --> | <!-- Next tier --> |
| Security & compliance | <!-- Team / Role --> | <!-- Next tier --> |

## Service Level Objectives

| SLO | Target | Measurement | Breach Response |
|-----|--------|-------------|-----------------|
| Availability | <!-- e.g. 99.9% --> | <!-- Tool / metric --> | <!-- Pager / runbook --> |
| Recovery Time Objective (RTO) | <!-- e.g. < 4 hours --> | <!-- How tracked --> | <!-- Process --> |
| Recovery Point Objective (RPO) | <!-- e.g. < 1 hour --> | <!-- How tracked --> | <!-- Process --> |

## On-Call Arrangements

<!-- Describe the on-call rotation and escalation path. -->

| Tier | Coverage | Contact Method |
|------|----------|---------------|
| Primary on-call | <!-- Hours / 24x7 --> | <!-- PagerDuty \| Teams \| Phone --> |
| Escalation (Tier 2) | <!-- Hours --> | <!-- Contact method --> |
| Escalation (Tier 3) | <!-- Hours --> | <!-- Contact method --> |

## Change Management

<!-- Define how changes to this service or domain are categorised, approved, and deployed. -->

| Change Category | Approval Required | Deployment Window | Rollback Procedure |
|-----------------|-------------------|-------------------|--------------------|
| Standard | <!-- Auto-approved \| Team Lead --> | <!-- Any time \| Change window --> | <!-- Automated \| Manual --> |
| Normal | <!-- Change Board --> | <!-- Scheduled window --> | <!-- Reference runbook --> |
| Emergency | <!-- On-call owner --> | <!-- Immediate --> | <!-- Reference runbook --> |

## Runbook References

<!-- List the operational runbooks that support this operating model. -->

| Scenario | Runbook | Owner |
|----------|---------|-------|
| <!-- e.g. Service restart --> | <!-- Link or file reference --> | <!-- Team --> |
| <!-- e.g. Capacity scale-out --> | <!-- Link or file reference --> | <!-- Team --> |

## Monitoring & Alerting

<!-- Describe the key observability signals and alert thresholds for this service/domain. -->

| Signal | Tool | Threshold | Alert Target |
|--------|------|-----------|--------------|
| <!-- Metric / log event --> | <!-- e.g. Azure Monitor --> | <!-- e.g. > 5 errors/min --> | <!-- On-call channel --> |

## Platform Policies Applied

- <!-- PLCY-XXXX: Policy name -->

## Related Documents

- <!-- Link to related PSVCs, XCUTs, Composition Maps (MAP), or Composite Patterns (CMP) -->
