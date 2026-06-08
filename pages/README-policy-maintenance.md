# Page Challenge: Policy Maintenance

**Difficulty:** Hard  
**Points available:** 100  
**Scoring rubric:** See `SCORING-SHEET.md` in the hub repo

---

## What You Are Building

A multi-section policy record page. Users can view and edit policy details across three tabs: Policy Info, Coverage, and Beneficiaries.

---

## Reference Layout

```
┌────────────────────────────────────────────────────────────┐
│  ← Back to Policies     Policy Maintenance                │
│  Policy: POL-10042   Status: [ Active ]   Holder: J. Smith│
├────────────────────────────────────────────────────────────┤
│  [ Policy Info ] [ Coverage ] [ Beneficiaries ]           │
├────────────────────────────────────────────────────────────┤
│                                                            │
│  (Tab: Policy Info)                                        │
│  Policy Number    POL-10042                                │
│  Policy Type      Group Income Protection                  │
│  Effective Date   01 Jan 2023                              │
│  Expiry Date      31 Dec 2025                              │
│  Employer         Capgemini UK Ltd                         │
│  Insurer          FINEOS Insurance                         │
│                                                            │
│  [ Edit ]                                                  │
│                                                            │
│  (Tab: Coverage)                                           │
│  Coverage Type    Income Protection                        │
│  Benefit %        60% of salary                            │
│  Max Weekly Amt   £ 500.00                                 │
│  Waiting Period   13 weeks                                 │
│  Benefit Period   Up to age 65                             │
│                                                            │
│  (Tab: Beneficiaries)                                      │
│  ┌─────────────┬──────────────┬────────┬──────────────┐   │
│  │ Name        │ Relationship │ Share  │ Actions      │   │
│  ├─────────────┼──────────────┼────────┼──────────────┤   │
│  │ Mary Smith  │ Spouse       │ 100%   │ [Edit][Del]  │   │
│  └─────────────┴──────────────┴────────┴──────────────┘   │
│  [ + Add Beneficiary ]                                     │
└────────────────────────────────────────────────────────────┘
```

---

## Mock Data

```typescript
const MOCK_POLICY = {
  id: 'POL-10042',
  status: 'Active',
  holderName: 'J. Smith',
  policyType: 'Group Income Protection',
  effectiveDate: '2023-01-01',
  expiryDate: '2025-12-31',
  employer: 'Capgemini UK Ltd',
  insurer: 'FINEOS Insurance',
  coverage: {
    type: 'Income Protection',
    benefitPercent: 60,
    maxWeeklyAmount: 500.00,
    currency: 'GBP',
    waitingPeriodWeeks: 13,
    benefitPeriod: 'Up to age 65'
  },
  beneficiaries: [
    { id: 1, name: 'Mary Smith', relationship: 'Spouse', sharePercent: 100 }
  ]
};
```

---

## Required Behaviour

### Tabs
- Three tabs: **Policy Info**, **Coverage**, **Beneficiaries**
- Implemented with Angular Router child routes OR tab state in the component — either is acceptable, but child routes earns more points

### Policy Info tab
- Read-only display on load
- "Edit" button switches to an edit form (Reactive Forms)
- Editable fields: `policyType`, `effectiveDate`, `expiryDate`, `employer`
- Save updates the in-memory model; Cancel discards changes

### Coverage tab
- Read-only display
- "Edit" button switches to edit form
- Editable fields: `benefitPercent`, `maxWeeklyAmount`, `waitingPeriodWeeks`, `benefitPeriod`

### Beneficiaries tab
- Read-only list with Edit and Delete per row
- "Edit" opens an inline form for that beneficiary
- "Delete" removes from the list (with confirmation — a simple `window.confirm` is acceptable)
- "+ Add Beneficiary" opens a blank form to add a new row
- Validation: total of all `sharePercent` values must equal 100% — show a warning if not

---

## Component Structure (suggested)

```
app/
├── app-routing.module.ts
├── app.module.ts
├── features/
│   └── policies/
│       ├── policies.module.ts
│       ├── policies-routing.module.ts
│       ├── policy-maintenance/
│       │   ├── policy-maintenance.component.ts
│       │   ├── policy-maintenance.component.html
│       │   └── policy-maintenance.component.scss
│       ├── policy-info/
│       │   ├── policy-info.component.ts
│       │   └── ...
│       ├── policy-coverage/
│       │   ├── policy-coverage.component.ts
│       │   └── ...
│       ├── policy-beneficiaries/
│       │   ├── policy-beneficiaries.component.ts
│       │   └── ...
│       └── policies.service.ts
```

---

## Scoring Focus for This Page

| Category | Key things reviewed |
|----------|-------------------|
| Code quality (40 pts) | Feature module; separate component per tab; service manages state; validators |
| Visual accuracy (35 pts) | Tab navigation; status badge in header; clean detail tables; beneficiary table with actions |
| Functionality (25 pts) | All three edit flows work; add/delete beneficiary works; share % validation warns correctly |

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
