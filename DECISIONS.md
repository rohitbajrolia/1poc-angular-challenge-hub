# DECISIONS.md — Locked Technical Decisions

> These decisions are final. Do not deviate without explicit approval from Rohit.

## Angular & Node

| Decision | Value | Reason |
|----------|-------|--------|
| Angular version | `^21.2.14` | Latest stable at sprint start — enforced in every `package.json` |
| Node version | `20 LTS` | Stable, supported — enforced via `.nvmrc` in every dev repo |

## Project Structure

| Decision | Value | Reason |
|----------|-------|--------|
| Module style | NgModules (not standalone) | Team is learning Angular — standalone requires deeper understanding of providers |
| Scaffold flag | `--standalone=false` | Enforces NgModules on scaffold |
| Forms | Reactive Forms only | Template-driven forms are not production practice; rubric awards no points for them |
| Routing | `--routing=true` | Every app must have a router module even if only one route is used |
| Styles | `--style=scss` | SCSS for all projects |
| SSR | `--ssr=false` | No server-side rendering — this is a UI POC |

## Scaffold Command

```bash
npx -p @angular/cli@^21.2.14 ng new [repo-name] \
  --routing=true \
  --style=scss \
  --ssr=false \
  --standalone=false
```

Run this inside `C:\AngularProject\` or `~/AngularProject/` so the new folder lands in the right place.

## Data Layer

| Decision | Value |
|----------|-------|
| Backend | None — hardcoded JSON or `json-server` mock only |
| Real API calls | Not permitted |

## Branching

| Decision | Value |
|----------|-------|
| Dev branch naming | `dev/[name]` (e.g. `dev/venkat`) |
| Target branch for PR | `main` |
| Direct pushes to main | Not permitted after setup |

## UI Library

Developers may choose their own UI library (Angular Material, PrimeNG, NGX-Bootstrap, etc.).  
They must document their choice in their `README.md`.

## Scoring

See `SCORING-SHEET.md` for full rubric breakdown.
