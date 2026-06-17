Perform a full audit of everything changed, added, or removed in this 
session and update the relevant files inside .claude/docs/.

Check every area:

1. architecture.md — new packages, Flutter/Dart version, base classes, 
   feature module structure, code generation changes

2. di-registry.md — any new or removed @Singleton, @LazySingleton, 
   @injectable, @module, @factoryMethod, @disposeMethod, @preResolve, 
   environment bindings

3. design-system.md — new colors (light/dark tokens), TextStyles, fonts, 
   font scaling behavior, spacing constants, border radius, shared UI 
   components

4. localization.md — new translation keys, new languages, ARB/JSON changes, 
   localization config changes, pluralization additions

5. navigation.md — new routes, renamed routes, new guards, navigation 
   pattern changes, deep link changes

6. networking.md — new endpoints, interceptor changes, base URL changes, 
   new request/response models, error handling changes

7. shared-utilities.md — new helpers, extensions, utilities, constants, 
   any changes to existing ones

8. conventions.md — new naming rules, lint rule changes, new code 
   generation patterns, new folder placement rules

9. tech-debt.md — new TODOs, workarounds, known bugs, fragile areas 
   introduced

10. BEHAVIOUR_CONTRACT.md (per feature) — if any feature was modified, 
    update its contract to reflect changes in BLoC events/states, 
    navigation, API calls, DI dependencies, or localization keys used

For each file updated output:
📄 Updated: .claude/docs/[filename].md — [what changed]

If nothing changed in a file, skip it silently.
If a section does not exist yet, create it.
Do not remove existing content unless it is factually wrong or replaced.

## Final Check

After all doc files are updated, run:
flutter analyze --no-pub 2>&1 | grep "error •"

This confirms no doc-referenced code (e.g. class names, method names
in BEHAVIOUR_CONTRACT.md) has gone stale. If errors appear, the doc
update may have uncovered an existing code issue — report it but do
not treat it as a sync-docs failure.