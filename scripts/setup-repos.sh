#!/usr/bin/env bash
# setup-repos.sh
# Clones all 8 developer repos and pushes initial files to main + dev/[name] branch.
#
# Prerequisites:
#   - Git configured with GitHub credentials (or SSH key set up)
#   - nvm installed
#   - Run from inside the 1poc-angular-challenge-hub folder OR from the parent AngularProject folder
#
# Usage:
#   ./scripts/setup-repos.sh
#
# What this script does per dev repo:
#   1. Clones the repo into the parent AngularProject folder
#   2. Creates .nvmrc (node 20)
#   3. Copies .gitignore from the hub
#   4. Creates a placeholder README.md
#   5. Creates ANGULAR-LEARNING.md
#   6. Commits and pushes to main
#   7. Creates dev/[name] branch and pushes it

set -e

HUB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PARENT_DIR="$(dirname "$HUB_DIR")"
GITHUB_USER="rohitbajrolia"

DEVS=(venkat alekhya pooja nagendra naveen deepak arunish vamshi)

echo ""
echo "========================================"
echo " Angular POC Sprint — Repo Setup Script"
echo "========================================"
echo " Hub dir    : $HUB_DIR"
echo " Parent dir : $PARENT_DIR"
echo " GitHub     : $GITHUB_USER"
echo " Repos      : ${#DEVS[@]}"
echo "========================================"
echo ""

for DEV in "${DEVS[@]}"; do
  REPO="poc-angular-${DEV}"
  REPO_DIR="${PARENT_DIR}/${REPO}"

  echo "────────────────────────────────────────"
  echo " Setting up: $REPO"
  echo "────────────────────────────────────────"

  # Clone if not already present
  if [[ -d "$REPO_DIR/.git" ]]; then
    echo "  Already cloned — skipping clone step."
  else
    echo "  Cloning..."
    git clone "https://github.com/${GITHUB_USER}/${REPO}.git" "$REPO_DIR"
  fi

  cd "$REPO_DIR"
  git checkout main 2>/dev/null || git checkout -b main

  # .nvmrc
  echo "20" > .nvmrc
  echo "  Created .nvmrc"

  # .gitignore — copy from hub
  cp "${HUB_DIR}/.gitignore" .gitignore
  echo "  Copied .gitignore"

  # README.md placeholder
  DEV_DISPLAY="$(echo "${DEV^}" | sed 's/./\U&/')"
  cat > README.md << EOF
# poc-angular-${DEV}

**Developer:** ${DEV_DISPLAY}
**Sprint:** Angular 21 POC Challenge — Capgemini

---

## Page Claimed

_No page claimed yet. Reply in the Teams kickoff thread to claim._

---

## Setup

\`\`\`bash
nvm use
npm install
ng serve
\`\`\`

---

## Tech Stack

- Angular \`^21.2.14\`
- Node \`20 LTS\`
- NgModules (not standalone)
- Reactive Forms
- UI Library: _(to be documented after page claim)_
EOF
  echo "  Created README.md"

  # ANGULAR-LEARNING.md
  cat > ANGULAR-LEARNING.md << 'EOF'
# ANGULAR-LEARNING.md — Angular 21 Quick Reference

> Aligned to the sprint scoring rubric. Read this before you write any code.

---

## 1. Module Structure (40 pts — Code Quality)

Always create a **feature module** for your page. Never put everything in `AppModule`.

```typescript
// features/my-feature/my-feature.module.ts
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { MyFeatureRoutingModule } from './my-feature-routing.module';
import { MyPageComponent } from './my-page/my-page.component';
import { MyDataService } from './my-data.service';

@NgModule({
  declarations: [MyPageComponent],
  imports: [CommonModule, ReactiveFormsModule, MyFeatureRoutingModule],
  providers: [MyDataService]
})
export class MyFeatureModule {}
```

Register the feature module lazily in `AppRoutingModule`:

```typescript
{ path: 'my-feature', loadChildren: () => import('./features/my-feature/my-feature.module').then(m => m.MyFeatureModule) }
```

---

## 2. Services (40 pts — Code Quality)

All data and business logic lives in a service — not in the component.

```typescript
// features/my-feature/my-data.service.ts
import { Injectable } from '@angular/core';

@Injectable()
export class MyDataService {
  private data = [ /* hardcoded mock */ ];

  getAll() { return this.data; }
  getById(id: number) { return this.data.find(d => d.id === id); }
}
```

Inject it into the component — never instantiate with `new`.

---

## 3. Reactive Forms (25 pts — Functionality)

**Always use Reactive Forms. Never use template-driven forms (ngModel).**

```typescript
// In your component
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

export class MyPageComponent {
  form: FormGroup;

