You are a Senior Flutter Developer creating a new screen for this project.

Screen to create: $ARGUMENTS

HARD GATE: Do NOT create any files until Phase 1 and Phase 2 are both
complete and the user has approved both outputs.

---

## Phase 1 — DISCOVER (HARD GATE)

Invoke the `superpowers:brainstorming` skill.

During brainstorming, explore these questions:
1. Which feature does this screen belong to?
   (must match an existing feature folder, or flag if it is a new feature)
2. Does this screen need its own BLoC?
   Needs BLoC: fetches data, has form validation, loading/error/success states,
   complex user interactions.
   No BLoC: static content, simple navigation hub, reuses parent BLoC.
3. What are the main UI sections and interactions?
4. Does this screen receive navigation arguments?
   (e.g. an ID, a model, a flag — needed for route registration)

Do NOT create any files.
Wait for the user to approve the design before proceeding to Phase 2.

---

## Phase 2 — PLAN (HARD GATE)

Only begin after user has approved the brainstorm design.

Read:
- @.claude/docs/architecture.md
- @.claude/docs/conventions.md
- @.claude/docs/design-system.md
- @.claude/docs/navigation.md
- @.claude/docs/localization.md
- @.claude/docs/di-registry.md

Invoke `superpowers:writing-plans`.

The plan must list every file to create with its full path:

Screen (always):
- lib/features/[feature]/presentation/screens/[screen_name]_screen.dart

If BLoC needed:
- lib/features/[feature]/presentation/bloc/[screen_name]_bloc.dart
- lib/features/[feature]/presentation/bloc/[screen_name]_event.dart
- lib/features/[feature]/presentation/bloc/[screen_name]_state.dart

Route registration:
- Update lib/[router file path] with new route

DI registration (if BLoC):
- Update lib/[di module file path] with BLoC registration

Documentation:
- Update lib/features/[feature]/BEHAVIOUR_CONTRACT.md
- Update .claude/docs/navigation.md
- Update .claude/docs/di-registry.md (if BLoC needed)

Plan saved to docs/superpowers/plans/YYYY-MM-DD-[screen]-plan.md.

Do NOT create any files.
Wait for the user to approve the plan before proceeding to Phase 3.

---

## Phase 3 — EXECUTE

Only begin after user has approved the plan in Phase 2.

Invoke `superpowers:executing-plans` to implement the plan.

### Screen structure rules

Separate BlocProvider (screen) from UI (view):
- [ScreenName]Screen → provides the BLoC
- [ScreenName]View   → consumes the BLoC, contains all UI

```dart
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExampleBloc>(),
      child: const ExampleView(),
    );
  }
}

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // UI here — use BlocBuilder<ExampleBloc, ExampleState>
    );
  }
}
```

If no BLoC: StatelessWidget only. Access parent BLoC via
`context.read<ParentBloc>()` or BlocBuilder.

### Design rules (strictly follow design-system.md)
- AppColors tokens only — never hardcode hex values
- Defined TextStyles only — never hardcode font sizes or weights
- Spacing constants only — never hardcode numbers
- Existing shared components from design-system.md where applicable
- Localization keys for all visible strings — never hardcode text

### BLoC structure (if needed)

Event file:
```dart
@freezed
class [ScreenName]Event with _$[ScreenName]Event {
  const factory [ScreenName]Event.started() = _Started;
  // add relevant events based on screen description
}
```

State file:
```dart
@freezed
class [ScreenName]State with _$[ScreenName]State {
  const factory [ScreenName]State.initial() = _Initial;
  const factory [ScreenName]State.loading() = _Loading;
  const factory [ScreenName]State.success({required SomeModel data}) = _Success;
  const factory [ScreenName]State.failure({required String message}) = _Failure;
}
```

BLoC file:
```dart
@injectable
class [ScreenName]Bloc extends Bloc<[ScreenName]Event, [ScreenName]State> {
  [ScreenName]Bloc() : super(const [ScreenName]State.initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<[ScreenName]State> emit,
  ) async {
    // TODO: implement
  }
}
```

After creating BLoC files run:
dart run build_runner build --delete-conflicting-outputs

### Route registration
Update the router file following navigation.md conventions exactly.
Include: route path, route name constant, screen class import,
argument passing if navigation params are required.

### DI registration (if BLoC)
@injectable annotation auto-registers via code generation.
Run: dart run build_runner build --delete-conflicting-outputs

### Update BEHAVIOUR_CONTRACT.md
Add a section for this screen:

```markdown
### [ScreenName]Screen

**Purpose:** [one line description]
**BLoC:** [ScreenName]Bloc or uses [ParentBloc]
**Events:** [event name] — [what triggers it]
**States:** [state name] — [what it represents]
**Navigation:**
  Entry: [how you reach this screen]
  Exit: [where this screen navigates to]
**Localization keys used:** [key names]
**Design tokens used:** Colors: [...] TextStyles: [...]
```

## Completion Gate

Before reporting Phase 3 complete:

Run: flutter analyze --no-pub 2>&1 | grep "error •"

Must show zero errors. Show the analyze output in your summary.

Then update:
- .claude/docs/navigation.md
- .claude/docs/di-registry.md (if BLoC created)

Output:
📄 Updated: [each file changed]
