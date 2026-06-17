Scaffold a new feature module for: $ARGUMENTS

HARD GATE: Do NOT create any files until Phase 1 and Phase 2 are both
complete and the user has approved both outputs.

---

## Phase 1 — DISCOVER (HARD GATE)

Invoke the `superpowers:brainstorming` skill with the feature description
as context.

During brainstorming, cover:
- What the feature does and why
- Which layers are involved (datasource / repository / use case / BLoC / screen)
- Which existing services or APIs are needed
- What the screen flow looks like
- Which .claude/docs/ files are most relevant

Do NOT create any files.
Do NOT write any code.

Wait for the user to approve the design output before proceeding to Phase 2.

---

## Phase 2 — PLAN (HARD GATE)

Only begin after user has approved the brainstorm design.

Read:
- @.claude/docs/architecture.md
- @.claude/docs/conventions.md
- @.claude/docs/di-registry.md
- @.claude/docs/design-system.md
- @.claude/docs/localization.md
- @.claude/docs/navigation.md

Invoke the `superpowers:writing-plans` skill.

The plan must cover creation of:
- lib/features/$ARGUMENTS/data/datasources/
- lib/features/$ARGUMENTS/data/models/
- lib/features/$ARGUMENTS/data/repositories/
- lib/features/$ARGUMENTS/domain/entities/
- lib/features/$ARGUMENTS/domain/repositories/
- lib/features/$ARGUMENTS/domain/usecases/
- lib/features/$ARGUMENTS/presentation/bloc/
- lib/features/$ARGUMENTS/presentation/pages/
- lib/features/$ARGUMENTS/presentation/widgets/
- lib/features/$ARGUMENTS/di/
- Route registration
- DI registrations
- Localization keys
- BEHAVIOUR_CONTRACT.md

Plan saved to docs/superpowers/plans/YYYY-MM-DD-$ARGUMENTS-plan.md.

Do NOT create any files.
Do NOT write any code.

Wait for the user to approve the plan before proceeding to Phase 3.

---

## Phase 3 — EXECUTE

Only begin after user has approved the plan in Phase 2.

Invoke `superpowers:executing-plans` to implement the plan task by task.

Follow all conventions exactly as documented.

Rules:
- Use AppColors tokens — never hardcode hex values
- Use defined TextStyles — never hardcode font sizes
- Use spacing constants — never hardcode numbers
- Use localization keys for all visible strings
- Register every BLoC with @injectable
- Run: dart run build_runner build --delete-conflicting-outputs

Do not implement business logic — scaffold structure only.

## Completion Gate

Before reporting Phase 3 complete:

Run: flutter analyze --no-pub 2>&1 | grep "error •"

Must show zero errors. Show the analyze output in your summary.

After verification passes, update:
- .claude/docs/di-registry.md
- .claude/docs/navigation.md
- .claude/docs/architecture.md

Output:
📄 Updated: [each file changed]
