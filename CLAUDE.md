# CLAUDE.md — Project Briefing for Claude Code

> This file is read automatically by Claude Code on every session start.
> It contains the full context of this project — what it is, what's done, what's pending, and how to work here.

---

## Who I Am

**Rohit Bajrolia** — Enterprise Architect at Capgemini.
I lead a team of 8 developers. I am running a 1-week Angular POC sprint challenge.

---

## What This Project Is

We have a vendor-supplied enterprise UI (FINEOS platform) delivered as a WAR file — built with JSP, XML, TLD, CSS, JS. We are rewriting the UI from scratch in Angular 21.

As a learning and competitive exercise, each of my 8 developers picks 1 page from the existing UI and rewrites it in Angular 21 in one week. I score all 8 submissions and award a cash prize to the winner.

---

## Parent Folder Structure on This Machine

```
AngularProject/                            ← parent folder (open this in VS Code)
├── 1poc-angular-challenge-hub/            ← hub repo (linked to GitHub, you are here)
├── poc-angular-venkat/                    ← dev repo (to be cloned)
├── poc-angular-alekhya/                   ← dev repo (to be cloned)
├── poc-angular-pooja/                     ← dev repo (to be cloned)
├── poc-angular-nagendra/                  ← dev repo (to be cloned)
├── poc-angular-naveen/                    ← dev repo (to be cloned)
├── poc-angular-deepak/                    ← dev repo (to be cloned)
├── poc-angular-arunish/                   ← dev repo (to be cloned)
└── poc-angular-vamshi/                    ← dev repo (to be cloned)
```

---

## GitHub Account

- **Username:** `rohitbajrolia`
- **Profile:** https://github.com/rohitbajrolia
- **All repos are public**

---

## The 9 GitHub Repos

| Folder name | GitHub repo URL | Status |
|-------------|----------------|--------|
| `1poc-angular-challenge-hub` | https://github.com/rohitbajrolia/poc-angular-challenge-hub | Created on GitHub ✅, linked locally ✅ |
| `poc-angular-venkat` | https://github.com/rohitbajrolia/poc-angular-venkat | Created on GitHub ✅, not yet cloned locally |
| `poc-angular-alekhya` | https://github.com/rohitbajrolia/poc-angular-alekhya | Created on GitHub ✅, not yet cloned locally |
| `poc-angular-pooja` | https://github.com/rohitbajrolia/poc-angular-pooja | Created on GitHub ✅, not yet cloned locally |
| `poc-angular-nagendra` | https://github.com/rohitbajrolia/poc-angular-nagendra | Created on GitHub ✅, not yet cloned locally |
| `poc-angular-naveen` | https://github.com/rohitbajrolia/poc-angular-naveen | Created on GitHub ✅, not yet cloned locally |
| `poc-angular-deepak` | https://github.com/rohitbajrolia/poc-angular-deepak | Created on GitHub ✅, not yet cloned locally |
| `poc-angular-arunish` | https://github.com/rohitbajrolia/poc-angular-arunish | Created on GitHub ✅, not yet cloned locally |
| `poc-angular-vamshi` | https://github.com/rohitbajrolia/poc-angular-vamshi | Created on GitHub ✅, not yet cloned locally |

> Note: The local folder is named `1poc-angular-challenge-hub` but the GitHub repo is `poc-angular-challenge-hub`. The `1` prefix is just for local sort ordering.

---

## The 8 Developers

| Name | Repo | Branch to work on |
|------|------|-------------------|
| Venkat | poc-angular-venkat | dev/venkat |
| Alekhya | poc-angular-alekhya | dev/alekhya |
| Pooja | poc-angular-pooja | dev/pooja |
| Nagendra | poc-angular-nagendra | dev/nagendra |
| Naveen | poc-angular-naveen | dev/naveen |
| Deepak | poc-angular-deepak | dev/deepak |
| Arunish | poc-angular-arunish | dev/arunish |
| Vamshi | poc-angular-vamshi | dev/vamshi |

---

## Sprint Timeline

| Day | What happens |
|-----|-------------|
| Day 1 | Kickoff — pages claimed, READMEs dropped into dev repos |
| Days 2–5 | Build time |
| Day 6 | Code freeze — PR to main by EOD |
| Day 7 | Review — all 8 repos scored, winner announced |

---

## Locked Technical Decisions (Do Not Change These)

