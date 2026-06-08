# Page Challenge: Login Page

**Difficulty:** Easy  
**Points available:** 100  
**Scoring rubric:** See `SCORING-SHEET.md` in the hub repo

---

## What You Are Building

A login page for the FINEOS enterprise UI. The user enters their username and password and submits the form to authenticate.

---

## Reference Layout

```
┌──────────────────────────────────────────┐
│           FINEOS                         │
│                                          │
│   ┌──────────────────────────────────┐   │
│   │  Username                        │   │
│   │  [________________________]      │   │
│   │                                  │   │
│   │  Password                        │   │
│   │  [________________________]      │   │
│   │                                  │   │
│   │  [ Log In ]                      │   │
│   │                                  │   │
│   │  Forgot password?                │   │
│   └──────────────────────────────────┘   │
│                                          │
│  © FINEOS Corporation                    │
└──────────────────────────────────────────┘
```

---

## Required Fields

| Field | Type | Validation |
|-------|------|-----------|
| Username | Text input | Required, min 3 chars |
| Password | Password input | Required, min 6 chars |

---

## Required Behaviour

- Form uses **Reactive Forms** (`FormGroup`, `FormControl`, `Validators`)
- Show inline validation errors below each field when field is touched and invalid
- "Log In" button is **disabled** while form is invalid
- On submit with valid data: navigate to a `/dashboard` route (can be a stub page — just a heading that says "Dashboard")
- "Forgot password?" link navigates to `/password-change` (stub is fine)
- No real API call — simulate with a timeout or just navigate directly

---

## Component Structure (suggested)

```
app/
├── app-routing.module.ts
├── app.module.ts
├── features/
│   └── auth/
│       ├── auth.module.ts
│       ├── auth-routing.module.ts
│       ├── login/
│       │   ├── login.component.ts
│       │   ├── login.component.html
│       │   └── login.component.scss
│       └── auth.service.ts
└── shared/
    └── (optional shared components)
```

---

## Scoring Focus for This Page

| Category | Key things reviewed |
|----------|-------------------|
| Code quality (40 pts) | Auth feature module created; service injected; no logic in template |
| Visual accuracy (35 pts) | Centred card layout; FINEOS branding; clean form labels |
| Functionality (25 pts) | Validation fires correctly; submit guard works; routing navigates correctly |

---

## Constraints Reminder

- Angular `^21.2.14`
- NgModules — not standalone
- Reactive Forms — not template-driven
- UI library: your choice — document it in this README
- No real backend

---

## What to Document in This README (add below)

After building, fill in:

**UI Library used:** ___________________  
**Packages added:** ___________________  
**How to run:** `nvm use && npm install && ng serve`  
**Known limitations:** ___________________
