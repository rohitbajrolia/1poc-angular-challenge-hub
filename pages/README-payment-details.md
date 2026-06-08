# Page Challenge: Payment Details

**Difficulty:** Medium  
**Points available:** 100  
**Scoring rubric:** See `SCORING-SHEET.md` in the hub repo

---

## What You Are Building

A payment details view that displays the details of a single payment record, with an edit form to update payment information.

---

## Reference Layout

```
┌──────────────────────────────────────────────────────┐
│  ← Back to Payments     Payment Details              │
├──────────────────────────────────────────────────────┤
│  Payment Reference: PAY-2024-00142                   │
│  Status: [ Processed ]   Date: 15 Jan 2024           │
├──────────────────────────────────────────────────────┤
│                                                      │
│  PAYMENT INFORMATION                                 │
│  ┌────────────────────┬─────────────────────────┐   │
│  │ Payee Name         │ John Smith               │   │
│  │ Payment Method     │ Bank Transfer            │   │
│  │ Bank Account       │ ****4521                 │   │
│  │ Amount             │ £ 1,250.00               │   │
│  │ Payment Date       │ 15 Jan 2024              │   │
│  │ Reference          │ CLM-2024-0089            │   │
│  └────────────────────┴─────────────────────────┘   │
│                                                      │
│  NOTES                                               │
│  Regular monthly benefit payment for claim 0089.     │
│                                                      │
│  [ Edit Payment ]                                    │
│                                                      │
└──────────────────────────────────────────────────────┘
```

---

## Mock Data

Hardcode one payment record:

```typescript
const MOCK_PAYMENT = {
  id: 'PAY-2024-00142',
  status: 'Processed',
  payeeName: 'John Smith',
  paymentMethod: 'Bank Transfer',
  bankAccountMasked: '****4521',
  amount: 1250.00,
  currency: 'GBP',
  paymentDate: '2024-01-15',
  reference: 'CLM-2024-0089',
  notes: 'Regular monthly benefit payment for claim 0089.'
};
```

---

## Required Behaviour

- Display the payment details in a read-only view on load
- "Edit Payment" button toggles the view into an inline edit form (same route, no navigation)
- Edit form pre-populates with current values
- Edit form uses **Reactive Forms**
- Fields editable in form: `payeeName`, `amount`, `paymentDate`, `notes`
- On save: update the displayed values and return to read-only view
- On cancel: discard changes and return to read-only view
- "← Back to Payments" navigates to `/payments` (stub route is fine)

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
│       ├── payment-details/
│       │   ├── payment-details.component.ts
│       │   ├── payment-details.component.html
│       │   └── payment-details.component.scss
│       └── payments.service.ts
└── shared/
    └── pipes/
        └── currency-format.pipe.ts   ← optional but shows extra skill
```

---

## Scoring Focus for This Page

| Category | Key things reviewed |
|----------|-------------------|
| Code quality (40 pts) | Payments module; service provides data; edit/view toggled via component state, not two routes |
| Visual accuracy (35 pts) | Two-column detail table; status badge; clear section headers |
| Functionality (25 pts) | Read/edit toggle works; form pre-fills correctly; save updates view |

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
