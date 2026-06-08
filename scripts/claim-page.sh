#!/usr/bin/env bash
# claim-page.sh
# Usage: ./scripts/claim-page.sh <devName> <pageIndex>
#
# Example:
#   ./scripts/claim-page.sh venkat 0    → claims Login Page for Venkat
#   ./scripts/claim-page.sh pooja 2     → claims Payment Details for Pooja
#
# What this script does:
#   1. Copies the correct page README from hub/pages/ into the dev's repo as README.md
#   2. Commits and pushes to the dev's dev/[name] branch
#   3. Reminds you to update CLAIMS in docs/index.html

set -e

HUB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PARENT_DIR="$(dirname "$HUB_DIR")"

# ─────────────────────────────────────────
# Page index → README file mapping
# ─────────────────────────────────────────
PAGE_0="README-login.md"
PAGE_1="README-password-change.md"
PAGE_2="README-payment-details.md"
PAGE_3="README-location-search.md"
PAGE_4="README-benefit-amount.md"
PAGE_5="README-events-browser.md"
PAGE_6="README-policy-maintenance.md"
PAGE_7="README-recurring-payment-wizard.md"

PAGE_0_NAME="Login Page"
PAGE_1_NAME="Password Change"
PAGE_2_NAME="Payment Details"
PAGE_3_NAME="Location Search"
PAGE_4_NAME="Benefit Amount"
PAGE_5_NAME="Events Browser"
PAGE_6_NAME="Policy Maintenance"
PAGE_7_NAME="Recurring Payment Wizard"

# ─────────────────────────────────────────
# Args
# ─────────────────────────────────────────
DEV_NAME="${1,,}"   # lowercase
PAGE_INDEX="$2"

if [[ -z "$DEV_NAME" || -z "$PAGE_INDEX" ]]; then
  echo "Usage: $0 <devName> <pageIndex>"
  echo "  devName   : venkat | alekhya | pooja | nagendra | naveen | deepak | arunish | vamshi"
  echo "  pageIndex : 0–7"
  exit 1
fi

# Lookup README file
PAGE_VAR="PAGE_${PAGE_INDEX}"
README_FILE="${!PAGE_VAR}"
PAGE_NAME_VAR="PAGE_${PAGE_INDEX}_NAME"
PAGE_NAME="${!PAGE_NAME_VAR}"

if [[ -z "$README_FILE" ]]; then
  echo "Error: pageIndex must be 0–7. Got: $PAGE_INDEX"
  exit 1
fi

# Paths
DEV_REPO="poc-angular-${DEV_NAME}"
DEV_DIR="${PARENT_DIR}/${DEV_REPO}"
SOURCE="${HUB_DIR}/pages/${README_FILE}"
DEST="${DEV_DIR}/README.md"

if [[ ! -d "$DEV_DIR" ]]; then
  echo "Error: Dev repo not found at $DEV_DIR"
  echo "  Clone it first: git clone https://github.com/rohitbajrolia/${DEV_REPO} ${DEV_DIR}"
  exit 1
fi

if [[ ! -f "$SOURCE" ]]; then
  echo "Error: Source README not found at $SOURCE"
  exit 1
fi

echo ""
echo "Claiming page for ${DEV_NAME}..."
echo "  Page    : ${PAGE_NAME} (index ${PAGE_INDEX})"
echo "  Source  : ${SOURCE}"
echo "  Dest    : ${DEST}"
echo ""

# Copy README into dev repo
cp "$SOURCE" "$DEST"

# Commit and push on dev/[name] branch
cd "$DEV_DIR"
git checkout "dev/${DEV_NAME}" 2>/dev/null || git checkout -b "dev/${DEV_NAME}"
git add README.md
git commit -m "feat: claim page — ${PAGE_NAME}"
git push origin "dev/${DEV_NAME}"

echo ""
echo "✅ Done! README pushed to poc-angular-${DEV_NAME} on branch dev/${DEV_NAME}"
echo ""
echo "⚠️  Next step — update the dashboard:"
echo "   Open: ${HUB_DIR}/docs/index.html"
echo "   Find the CLAIMS array and add:"
echo "   { devName: '$(echo "${DEV_NAME^}" | sed 's/./\U&/')', pageIndex: ${PAGE_INDEX} },"
echo "   Then: git add docs/index.html && git commit -m 'chore: ${DEV_NAME} claims ${PAGE_NAME}' && git push origin main"
echo ""
