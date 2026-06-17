You are helping me commit already staged changes in this Flutter project.
Follow these steps exactly and wait for my confirmation at each step.

---

## STEP 0 — VERIFY BEFORE COMMIT (HARD GATE)

Before reviewing the diff or writing a commit message, verify the
codebase compiles cleanly.

Run:
flutter analyze --no-pub 2>&1 | grep "error •"

If any error lines appear:
- STOP immediately
- List the errors
- Fix them
- Re-run the check
- Only proceed when output is empty (zero errors)

Do NOT proceed to STEP 1 with any open errors.

---

## STEP 1 — REVIEW STAGED CHANGES

Run:
git diff --cached --stat
git diff --cached

Summarise what was changed:
- Which files were modified, added, or deleted
- What the changes actually do (not just file names)
- Which features or layers were affected (data/domain/presentation/shared)

Do not proceed until you have fully understood the changes.

---

## STEP 2 — RUN /sync-docs

Before committing, audit the staged changes and update any affected 
files inside .claude/docs/ that need to reflect these changes.

Check:
- di-registry.md — if any injectable annotations changed
- navigation.md — if any routes changed
- design-system.md — if any colors, styles, or components changed
- localization.md — if any translation keys changed
- networking.md — if any endpoints changed
- shared-utilities.md — if any helpers or utilities changed
- conventions.md — if any patterns changed
- tech-debt.md — if any workarounds or TODOs were introduced
- BEHAVIOUR_CONTRACT.md — if any feature behaviour changed

If a .claude/docs/ file was updated as part of the sync, stage it too:
git add .claude/docs/

Output for each file updated:
📄 Updated: .claude/docs/[filename].md — [what changed]

If nothing needed updating output:
📄 sync-docs: no documentation changes required

---

## STEP 3 — GENERATE COMMIT MESSAGE

Based on the staged changes, generate a commit message following 
Conventional Commits format exactly.

### Format Rules:

Type must be one of:
- feat     → new feature or functionality added
- fix      → bug fix
- refactor → code restructure with no behaviour change
- chore    → build, deps, config, tooling changes
- style    → formatting, lint fixes, no logic change
- test     → adding or updating tests
- docs     → documentation only changes
- perf     → performance improvement

Scope is the feature or layer affected (optional but preferred):
- Use the feature name: (auth), (home), (payment), (profile)
- Or the layer: (di), (navigation), (networking), (design-system)
- Or shared: (utils), (widgets), (models)

Subject rules:
- Lowercase
- No period at the end
- Maximum 72 characters
- Imperative mood (add, fix, update, remove — not added/fixed/updated)

Body rules (include when changes are non-trivial):
- Explain WHAT changed and WHY, not how
- Wrap at 72 characters
- Separate from subject with a blank line

Breaking change (if applicable):
- Add BREAKING CHANGE: in footer

### Examples:

Simple:
feat(auth): add biometric login support

With body:
fix(payment): resolve crash on card expiry validation

Card expiry field was accepting invalid month values above 12.
Added range validation before form submission.

Refactor:
refactor(di): migrate manual get_it to injectable annotations

chore(deps): add freezed and freezed_annotation packages

Multi-scope:
refactor(auth,profile): apply freezed to user and profile models

---

## STEP 4 — SHOW COMMIT PREVIEW

Display the full commit message in a code block:

\`\`\`
[generated commit message here]
\`\`\`

Then ask:
"Does this commit message look correct? 
Reply YES to commit, EDIT to change the message, or CANCEL to abort."

Wait for my response before doing anything.

---

## STEP 5 — HANDLE MY RESPONSE

### If I say YES:
Run the commit:
git commit -m "[subject]" -m "[body if any]"

Then confirm:
✅ Committed: [commit subject]

Then proceed to STEP 6.

### If I say EDIT:
Ask me: "What would you like to change?"
Apply my changes to the commit message.
Show the updated preview again and ask for confirmation.
Repeat until I say YES.

### If I say CANCEL:
Output:
🚫 Commit cancelled. Your staged changes are still intact.
Stop here. Do not push.

---

## STEP 6 — PUSH TO REMOTE

Ask:
"Push to remote? Reply YES to push or NO to skip."

### If I say YES:
Run:
git push

Output result:
✅ Pushed to [branch name] on [remote name]

Or if push fails, show the exact error and suggest:
- git pull --rebase then push again if behind remote
- git push --set-upstream origin [branch] if no upstream set

### If I say NO:
Output:
⏭ Skipped push. Run git push when ready.

---

## STEP 7 — FINAL SUMMARY

Output a clean summary:

---
✅ Commit complete

📝 Message:   [commit subject]
🌿 Branch:    [current branch]
📦 Files:     [number of files committed]
🚀 Pushed:    Yes / No

📄 Docs updated:
- [list each .claude/docs/ file updated, or "none"]
---