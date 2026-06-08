# Page Challenge: Benefit Amount

**Difficulty:** Medium  
**Points available:** 100  
**Scoring rubric:** See `SCORING-SHEET.md` in the hub repo

---

## What You Are Building

A benefit amount detail and edit page. Shows the calculated benefit amount for a claim, with a breakdown of components, and allows an override to be entered.

---

## Reference Layout

```
┌──────────────────────────────────────────────────────────┐
│  ← Back to Claim     Benefit Amount                     │
│  Claim: CLM-2024-0089   Policy: POL-10042               │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  BENEFIT CALCULATION                                     │
│  ┌────────────────────────────┬──────────────────────┐  │
│  │ Base Weekly Benefit        │ £ 450.00             │  │
│  │ Earnings Replacement Rate  │ 60%                  │  │
│  │ Adjustment (-)             │ £  50.00             │  │
│  │ ─────────────────────────  │ ─────────────────    │  │
│  │ Calculated Weekly Amount   │ £ 220.00             │  │
│  └────────────────────────────┴──────────────────────┘  │
│                                                          │
│  BENEFIT PERIOD                                          │
│  Start Date: 01 Feb 2024    End Date: 01 Aug 2024        │
│  Duration: 26 weeks                                      │
│                                                          │
│  OVERRIDE                                                │
│  Override Amount  [__________]  [ Apply Override ]      │
│  Override Reason  [__________________________________]   │
│                                                          │
│  [ Save ]   [ Cancel ]                                   │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

---

## Mock Data

```typescript
const MOCK_BENEFIT = {
  claimId: 'CLM-2024-0089',
  policyId: 'POL-10042',
  baseWeeklyBenefit: 450.00,
  earningsReplacementRate: 60,
  adjustment: 50.00,
  calculatedWeeklyAmount: 220.00,
  currency: 'GBP',
  periodStart: '2024-02-01',
  periodEnd: '2024-08-01',
  durationWeeks: 26,
  overrideAmount: null,
  overrideReason: ''
};
```

---

## Required Behaviour

- Display the benefit calculation breakdown in a read-only table on load
- Override section is a **Reactive Form** (`overrideAmount`, `overrideReason`)
- `overrideAmount`: numeric, must be greater than 0 if entered
- `overrideReason`: required if `overrideAmount` is filled in (conditional validator)
- "Apply Override" updates the displayed "Calculated Weekly Amount" to the override value
- "Save" commits the override (update the in-memory data model, show success message)
- "Cancel" resets the override form
- "← Back to Claim" navigates to `/claims` (stub route is fine)

---

## Component Structure (suggested)

```
app/
├── app-routing.module.ts
├── app.module.ts
├── features/
│   └── benefits/
│       ├── benefits.module.ts
│       ├── benefits-routing.module.ts
│       ├── benefit-amount/
│       │   ├── benefit-amount.component.ts
│       │   ├── benefit-amount.component.html
│       │   └── benefit-amount.component.scss
│       └── benefits.service.ts
└── shared/
    └── validators/
        └── conditional-required.validator.ts
```

---

## Scoring Focus for This Page

| Category | Key things reviewed |
|----------|-------------------|
| Code quality (40 pts) | Benefits module; conditional validator in own file; service holds state |
| Visual accuracy (35 pts) | Calculation table with totals row; benefit period section; clear override section |
| Functionality (25 pts) | Override updates calculated amount live; conditional validation works; save persists state |

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
