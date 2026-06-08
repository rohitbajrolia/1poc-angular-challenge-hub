# Page Challenge: Events Browser

**Difficulty:** Medium  
**Points available:** 100  
**Scoring rubric:** See `SCORING-SHEET.md` in the hub repo

---

## What You Are Building

A browsable list of system events associated with a claim. Users can filter by event type and date range, and click an event to see its detail.

---

## Reference Layout

```
┌──────────────────────────────────────────────────────────┐
│  Events Browser     Claim: CLM-2024-0089                 │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  FILTERS                                                 │
│  Event Type  [ All Types ▾]                             │
│  Date From   [__________]   Date To   [__________]      │
│  [ Apply ]   [ Clear ]                                   │
│                                                          │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  12 events                                               │
│  ┌────────────┬─────────────────────────┬─────────────┐ │
│  │ Date/Time  │ Event                   │ User        │ │
│  ├────────────┼─────────────────────────┼─────────────┤ │
│  │ 15 Jan 24  │ Claim Registered        │ system      │ │
│  │ 16 Jan 24  │ Document Uploaded       │ j.smith     │ │
│  │ 18 Jan 24  │ Benefit Calculated      │ system      │ │
│  │ 20 Jan 24  │ Payment Issued          │ system      │ │
│  │ ...        │ ...                     │ ...         │ │
│  └────────────┴─────────────────────────┴─────────────┘ │
│                                                          │
│  [ ← Prev ]   Page 1 of 2   [ Next → ]                  │
└──────────────────────────────────────────────────────────┘
```

---

## Mock Data

```typescript
const MOCK_EVENTS = [
  { id: 1,  date: '2024-01-15T09:00:00', type: 'Claim',    event: 'Claim Registered',       user: 'system',    detail: 'Claim CLM-2024-0089 created from policy POL-10042.' },
  { id: 2,  date: '2024-01-16T10:30:00', type: 'Document', event: 'Document Uploaded',       user: 'j.smith',   detail: 'Medical certificate uploaded (doc-001.pdf).' },
  { id: 3,  date: '2024-01-18T11:00:00', type: 'Benefit',  event: 'Benefit Calculated',      user: 'system',    detail: 'Weekly benefit calculated at £220.00.' },
  { id: 4,  date: '2024-01-20T09:00:00', type: 'Payment',  event: 'Payment Issued',          user: 'system',    detail: 'Payment PAY-2024-00142 issued for £1,250.00.' },
  { id: 5,  date: '2024-01-22T14:00:00', type: 'Claim',    event: 'Claim Updated',           user: 'r.patel',   detail: 'Notes updated on claim.' },
  { id: 6,  date: '2024-01-25T09:30:00', type: 'Document', event: 'Document Uploaded',       user: 'j.smith',   detail: 'Employer confirmation uploaded (doc-002.pdf).' },
  { id: 7,  date: '2024-02-01T09:00:00', type: 'Benefit',  event: 'Benefit Period Started',  user: 'system',    detail: 'Benefit period commenced 01 Feb 2024.' },
  { id: 8,  date: '2024-02-05T15:00:00', type: 'Payment',  event: 'Payment Issued',          user: 'system',    detail: 'Payment PAY-2024-00189 issued for £220.00.' },
  { id: 9,  date: '2024-02-10T11:00:00', type: 'Claim',    event: 'Claim Note Added',        user: 'r.patel',   detail: 'Customer called to confirm bank details.' },
  { id: 10, date: '2024-02-12T09:00:00', type: 'Payment',  event: 'Payment Reversed',        user: 'system',    detail: 'Payment PAY-2024-00189 reversed — incorrect account.' },
  { id: 11, date: '2024-02-13T09:30:00', type: 'Payment',  event: 'Payment Re-issued',       user: 'system',    detail: 'Payment PAY-2024-00201 re-issued for £220.00.' },
  { id: 12, date: '2024-02-15T10:00:00', type: 'Benefit',  event: 'Benefit Amount Overridden', user: 'r.patel', detail: 'Override applied: £250.00. Reason: backdated adjustment.' },
];
```

---

## Required Behaviour

- Display events in reverse-chronological order (newest first) by default
- Filter form uses **Reactive Forms**
- Event Type dropdown options: `All Types`, `Claim`, `Document`, `Benefit`, `Payment`
- Date From / Date To filters the list by date range
- Client-side filtering (no HTTP)
- Show total event count above the table
- Pagination: 6 events per page, Prev/Next buttons
- Clicking a row opens an event detail panel **below the table** (not a new route) showing the `detail` field plus formatted date/time and user
- "Clear" resets filters and shows all 12 events, page 1

---

## Component Structure (suggested)

```
app/
├── app-routing.module.ts
├── app.module.ts
├── features/
│   └── events/
│       ├── events.module.ts
│       ├── events-routing.module.ts
│       ├── events-browser/
│       │   ├── events-browser.component.ts
│       │   ├── events-browser.component.html
│       │   └── events-browser.component.scss
│       ├── event-detail-panel/
│       │   ├── event-detail-panel.component.ts
│       │   ├── event-detail-panel.component.html
│       │   └── event-detail-panel.component.scss
│       └── events.service.ts
```

---

## Scoring Focus for This Page

| Category | Key things reviewed |
|----------|-------------------|
| Code quality (40 pts) | Events module; service filters/paginates; detail panel is a separate component receiving `@Input` |
| Visual accuracy (35 pts) | Filter row; count label; paginated table; inline detail panel |
| Functionality (25 pts) | Filtering works on type and date; pagination works; detail panel shows on row click |

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