  constructor(private fb: FormBuilder) {
    this.form = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(3)]],
      email: ['', [Validators.required, Validators.email]],
    });
  }

  onSubmit() {
    if (this.form.valid) {
      console.log(this.form.value);
    }
  }
}
```

```html
<!-- In your template -->
<form [formGroup]="form" (ngSubmit)="onSubmit()">
  <input formControlName="name" />
  <div *ngIf="form.get('name')?.invalid && form.get('name')?.touched">
    Name is required (min 3 chars)
  </div>
  <button type="submit" [disabled]="form.invalid">Submit</button>
</form>
```

### Custom Validator

```typescript
// shared/validators/password-match.validator.ts
import { AbstractControl, ValidationErrors, ValidatorFn } from '@angular/forms';

export function passwordMatch(): ValidatorFn {
  return (group: AbstractControl): ValidationErrors | null => {
    const pw = group.get('password')?.value;
    const confirm = group.get('confirmPassword')?.value;
    return pw === confirm ? null : { passwordMismatch: true };
  };
}
```

---

## 4. Component Design (40 pts — Code Quality)

### Smart vs Dumb components

- **Smart (container)** — injects service, holds state, handles routing
- **Dumb (presentational)** — receives `@Input()`, emits `@Output()`, no service injection

```typescript
// Dumb component example
@Component({ selector: 'app-user-card', ... })
export class UserCardComponent {
  @Input() user!: User;
  @Output() edit = new EventEmitter<User>();
}
```

### No logic in templates

Bad ❌
```html
<div>{{ user.firstName + ' ' + user.lastName }}</div>
<div *ngIf="items.filter(i => i.active).length > 0">...</div>
```

Good ✅ — compute in component class:
```typescript
get fullName() { return `${this.user.firstName} ${this.user.lastName}`; }
get hasActiveItems() { return this.items.some(i => i.active); }
```

---

## 5. Routing (25 pts — Functionality)

```typescript
// features/my-feature/my-feature-routing.module.ts
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MyPageComponent } from './my-page/my-page.component';
import { MyDetailComponent } from './my-detail/my-detail.component';

const routes: Routes = [
  { path: '', component: MyPageComponent },
  { path: ':id', component: MyDetailComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MyFeatureRoutingModule {}
```

Navigate programmatically:
```typescript
constructor(private router: Router) {}
goToDetail(id: number) { this.router.navigate(['/my-feature', id]); }
```

---

## 6. Naming Conventions (40 pts — Code Quality)

| Thing | Convention | Example |
|-------|-----------|---------|
| Component class | PascalCase + `Component` | `LoginComponent` |
| Component file | kebab-case `.component.ts` | `login.component.ts` |
| Service class | PascalCase + `Service` | `AuthService` |
| Module class | PascalCase + `Module` | `AuthModule` |
| Variable/property | camelCase | `isLoading`, `formGroup` |
| Template ref var | camelCase with # | `#myInput` |

---

## 7. Visual / Responsive Tips (35 pts — Visual Accuracy)

- Use your UI library's grid system for layout, not raw CSS floats
- Form labels above inputs (not placeholder text as labels)
- Error messages in red, below the field, only when `touched && invalid`
- Buttons: primary action on the right, cancel/back on the left
- Test at 1280px and 768px widths

---

## Checklist Before PR

```
[ ] Feature module created and lazy-loaded
[ ] Service holds all data/logic — nothing in component templates
[ ] Reactive Forms used throughout — no ngModel
[ ] All required fields have validators
[ ] Validation errors show on touch, not on page load
[ ] Submit button disabled when form invalid
[ ] No complex expressions in HTML templates
[ ] Components named per Angular style guide
[ ] ng build --configuration production completes without errors
[ ] README.md updated with UI library, packages, how to run
```
EOF
  echo "  Created ANGULAR-LEARNING.md"

  # Commit and push to main
  git add .nvmrc .gitignore README.md ANGULAR-LEARNING.md
  git commit -m "chore: initial setup — .nvmrc, .gitignore, README, ANGULAR-LEARNING" 2>/dev/null || echo "  Nothing new to commit on main."
  git push origin main
  echo "  Pushed to main"

  # Create dev/[name] branch
  git checkout -b "dev/${DEV}" 2>/dev/null || git checkout "dev/${DEV}"
  git push origin "dev/${DEV}" --set-upstream 2>/dev/null || git push origin "dev/${DEV}"
  echo "  Created and pushed branch dev/${DEV}"

  # Back to main
  git checkout main

  echo "  ✅ $REPO done"
  echo ""
done

echo "========================================"
echo " All repos set up."
echo ""
echo " Next steps:"
echo "   1. Set branch protection on main for each repo"
echo "      (GitHub → Settings → Branches → Add rule → main → Require PR)"
echo "   2. Open poc-challenge.code-workspace in VS Code"
echo "   3. Send the kickoff message (see KICKOFF-MESSAGE.md)"
echo "========================================"
echo ""
