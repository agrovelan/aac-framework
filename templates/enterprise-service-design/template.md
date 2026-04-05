# ESVC: {SERVICE NAME}

## Metadata

- Date: <!-- YYYY-MM-DD -->
- Status: <!-- Draft | Review | Approved | Deprecated -->
- Owner: <!-- Public Cloud -->
- Dependency Owner: <!-- Public Cloud -->
- Version: <!-- e.g. 1.0.0 -->
- Cloud Scope: <!-- AZR | GCP -->

## Purpose

<!--
Describe the enterprise service and the business or technical capability it provides.
This document is for services that platform workloads depend on but do not own.
-->

## Ownership Model

- Service ownership: <!-- External owner, e.g. Public Cloud -->
- Platform responsibility: <!-- Integration, configuration, guardrails, support model -->
- Escalation path: <!-- Vendor or public cloud support process -->

## Dependency Boundary

<!--
Define what the platform can change versus what is controlled by the external owner.
-->

- Service roadmap: <!-- Controlled by Public Cloud -->
- Service availability target: <!-- Controlled by Public Cloud; include SLA or SLO -->
- Service configuration: <!-- Controlled by Platform Team or Shared -->
- Access and security guardrails: <!-- Controlled by Shared owners -->

## Integration Contract

- Interface: <!-- Endpoint or Resource -->
- Interface type: <!-- API | Portal | Event | SDK -->
- Contract details: <!-- Authentication, authorization, request and response behavior -->

## Operational Expectations

- Incident response: <!-- Escalation target and response model -->
- Change notification: <!-- Release notes, advisory process, deprecation timeline -->
- Cost model: <!-- Billing model and attribution -->
- Compliance evidence: <!-- Audit or compliance source -->

## Risks and Mitigations

- Risk: <!-- External service outage -->
  Mitigation: <!-- Fallback pattern or DR plan -->
- Risk: <!-- API or behavior change -->
  Mitigation: <!-- Version pinning or compatibility testing -->

## Related Documents

- <!-- Link to Platform Policy (PLCY) -->
- <!-- Link to Cross Cutting Concern (XCUT) -->
- <!-- Link to Operating Model Spec (OMS) -->
