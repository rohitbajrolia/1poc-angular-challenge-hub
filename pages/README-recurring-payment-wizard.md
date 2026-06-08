# Page Challenge: Recurring Payment Wizard

**Difficulty:** Hard  
**Points available:** 100  
**Scoring rubric:** See `SCORING-SHEET.md` in the hub repo

---

## What You Are Building

A multi-step wizard to set up a recurring payment. The wizard has 4 steps: Payee, Schedule, Amount, and Review & Confirm.

---

## Reference Layout

```
┌──────────────────────────────────────────────────────────────┐
│  Set Up Recurring Payment                                    │
├──────────────────────────────────────────────────────────────┤
│  [1. Payee] ──── [2. Schedule] ──── [3. Amount] ──── [4. Review] │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  STEP 1: PAYEE DETAILS                                       │
│  Payee Name    [__________________________]                  │
│  Payee Type    [ Individual ▾]                              │
│  Bank Sort     [__-__-__]                                    │
│  Account No.   [__________]                                  │
│  Reference     [__________________________]                  │
│                                                              │
│                              [ Next → ]                      │
│                                                              │
├──────────────────────────────────────────────────────────────┤
│  STEP 2: SCHEDULE                                            │
│  Frequency     [ Monthly ▾]                                 │
│  Start Date    [__________]                                  │
│  End Date      [__________]  (optional)                      │
│  Day of Month  [__]  (if Monthly)                            │
│                                                              │
│  [ ← Back ]                         [ Next → ]              │
│                                                              │
├──────────────────────────────────────────────────────────────┤
│  STEP 3: AMOUNT                                              │
│  Payment Amount  £ [____________]                            │
│  Currency        [ GBP ▾]                                   │
│  Notes           [__________________________________]        │
│                                                              │
│  [ ← Back ]                         [ Next → ]              │
│                                                              │
├──────────────────────────────────────────────────────────────┤
│  STEP 4: REVIEW & CONFIRM                                    │
│  ┌────────────────────┬─────────────────────────────────┐   │
│  │ Payee              │ John Smith                      │   │
│  │ Bank               │ 20-00-00 / 12345678             │   │
│  │ Frequency          │ Monthly — 1st of month          │   │
│  │ Start Date         │ 01 Feb 2024                     │   │
│  │ Amount             │ £ 500.00 GBP                    │   │
│  └────────────────────┴─────────────────────────────────┘   │
│                                                              │
│  [ ← Back ]                    [ Confirm & Save ]           │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

---

## Required Behaviour

### Wizard Steps
Each step is its own component. Step state must be preserved when navigating back and forward (data not lost when going Back).

### Step 1 — Payee
| Field | Validation |
|-------|-----------|
| Payee Name | Required |
| Payee Type | Required (Individual / Company) |
| Bank Sort Code | Required, pattern `\d{2}-\d{2}-\d{2}` |
| Account Number | Required, exactly 8 digits |
| Reference | Optional |

### Step 2 — Schedule
| Field | Validation |
|-------|-----------|
| Frequency | Required (Weekly / Fortnightly / Monthly) |
| Start Date | Required, must not be in the past |
| End Date | Optional, must be after Start Date if provided |
| Day of Month | Required and shown only when Frequency = Monthly (1–28) |

### Step 3 — Amount
| Field | Validation |
|-------|-----------|
| Payment Amount | Required, must be > 0 |
| Currency | Required (GBP / EUR / USD) |
| Notes | Optional |

### Step 4 — Review
- Read-only summary of all entered data
- "Confirm & Save": save the in-memory model, navigate to `/payments` and show a success message (use query param or service state)
- "← Back" returns to Step 3 with data intact

### Step indicator
- Highlight the current step; completed steps shown as ticked/filled

---

## Component Structure (suggested)

```
app/
├── app-routing.module.ts
├── app.module.ts
├── features/
│   └── payments/
│       ├── payments.module.ts
│       ├── payments-routing.module.ts
│       ├── recurring-payment-wizard/
│       │   ├── recurring-payment-wizard.component.ts   ← orchestrator
│       │   ├── recurring-payment-wizard.component.html
│       │   ├── recurring-payment-wizard.component.scss
│       │   ├── step-payee/
│       │   │   ├── step-payee.component.ts
│       │   │   └── ...
│       │   ├── step-schedule/
│       │   │   ├── step-schedule.component.ts
│       │   │   └── ...
│       │   ├── step-amount/
│       │   │   ├── step-amount.component.ts
│       │   │   └── ...
│       │   └── step-review/
│       │       ├── step-review.component.ts
│       │       └── ...
│       └── payments.service.ts
```

---

## Scoring Focus for This Page

| Category | Key things reviewed |
|----------|-------------------|
| Code quality (40 pts) | Payments module; orchestrator + 4 step components; service holds wizard state; no logic in templates |
| Visual accuracy (35 pts) | Step indicator bar; clean form layouts per step; review summary table |
| Functionality (25 pts) | Back/Next preserve data; all validators fire; Day of Month shows/hides correctly; confirm navigates with success |

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