| Decision | Value |
|----------|-------|
| Angular version | `^21.2.14` — enforced in every dev repo `package.json` |
| Node version | `20 LTS` — enforced via `.nvmrc` in every dev repo |
| Branching | Devs work on `dev/[name]`, PR to `main` |
| UI library | Developer's free choice — must document in README |
| Data layer | Hardcoded JSON or `json-server` mock — no real backend |
| Module style | NgModules (not standalone) — `--standalone=false` on scaffold |
| Forms | Reactive Forms — not template-driven |
| Scaffold command | `npx -p @angular/cli@^21.2.14 ng new [repo-name] --routing=true --style=scss --ssr=false --standalone=false` |

---

## Scoring Rubric (100 pts per submission)

| Category | Points | What it covers |
|----------|--------|---------------|
| Code quality & structure | 40 | Module separation, service layer, component design, naming, no logic in templates |
| Visual accuracy | 35 | Layout fidelity, field labels, navigation flow, responsive |
| Functionality | 25 | Data displays, interactions work, routing, form validation |

---

## The 8 Pages Available to Claim

One page per developer. First come, first served.

| # | Page | Difficulty | README file in hub |
|---|------|-----------|-------------------|
| 1 | Login Page | Easy | `pages/README-login.md` |
| 2 | Password Change | Easy | `pages/README-password-change.md` |
| 3 | Payment Details | Medium | `pages/README-payment-details.md` |
| 4 | Location Search | Medium | `pages/README-location-search.md` |
| 5 | Benefit Amount | Medium | `pages/README-benefit-amount.md` |
| 6 | Events Browser | Medium | `pages/README-events-browser.md` |
| 7 | Policy Maintenance | Hard | `pages/README-policy-maintenance.md` |
| 8 | Recurring Payment Wizard | Hard | `pages/README-recurring-payment-wizard.md` |

---

## Hub Repo — Required File Structure

The `1poc-angular-challenge-hub` folder must contain exactly this:

```
1poc-angular-challenge-hub/
├── CLAUDE.md                          ← this file
├── .gitignore
├── README.md
├── CLAIMED.md
├── DECISIONS.md
├── KICKOFF-MESSAGE.md
├── PAGE-INVENTORY.md
├── SCAFFOLD.md
├── SCORING-SHEET.md
├── poc-challenge.code-workspace
├── docs/
│   └── index.html                     ← GitHub Pages dashboard
├── .github/
│   └── workflows/
│       └── deploy.yml                 ← GitHub Actions auto-deploy
├── pages/
│   ├── README-login.md
│   ├── README-password-change.md
│   ├── README-payment-details.md
│   ├── README-location-search.md
│   ├── README-benefit-amount.md
│   ├── README-events-browser.md
│   ├── README-policy-maintenance.md
│   └── README-recurring-payment-wizard.md
└── scripts/
    ├── claim-page.sh
    └── setup-repos.sh
```

---

## Each Developer Repo — Required File Structure

Every one of the 8 dev repos must have exactly these files on `main` before kickoff:

```
poc-angular-[name]/
├── .nvmrc                    ← contains just: 20
├── .gitignore
├── README.md                 ← placeholder until they claim a page
└── ANGULAR-LEARNING.md       ← Angular 21 learning guide aligned to scoring rubric
```

After a developer claims a page, their `README.md` gets replaced with the matching page README from `1poc-angular-challenge-hub/pages/`.

---

## Current Status — What Is Done vs Pending

### DONE
- [x] Full page inventory created (54 pages from WAR file analysed)
- [x] All document files generated (DECISIONS, SCAFFOLD, SCORING-SHEET, KICKOFF-MESSAGE, PAGE-INVENTORY, CLAIMED)
- [x] 8 page READMEs written (one per developer page)
- [x] GitHub Pages dashboard built (`docs/index.html`)
- [x] GitHub Actions workflow built (`deploy.yml`)
- [x] ANGULAR-LEARNING.md written (Angular 21 patterns aligned to scoring rubric)
- [x] All 9 GitHub repos created under rohitbajrolia
- [x] `1poc-angular-challenge-hub` folder created locally and linked to GitHub repo
- [x] VS Code workspace file built (`poc-challenge.code-workspace`)

### PENDING — HUB REPO
- [ ] Create folder structure inside `1poc-angular-challenge-hub`: `docs/`, `pages/`, `scripts/`, `.github/workflows/`
- [ ] Place all generated files into correct folders (see structure above)
- [ ] First commit and push to main
- [ ] Enable GitHub Pages: Settings → Pages → Branch: main / Folder: /docs
- [ ] Verify GitHub Actions ran green (Actions tab)
- [ ] Confirm dashboard live at `https://rohitbajrolia.github.io/poc-angular-challenge-hub`

