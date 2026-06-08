# SCORING-SHEET.md — Evaluation Rubric

> Used on Day 7 to score all 8 submissions. Max 100 points per developer.

---

## Scoring Template

**Developer:** ___________________  
**Page:** ___________________  
**Repo:** ___________________  
**Reviewed by:** Rohit Bajrolia  
**Review date:** ___________________

---

## Category 1 — Code Quality & Structure (40 pts)

| Sub-criterion | Max | Score | Notes |
|--------------|-----|-------|-------|
| Module separation — feature module(s) created, not everything in AppModule | 8 | | |
| Service layer — data/logic in injectable services, not in components | 8 | | |
| Component design — smart/dumb split, single responsibility | 8 | | |
| Naming conventions — components, services, modules, variables follow Angular style guide | 8 | | |
| No logic in templates — no complex expressions in HTML, computed values in component class | 8 | | |
| **Category 1 Total** | **40** | | |

---

## Category 2 — Visual Accuracy (35 pts)

| Sub-criterion | Max | Score | Notes |
|--------------|-----|-------|-------|
| Layout fidelity — overall page structure matches the FINEOS reference | 10 | | |
| Field labels — all required fields present, correctly labelled | 8 | | |
| Navigation flow — links/buttons navigate to the right place | 8 | | |
| Responsive — page is usable at standard desktop and tablet widths | 9 | | |
| **Category 2 Total** | **35** | | |

---

## Category 3 — Functionality (25 pts)

| Sub-criterion | Max | Score | Notes |
|--------------|-----|-------|-------|
| Data displays correctly — mock/hardcoded data renders as expected | 8 | | |
| Interactions work — buttons, selections, toggles function correctly | 7 | | |
| Routing — page-level and sub-page routing works as specified | 5 | | |
| Form validation — required fields, error messages, submit guard | 5 | | |
| **Category 3 Total** | **25** | | |

---

## Final Score

| Category | Max | Score |
|----------|-----|-------|
| Code Quality & Structure | 40 | |
| Visual Accuracy | 35 | |
| Functionality | 25 | |
| **TOTAL** | **100** | |

---

## Leaderboard (fill in after all reviews)

| Rank | Developer | Page | Score |
|------|-----------|------|-------|
| 1 | | | |
| 2 | | | |
| 3 | | | |
| 4 | | | |
| 5 | | | |
| 6 | | | |
| 7 | | | |
| 8 | | | |

---

## Review Checklist (per repo)

```
[ ] Cloned locally
[ ] nvm use && npm install — no errors
[ ] ng build --configuration production — no errors
[ ] ng serve — app loads at localhost:4200
[ ] Verified Angular version is ^21.2.14
[ ] Verified NgModules (not standalone)
[ ] Verified Reactive Forms used
[ ] Scored Category 1
[ ] Scored Category 2
[ ] Scored Category 3
[ ] Total recorded in leaderboard
```
