# Post-Mortem: {INCIDENT TITLE}

- **Date:** YYYY-MM-DD
- **Severity:** `SEV-1` | `SEV-2` | `SEV-3`
- **Duration:** <!-- e.g. 2 h 15 min -->
- **Lead:** <!-- incident commander GitHub handle -->
- **Participants:** <!-- names or GitHub handles -->
- **DocType:** post-mortem
- **Tags:** <!-- comma-separated labels, e.g. database, network, deployment -->

---

## Incident Summary

<!-- Two or three sentences describing what happened, the customer impact,
     and the resolution. Write this for an audience who was not involved. -->

## Timeline

All times in UTC.

| Time (UTC) | Event |
|------------|-------|
| HH:MM | <!-- first detection or alert fired --> |
| HH:MM | <!-- investigation begins --> |
| HH:MM | <!-- root cause identified --> |
| HH:MM | <!-- mitigation applied --> |
| HH:MM | <!-- incident resolved / all-clear --> |

## Impact

| Dimension | Description |
|-----------|-------------|
| Customer impact | <!-- # users affected, features unavailable, data loss --> |
| Duration | <!-- total duration of user-facing impact --> |
| Blast radius | <!-- services, regions, or tenants affected --> |
| SLA breach | `Yes` \| `No` |

## Root Cause Analysis

<!-- Use the 5-Whys or Fishbone technique.
     Describe the technical root cause and the systemic / process root cause. -->

### Technical Root Cause

<!-- What specific technical failure triggered the incident? -->

### Contributing Factors

- <!-- factor 1 -->
- <!-- factor 2 -->

## What Went Well

- <!-- thing 1 that helped detect or mitigate the incident quickly -->
- <!-- thing 2 -->

## What Went Poorly

- <!-- thing 1 that slowed detection or resolution -->
- <!-- thing 2 -->

## Action Items

| Action | Owner | Priority | Due Date |
|--------|-------|----------|----------|
| <!-- Fix or improve X --> | <!-- @handle --> | `High` \| `Medium` \| `Low` | YYYY-MM-DD |
| <!-- Add monitoring for Y --> | <!-- @handle --> | | YYYY-MM-DD |

## Lessons Learned

<!-- What did the team learn from this incident that should be shared more broadly? -->

## Related Documents

- <!-- Runbook, ADR, RFC, component design that is relevant to this incident -->