### PENDING — 8 DEVELOPER REPOS
- [ ] Clone each dev repo into `AngularProject/` parent folder
- [ ] Add 4 files to each: `.nvmrc`, `.gitignore`, `README.md`, `ANGULAR-LEARNING.md`
- [ ] Commit and push to `main` for each
- [ ] Create `dev/[name]` branch for each and push it
- [ ] Set branch protection on `main` for each (require PR — no direct push)

### PENDING — PRE-KICKOFF TASKS
- [ ] Fill in 3 placeholders in `KICKOFF-MESSAGE.md`:
  - `[LINK TO PAGE LIST]` → `https://rohitbajrolia.github.io/poc-angular-challenge-hub`
  - `[DAY 6 DATE]` → actual date
  - `[PRIZE AMOUNT]` → actual amount
- [ ] Update `CURRENT_SPRINT_DAY = 1` in `docs/index.html` on Day 1 morning
- [ ] Paste kickoff message into Teams

---

## Day-to-Day Workflow (Once Sprint Starts)

### When a developer claims a page
1. Copy `pages/README-[pagename].md` from hub into their repo root as `README.md`
2. Commit and push to their `dev/[name]` branch
3. Update the `CLAIMS` array in `docs/index.html` in the hub repo
4. Push hub repo — dashboard auto-updates

### Daily progress check
- Open the dev's repo on GitHub
- Check their `dev/[name]` branch — look at commit history and latest code

### Day 7 review
- Open `poc-challenge.code-workspace` in VS Code
- All 9 repos visible in sidebar
- Run in each dev repo: `nvm use && npm install && ng build --configuration production`
- Score against SCORING-SHEET.md

---

## Files Claude Code Should Know Are Pre-Generated

All of the following files already exist and have been written. Claude Code's job is to place them correctly, not rewrite them — unless Rohit explicitly asks for a change.

- `CLAUDE.md` (this file)
- `README.md` (hub)
- `CLAIMED.md`
- `DECISIONS.md`
- `KICKOFF-MESSAGE.md`
- `PAGE-INVENTORY.md`
- `SCAFFOLD.md`
- `SCORING-SHEET.md`
- `poc-challenge.code-workspace`
- `docs/index.html`
- `.github/workflows/deploy.yml`
- `pages/README-login.md`
- `pages/README-password-change.md`
- `pages/README-payment-details.md`
- `pages/README-location-search.md`
- `pages/README-benefit-amount.md`
- `pages/README-events-browser.md`
- `pages/README-policy-maintenance.md`
- `pages/README-recurring-payment-wizard.md`
- `scripts/claim-page.sh`
- `scripts/setup-repos.sh`
- `ANGULAR-LEARNING.md` (for each dev repo)
- `.nvmrc` (for each dev repo — content: `20`)
- `.gitignore` (for each dev repo)
- `README.md` (placeholder — for each dev repo)

---

## How to Update the Dashboard When a Dev Claims a Page

Open `docs/index.html`. Find the `CLAIMS` array near the top of the `<script>` block:

```javascript
const CLAIMS = [
  // Add entries here as devs claim pages:
  // { devName: 'Venkat', pageIndex: 0 },   // 0 = Login Page
  // { devName: 'Pooja', pageIndex: 2 },    // 2 = Payment Details
];
```

Page index reference:
```
0 = Login Page
1 = Password Change
2 = Payment Details
3 = Location Search
4 = Benefit Amount
5 = Events Browser
6 = Policy Maintenance
7 = Recurring Payment Wizard
```

Save and push. GitHub Actions deploys the update automatically.

---

## Important Notes for Claude Code

- The local hub folder is named `1poc-angular-challenge-hub` — the `1` is intentional (for sort order). The GitHub repo name is `poc-angular-challenge-hub` (no `1`). The git remote is already set correctly.
- Do not rename the local folder.
- All git operations should use Git Bash commands (Windows machine).
- When Rohit says "push" — commit and push to `origin main` unless he specifies a branch.
- When Rohit says "update the dashboard" — edit `docs/index.html`, commit, push. GitHub Actions handles the rest.
- Do not change any locked decisions listed above without Rohit explicitly asking.
