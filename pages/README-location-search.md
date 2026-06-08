# Page Challenge: Location Search

**Difficulty:** Medium  
**Points available:** 100  
**Scoring rubric:** See `SCORING-SHEET.md` in the hub repo

---

## What You Are Building

A searchable location lookup page. The user enters search criteria (name, city, postcode) and a results table is displayed below.

---

## Reference Layout

```
┌────────────────────────────────────────────────────────┐
│  Location Search                                       │
├────────────────────────────────────────────────────────┤
│                                                        │
│  SEARCH CRITERIA                                       │
│  Name     [_______________________]                    │
│  City     [_______________________]                    │
│  Postcode [____________]                               │
│  Type     [ All Types ▾]                              │
│                                                        │
│  [ Search ]   [ Clear ]                               │
│                                                        │
├────────────────────────────────────────────────────────┤
│                                                        │
│  RESULTS  (3 found)                                    │
│  ┌──────────┬───────────────┬──────────┬───────────┐  │
│  │ Name     │ Address       │ City     │ Type      │  │
│  ├──────────┼───────────────┼──────────┼───────────┤  │
│  │ HQ Office│ 1 Main St     │ London   │ Office    │  │
│  │ Depot A  │ 45 Park Road  │ Bristol  │ Warehouse │  │
│  │ Branch B │ 12 High St    │ Leeds    │ Office    │  │
│  └──────────┴───────────────┴──────────┴───────────┘  │
│                                                        │
│  Click a row to view location details                  │
└────────────────────────────────────────────────────────┘
```

---

## Mock Data

```typescript
const MOCK_LOCATIONS = [
  { id: 1, name: 'HQ Office',      address: '1 Main Street',    city: 'London',     postcode: 'EC1A 1BB', type: 'Office' },
  { id: 2, name: 'Depot A',        address: '45 Park Road',     city: 'Bristol',    postcode: 'BS1 4DJ',  type: 'Warehouse' },
  { id: 3, name: 'Branch B',       address: '12 High Street',   city: 'Leeds',      postcode: 'LS1 2AB',  type: 'Office' },
  { id: 4, name: 'South Office',   address: '8 Canal Way',      city: 'Birmingham', postcode: 'B1 1AA',   type: 'Office' },
  { id: 5, name: 'Fulfilment Hub', address: '99 Industrial Est',city: 'Manchester', postcode: 'M1 1AE',   type: 'Warehouse' },
  { id: 6, name: 'Branch C',       address: '3 Castle Road',    city: 'Edinburgh',  postcode: 'EH1 1BB',  type: 'Branch' },
];
```

---

## Required Behaviour

- Search form uses **Reactive Forms**
- All fields are optional — submitting empty returns all results
- Filtering is done **in the component** (no fake HTTP call required, but using a service to provide/filter data earns marks)
- Results table appears below the form after search is submitted
- "Clear" button resets the form and clears results
- Clicking a row navigates to `/locations/:id` (stub detail page with the location name shown)
- Type dropdown options: `All Types`, `Office`, `Warehouse`, `Branch`
- Show result count above the table

---

## Component Structure (suggested)

```
app/
├── app-routing.module.ts
├── app.module.ts
├── features/
│   └── locations/
│       ├── locations.module.ts
│       ├── locations-routing.module.ts
│       ├── location-search/
│       │   ├── location-search.component.ts
│       │   ├── location-search.component.html
│       │   └── location-search.component.scss
│       ├── location-detail/
│       │   ├── location-detail.component.ts
│       │   ├── location-detail.component.html
│       │   └── location-detail.component.scss
│       └── locations.service.ts
```

---

## Scoring Focus for This Page

| Category | Key things reviewed |
|----------|-------------------|
| Code quality (40 pts) | Service filters data; no filtering logic in template; feature module |
| Visual accuracy (35 pts) | Two-section layout (criteria + results); results count; table with clear columns |
| Functionality (25 pts) | Search filters correctly on all fields; clear works; row click routes correctly |

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
