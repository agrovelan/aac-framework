# Runbook: {SERVICE / OPERATION NAME}

- **Date:** YYYY-MM-DD
- **Version:** 1.0
- **Author(s):** <!-- GitHub handles or names -->
- **Owning Team:** <!-- on-call rotation name or team -->
- **DocType:** runbook
- **Tags:** <!-- comma-separated labels, e.g. operations, incident-response -->

---

## Purpose

<!-- One paragraph: what operational task or alert does this runbook address? -->

## Scope

<!-- What systems, services, or environments does this runbook cover?
     What is explicitly out of scope? -->

## Prerequisites

- [ ] Access to <!-- system or tool (e.g. production Kubernetes cluster) -->
- [ ] <!-- other required tool, credential, or permission -->

## Runbook Steps

### Step 1: {Descriptive Step Title}

```bash
# Commands used in this step
```

**Expected output:**
```
<!-- What success looks like -->
```

**If this step fails:** <!-- Troubleshooting advice or escalation path -->

---

### Step 2: {Descriptive Step Title}

```bash
# Commands used in this step
```

**Expected output:**
```
<!-- What success looks like -->
```

---

<!-- Add or remove steps as needed. -->

## Verification

<!-- How do you confirm the operation completed successfully? -->

```bash
# Verification command(s)
```

## Rollback

<!-- Step-by-step instructions to undo the operation if something goes wrong. -->

```bash
# Rollback command(s)
```

## Escalation

| Condition | Escalation Path |
|-----------|-----------------|
| <!-- condition --> | <!-- team / person / PagerDuty policy --> |

## Related Documents

- <!-- Incident Post-Mortem, Component Design, on-call playbooks -->
