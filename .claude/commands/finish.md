Finish the current development branch.

## Step 1 — Verify

Run:
flutter analyze --no-pub 2>&1 | grep "error •"

If errors exist: STOP. Fix them first. Do NOT proceed with any errors.

## Step 2 — Sync docs

Run /sync-docs to update all .claude/docs/ files.

## Step 3 — Review scope

Run:
git log main..HEAD --oneline

Review all commits. Confirm they match the original feature intent.

If any commits appear out of scope: STOP. Ask the user:
"These commits appear out of scope: [list them]. How would you like to
handle them before finishing? (squash / revert / keep and explain)"

Wait for the user's response before proceeding to Step 4.

## Step 4 — Invoke finishing-a-development-branch skill

Use the `superpowers:finishing-a-development-branch` skill.

This skill guides the integration decision:
- Merge locally
- Open a PR
- Tag for review

If PR: generate title and body from the commit history using
Conventional Commits format.

## Completion Gate

The branch is complete when: analyze passes, docs are synced, scope is
confirmed, and the integration path has been executed.
