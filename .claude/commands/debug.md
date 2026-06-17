Debug: $ARGUMENTS

HARD GATE — Root cause must be identified and stated explicitly before
any fix is applied. No "let me try X and see" approaches.

## Step 1 — Invoke systematic-debugging skill

Use the `superpowers:systematic-debugging` skill.

Follow it exactly. This skill drives the entire investigation.

## Completion Gate

After identifying root cause and applying fix:

Run: flutter analyze --no-pub 2>&1 | grep "error •"

Must show zero errors before reporting the fix complete.
Show the analyze output in your final summary.

Do NOT use phrases like "this should fix it" or "the fix is in place"
without passing the analyze check.
Before reporting the fix complete, also confirm: does the original
symptom described in $ARGUMENTS still occur? If yes, the bug is not
fixed — continue the investigation.
