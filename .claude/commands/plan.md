Plan: $ARGUMENTS

If $ARGUMENTS is empty or not provided, ask the user:
"What task would you like to plan? Please describe it briefly."
Wait for their response before proceeding.

## Step 1 — Read context

Based on the task description, read the relevant docs:
- Always: @.claude/docs/architecture.md and @.claude/docs/conventions.md
- If UI involved: @.claude/docs/design-system.md
- If navigation involved: @.claude/docs/navigation.md
- If DI involved: @.claude/docs/di-registry.md
- If networking involved: @.claude/docs/networking.md
- If new helpers, extensions, or constants involved: @.claude/docs/shared-utilities.md

## Step 2 — Invoke writing-plans skill

Use the `superpowers:writing-plans` skill with $ARGUMENTS as the task
description.

## Step 3 — Commit the plan

After the plan file is written to docs/superpowers/plans/YYYY-MM-DD-<topic>-plan.md:

Run:
git add docs/superpowers/plans/
git commit -m "docs: add implementation plan for [topic]"

## Completion Gate

Do NOT begin implementation until the user approves the plan.
