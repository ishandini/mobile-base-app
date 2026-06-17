Refactor: $ARGUMENTS

## Step 1 — Read the code

Read all files relevant to the refactor. Do not change anything yet.
Understand what each file does before proposing changes.

## Step 2 — Invoke requesting-code-review skill

Use the `superpowers:requesting-code-review` skill to identify
refactor targets.

Focus on:
- Unused logs and debug prints
- Redundant comments that describe what the code does (not why)
- Duplicated logic that can be extracted
- Dead code and unused variables
- Overly complex expressions that can be simplified

## Step 3 — List proposed changes

Present a numbered list of every proposed change with:
- File path and line reference
- What will change
- Why (the problem it solves)

Ask: "Do these changes look right? Reply YES to proceed or tell me
what to adjust."

Wait for the user to approve before making any changes.

## Step 4 — Apply changes

Apply only the approved changes from Step 3.
Do not introduce new logic or behaviour — refactor only.

## Step 5 — Verify

Run: flutter analyze --no-pub 2>&1 | grep "error •"

Must show zero errors. Fix any errors introduced by the refactor
before proceeding.

## Step 6 — Summary

Output:

---
✅ Refactor complete

📁 Files changed:
- [list each file]

🔧 Changes made:
- [numbered list matching Step 3]

📊 Analyze: 0 errors
---
