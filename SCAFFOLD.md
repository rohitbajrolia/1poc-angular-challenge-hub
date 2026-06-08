# SCAFFOLD.md — How to Scaffold Your Angular App

> Follow these steps exactly. Do not deviate from the locked decisions.

---

## Prerequisites

1. **Node 20 LTS** installed via nvm
2. **nvm** installed (Windows: nvm-windows; Mac/Linux: nvm)
3. Git configured with your GitHub credentials

---

## Step 1 — Switch to Node 20

```bash
nvm use 20
```

Your repo contains a `.nvmrc` file with `20` — this command reads it automatically.  
Verify: `node --version` should print `v20.x.x`

---

## Step 2 — Clone Your Repo

```bash
cd C:\AngularProject
git clone https://github.com/rohitbajrolia/poc-angular-[yourname]
cd poc-angular-[yourname]
nvm use
```

---

## Step 3 — Scaffold the Angular App

Run this from **inside your repo folder**:

```bash
npx -p @angular/cli@^21.2.14 ng new poc-angular-[yourname] \
  --routing=true \
  --style=scss \
  --ssr=false \
  --standalone=false
```

> **Windows Git Bash / PowerShell note:** If the backslash line continuation doesn't work, run it as one line:
> ```bash
> npx -p @angular/cli@^21.2.14 ng new poc-angular-[yourname] --routing=true --style=scss --ssr=false --standalone=false
> ```

When prompted about analytics — press `N`.

This creates a subfolder `poc-angular-[yourname]/` inside your repo. That's expected — move the contents up one level:

```bash
# Windows (PowerShell)
Move-Item poc-angular-[yourname]\* . -Force
Move-Item poc-angular-[yourname]\.* . -Force
Remove-Item poc-angular-[yourname] -Recurse -Force

# Mac/Linux (bash)
mv poc-angular-[yourname]/{.,}* . 2>/dev/null
rmdir poc-angular-[yourname]
```

---

## Step 4 — Verify the Scaffold

```bash
npm install
ng build --configuration production
```

Both commands should complete without errors.

---

## Step 5 — Verify Your `package.json`

Open `package.json` and confirm:

```json
"@angular/core": "^21.2.14",
"@angular/cli": "^21.2.14"
```

If the version is different, update it and re-run `npm install`.

---

## Step 6 — Switch to Your Dev Branch

```bash
git checkout dev/[yourname]
```

Do all your work on this branch. Do **not** push directly to `main`.

---

## Step 7 — Start the Dev Server

```bash
ng serve
```

Open `http://localhost:4200` — you should see the default Angular welcome page.

---

## Step 8 — Read Your Page README

Your page-specific requirements are in `README.md` (Rohit will place this in your repo after you claim a page).

Read it fully before writing any code.

---

## Reminder: Locked Constraints

- `--standalone=false` — NgModules only
- Reactive Forms only (`ReactiveFormsModule`)
- No real backend calls
- UI library: your choice, but document it in `README.md`
