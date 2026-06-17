# Comment & Log Cleanup — Design Spec

**Date:** 2026-06-17

## Goal

Remove all comments and debug logs from every hand-written Dart file in the project, leaving only linter directives (`// ignore:`) intact.

## Scope

- **Files:** All `.dart` files under `lib/` — 98 files total
- **Excluded (auto-generated):** `*.g.dart`, `*.freezed.dart`, `lib/core/routes/app_router.gr.dart`
- **Excluded (out of scope):** `widgetbook/`, `test/` — no comments found there

## What Gets Removed

| Type | Example |
|------|---------|
| Single-line comments | `// Parse sync date time from the JSON file` |
| Doc comments | `/// Formats as a localized currency amount` |
| Template placeholder comments | `// Add your API endpoints here.` |
| Inline step comments | `// Trigger sync after loading initial language` |
| Opacity variant group labels | `// shadowBlack opacity variants` |

## What Is Preserved

| Type | Reason |
|------|--------|
| `// ignore: <rule>` | Changes analyzer behavior — must not be removed |
| `// ignore_for_file: <rule>` | Same — file-level analyzer directive |
| All executable code | Only comment-only lines are touched |

## Approach

Automated pass per file:

1. Read each file line by line
2. Drop any line where the trimmed content starts with `//` or `///`, **unless** it matches `// ignore:` or `// ignore_for_file:`
3. Collapse consecutive blank lines left by removed comment blocks (max one blank line between code blocks)
4. Write the cleaned content back in place

## Success Criteria

- `grep -rn "^\s*//" lib/ --include="*.dart" | grep -v "ignore:"` → zero results
- `flutter analyze` → 0 errors (identical to pre-cleanup baseline)
- No executable code lines modified
