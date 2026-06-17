# Conventions

## File & Class Naming

### Files

- All Dart files: `snake_case.dart`
- Feature files follow the pattern: `<feature>_<layer>_<type>.dart`
  - `beneficiaries_remote_datasource.dart` (abstract interface)
  - `beneficiaries_remote_datasource_impl.dart` (implementation)
  - `beneficiaries_repository.dart`
  - `beneficiaries_repository_impl.dart`
  - `beneficiaries_usecase.dart`
  - `beneficiaries_bloc.dart`
  - `beneficiaries_event.dart`
  - `beneficiaries_state.dart`
  - `beneficiaries_page.dart`

### Classes

- Pages: `PascalCase` + `Page` suffix (e.g., `BeneficiariesPage`)
- BLoCs: `PascalCase` + `Bloc` suffix (e.g., `BeneficiariesBloc`)
- Events: `PascalCase` + `Evt` or `Event` suffix (e.g., `BeneficiariesLoadEvt`, `ChangeLanguageEvent`)
- States: `PascalCase` + `State` suffix (e.g., `BeneficiariesState`, `TranslationLoading`)
- Entities: `PascalCase` + `Entity` suffix (e.g., `BeneficiaryEntity`)
- Models (DTOs): `PascalCase` + `Model` suffix (e.g., `BeneficiaryModel`)
- Repositories (abstract): `I` prefix optional — project uses `<Feature>Repository` with no prefix
- Implementations: `<ClassName>Impl` suffix (e.g., `BeneficiariesRepositoryImpl`)
- Use cases: `<Action><Feature>UseCase` (e.g., `GetColorsUseCase`, `SyncTranslationsUseCase`)
- Modules: `PascalCase` + `Module` suffix (e.g., `NetworkModule`, `AppModule`)

### Part Files

Pages that are too large may be split using `part` / `part of` directives. Rules:

- Part files live in the **same folder** as the library file they belong to (e.g. both in `pages/`).
- Part filenames must **not** start with `_`. A leading `_` signals library-private in Dart — it is
  confusing and incorrect for a `part` file that contains named public classes.
  ```dart
  // CORRECT
  part 'slider_content.dart';
  part 'animated_detail_pane.dart';

  // WRONG — underscore prefix is misleading
  part '_slider_content.dart';
  part '_animated_detail_pane.dart';
  ```
- Part files use `part of '<library_file>.dart';` at the top (not the `library` identifier form).
- Widget files under `features/.../widgets/` are **standalone** public files, not `part of` anything,
  even if they are only used by one page. Use folder placement to communicate scope, not file privacy.

### Enums

- Enums themselves: `PascalCase` (e.g., `FontSize`, `AppColor`, `Environment`, `BeneficiariesStatus`)
- All enums must follow `PascalCase` — the pre-existing `eBeneficiariesStatus` was renamed to
  `BeneficiariesStatus` (fixing the `camel_case_types` lint warning)

---

## Comments

Write **no comments** by default. The only acceptable comment is one that captures a hidden constraint, subtle invariant, or workaround that would surprise a future reader — and only when the code itself cannot convey it.

Never write:
- Comments that restate what the code does (`// Save translations to the database`)
- Doc comments (`///`) on methods or classes — method names and types are the documentation
- Template/example placeholder comments (`// Add your API endpoints here`)
- Step-by-step narration comments (`// Parse sync date time from the JSON file`)

The codebase was fully de-commented in June 2026. Any new comment added must survive the test: *"Would removing this comment confuse a future reader?"* If no, don't write it.

The one preserved exception is `// ignore: <rule>` linter directives — these change analyzer behavior and must not be removed.

---

## Import Ordering

Follow Dart / `flutter analyze` convention:

1. `dart:` imports
2. `package:flutter/` imports
3. Other `package:` imports (alphabetical)
4. Relative imports (alphabetical)

No barrel/index files. Always import specific file paths:
```dart
// CORRECT
import 'package:flutter_base_app/core/di/injection.dart';

// WRONG — no index.dart barrel files
import 'package:flutter_base_app/core/di/index.dart';
```

---

## Lint Rules

`analysis_options.yaml` uses `flutter_lints` (or `lints`) as base. Key rules in effect:

- `avoid_redundant_argument_values` — do not pass default values explicitly
- `use_super_parameters` — use `super.key` instead of `Key? key` + `: super(key: key)`
- `camel_case_types` — enum names must be PascalCase
- `prefer_const_constructors` — use `const` wherever possible

Run analysis before committing:
```bash
flutter analyze
```

Zero errors is the baseline. Pre-existing warnings (info-level) from original code are acceptable
but should not grow. Run `flutter analyze` for the current count — the `camel_case_types` warning
for `eBeneficiariesStatus` was fixed (renamed to `BeneficiariesStatus`) during the freezed migration.

---

## Page Widget Choice

| Situation | Widget to use |
|-----------|--------------|
| Page with a BLoC | `StatelessWidget` — BLoC owns all state, no hooks needed |
| Presentation-only page needing controllers | `HookWidget` (`flutter_hooks`) — `useTextEditingController()`, `useFocusNode()` etc. |
| Stateful shared component needing lifecycle | `StatefulWidget` — `FocusNode`, `TapGestureRecognizer`, animation controllers |

**Rule:** Never use `StatefulWidget` just for `TextEditingController` on a page — use `HookWidget`
instead. Controllers are auto-disposed when the widget is removed from the tree.

```dart
// Correct: presentation-only page with controllers
@RoutePage()
class AuthLoginPage extends HookWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    ...
  }
}
```

---

## BLoC Patterns

### Event / State — Standalone Freezed Libraries

Events and states are **standalone Dart library files** (not `part of` the BLoC file).
Each has its own `part 'xxx.freezed.dart'` directive and is imported by the BLoC:

```dart
// beneficiaries_event.dart  ← standalone library
import 'package:freezed_annotation/freezed_annotation.dart';
part 'beneficiaries_event.freezed.dart';

@freezed
sealed class BeneficiariesEvent with _$BeneficiariesEvent {
  const factory BeneficiariesEvent.load() = BeneficiariesLoadEvt;
}

// beneficiaries_state.dart  ← standalone library
import 'package:freezed_annotation/freezed_annotation.dart';
part 'beneficiaries_state.freezed.dart';

@freezed
class BeneficiariesState with _$BeneficiariesState {
  const factory BeneficiariesState({
    List<BeneficiaryEntity>? beneficiaries,
    @Default(BeneficiariesStatus.initial) BeneficiariesStatus status,
    String? error,
  }) = _BeneficiariesState;
}

// beneficiaries_bloc.dart  ← imports both
import 'beneficiaries_event.dart';
import 'beneficiaries_state.dart';
```

**Why standalone?** Freezed generates a `part` file (`xxx.freezed.dart`) for each annotated file.
Dart does not allow a `part` file to itself declare `part` directives — so event/state files
cannot be `part of` the BLoC and also have freezed code-gen.

**Sealed unions** (for global service BLoCs with multiple state subtypes):
```dart
@freezed
sealed class ColorState with _$ColorState {
  const factory ColorState.initial() = ColorInitial;
  const factory ColorState.loading() = ColorLoading;
  const factory ColorState.loaded({required List<ColorModel> colors}) = ColorLoaded;
  const factory ColorState.error({String? message}) = ColorError;
}
```
Subtype names (`ColorInitial`, `ColorLoaded`, etc.) are directly usable as constructors and in `is` checks.

**Single-class states** (for feature BLoCs with one state + status enum):
```dart
enum BeneficiariesStatus { initial, loading, success, error }

@freezed
class BeneficiariesState with _$BeneficiariesState {
  const factory BeneficiariesState({
    @Default(BeneficiariesStatus.initial) BeneficiariesStatus status,
    List<BeneficiaryEntity>? beneficiaries,
    String? error,
  }) = _BeneficiariesState;
}
```
`copyWith` is generated automatically. `@Default(value)` sets field defaults.

### Global vs Feature BLoCs

| Scope | Annotation | Registration in `main.dart` |
|-------|-----------|----------------------------|
| App-wide (TranslationBloc, ThemeBloc, ColorBloc, WelcomeBloc) | `@lazySingleton` | `MultiBlocProvider` |
| Feature-level (BeneficiariesBloc) | `@injectable` | `BlocProvider` inside the page |

**Never** add a feature BLoC to the global `MultiBlocProvider`. **Never** register a global BLoC
as a factory.

### Constructor Injection — No sl<> in Initializer Lists

BLoC dependencies must be constructor parameters, not resolved via `sl<>()` in the initializer list.

```dart
// CORRECT
@lazySingleton
class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc({
    required this.getColorsUseCase,
    required this.themeBloc,           // injected by injectable
  }) : super(ColorInitial());
}

// WRONG
class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc({required this.getColorsUseCase})
      : themeBloc = sl<ThemeBloc>(),   // ← forbidden
        super(ColorInitial());
}
```

### State Pattern

Use `freezed` for all states — never `Equatable`. Use a single `@freezed` class with a `status`
enum for feature BLoCs (as in `BeneficiariesState`), or a `@freezed sealed class` union for global
service BLoCs (as in `TranslationState`). `equatable` is now only used by domain error types
(`Failure`, `APIException`).

### `Either<Failure, T>` Return Types

Use cases and repositories must return `ResultFuture<T>` (= `Future<Either<Failure, T>>`). BLoCs
consume results with `.fold()`:

```dart
result.fold(
  (failure) => emit(state.copyWith(status: BeneficiariesStatus.error, error: failure.message)),
  (data)    => emit(state.copyWith(status: BeneficiariesStatus.success, beneficiaries: data)),
);
```

---

## Feature Module Creation Steps

To add a new feature `myfeature` under `features/example/`:

1. **Create folder structure:**
   ```
   lib/features/example/myfeature/
   ├── data/
   │   ├── datasources/
   │   │   ├── myfeature_remote_datasource.dart
   │   │   ├── myfeature_remote_datasource_impl.dart
   │   │   ├── myfeature_local_datasource.dart
   │   │   └── myfeature_local_datasource_impl.dart
   │   ├── models/
   │   │   ├── myfeature_model.dart
   │   │   ├── mapper/myfeature_mappers.dart
   │   │   └── response/myfeature_list_response.dart
   │   └── repositories/
   │       └── myfeature_repository_impl.dart
   ├── domain/
   │   ├── entities/myfeature_entity.dart
   │   ├── repositories/myfeature_repository.dart
   │   └── usecases/myfeature_usecase.dart
   └── presentation/
       ├── bloc/
       │   ├── myfeature_bloc.dart
       │   ├── myfeature_event.dart
       │   └── myfeature_state.dart
       └── pages/myfeature_page.dart
   ```

2. **Annotate impls:**
   - `MyfeatureRemoteDataSourceImpl`: `@Injectable(as: MyfeatureRemoteDataSource)`
   - `MyfeatureLocalDataSourceImpl`: `@Injectable(as: MyfeatureLocalDataSource)`
   - `MyfeatureRepositoryImpl`: `@Injectable(as: MyfeatureRepository)`
   - `MyfeatureUseCase`: `@lazySingleton`
   - `MyfeatureBloc`: `@injectable`

3. **Annotate model with freezed:**
   ```dart
   import 'package:freezed_annotation/freezed_annotation.dart';
   part 'myfeature_model.freezed.dart';
   part 'myfeature_model.g.dart'; // only if fromJson is needed

   @freezed
   class MyfeatureModel with _$MyfeatureModel {
     const MyfeatureModel._(); // only if custom methods (toEntity, fromMap) are needed
     const factory MyfeatureModel({
       @JsonKey(name: 'fieldName') String? fieldName, // override field_rename: snake if needed
     }) = _MyfeatureModel;
     factory MyfeatureModel.fromJson(Map<String, dynamic> json) =>
         _$MyfeatureModelFromJson(json); // only if API JSON deserialization is needed
   }
   ```

4. **Create event + state as standalone freezed files** (do NOT use `part of` the bloc):
   ```dart
   // myfeature_event.dart
   @freezed
   sealed class MyfeatureEvent with _$MyfeatureEvent {
     const factory MyfeatureEvent.load() = MyfeatureLoadEvt;
   }

   // myfeature_state.dart
   enum MyfeatureStatus { initial, loading, success, error }

   @freezed
   class MyfeatureState with _$MyfeatureState {
     const factory MyfeatureState({
       @Default(MyfeatureStatus.initial) MyfeatureStatus status,
       String? error,
     }) = _MyfeatureState;
   }
   ```

6. **Annotate page:**
   ```dart
   @RoutePage()
   class MyfeaturePage extends StatelessWidget { ... }
   ```

7. **Register route** in `lib/core/routes/app_router.dart`.

8. **Add API endpoint** to `ApiClient` if remote data is needed.

9. **Run `build_runner`:**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

10. **No `injection_container.dart`** — injectable discovers annotated classes automatically.

---

## Code Generation

All generators share one command:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

| Generator | Triggers on | Output |
|-----------|------------|--------|
| `injectable_generator` | `@injectable`, `@lazySingleton`, `@singleton`, `@module` | `lib/core/di/injection.config.dart` |
| `retrofit_generator` | `@RestApi()` | `lib/core/network/api_client.g.dart` |
| `freezed` | `@freezed` on models, events, states | `<file>.freezed.dart` (+ `<file>.g.dart` for JSON) |
| `json_serializable` | `@JsonSerializable()` (kept for `BaseResponse<T>` only) | `base_response.g.dart` |
| `auto_route_generator` | `@AutoRouterConfig`, `@RoutePage()` | `lib/core/routes/app_router.gr.dart` |

Global `build.yaml` at project root sets `field_rename: snake` and `explicit_to_json: true` for
`json_serializable`.

---

## No Barrel Files

Never create `index.dart` or barrel export files. Always import the specific file path. This is
enforced by convention, not lint, but violations create implicit coupling and make refactoring harder.

---

## Design System Value Rules

### No Computed Spacing

Never compute spacing by adding or subtracting from a constant. Always use the nearest defined constant.

```dart
// WRONG
const SizedBox(width: AppSpace.s4 - 1)
const SizedBox(height: AppSpace.s8 + 4)

// CORRECT
const SizedBox(width: AppSpace.s4)
const SizedBox(height: AppSpace.s8)
```

If no constant matches, add the new value to `AppSpace` in `lib/core/services/theme/theme_style.dart`.

### No Hardcoded Colors

Never use `Colors.white`, `Colors.black`, or any other hardcoded color. Always use the theme token via `context.getColor(AppColor.*)`.

```dart
// WRONG
color: Colors.white
color: Colors.white.withValues(alpha: 0.9)
color: Color(0xFFFFFFFF)

// CORRECT
color: context.getColor(AppColor.surfaceWhite)
color: context.getColor(AppColor.surfaceWhite).withValues(alpha: 0.9)
```

The one exception is `Colors.transparent` — this is a zero-opacity sentinel value, not a theme color, and has no `AppColor` equivalent.

### No Computed Radius

Never compute border radius by adding or subtracting from a constant. If the required value does not exist in `AppRadius`, add it.

```dart
// WRONG
BorderRadius.circular(AppRadius.r30 - 4)
BorderRadius.circular(AppRadius.r24 + 2)

// CORRECT
BorderRadius.circular(AppRadius.r26)  // add r26 = 26.0 to AppRadius if missing
BorderRadius.circular(AppRadius.r24)
```

Add new values to `AppRadius` in `lib/core/services/theme/theme_style.dart` and document them in `.claude/docs/design-system.md`.

---

## Reuse Over Duplication

Before adding any new widget, helper function, or utility class, check whether an equivalent already exists:

| What you're adding | Where to check first |
|---|---|
| A display widget | `lib/core/widgets/` — compare by **purpose**, not just name |
| A helper function or utility method | `lib/core/utils/helper.dart`, `extension.dart`, `common.dart` |
| A utility/mapper/formatter class | `lib/core/utils/` — scan all files |

**Rule:** only create new shared code if the existing alternative cannot be reasonably parameterised to fit. If reuse is possible, extend the existing component rather than adding a parallel one.

This rule is enforced by:
- `feature-developer` agent (Step 0 reuse audit before writing any code)
- `component-builder` agent (Step 0 pre-flight before fetching Figma)
- `code-reviewer` agent (post-implementation check, reported as Reuse Opportunities)
- GitHub Actions CI (automated PR review includes reuse check)

---

## Widgetbook Stories

Every shared component in `lib/core/widgets/` must have a corresponding story file.

**File placement:** `widgetbook/lib/components/<category>/<component>_stories.dart`

Examples:
- `widgetbook/lib/components/buttons/primary_button_stories.dart`
- `widgetbook/lib/components/buttons/nav_back_button_stories.dart`
- `widgetbook/lib/components/auth_base_page_stories.dart`
- `widgetbook/lib/components/prime_logo_stories.dart`

**Story file exports a single `WidgetbookComponent` named `<camelCase>Component`:**
```dart
final primaryButtonComponent = WidgetbookComponent(
  name: 'PrimaryButton',
  useCases: [ ... ],
);
```

**Registration:** Add the component to the correct `WidgetbookFolder` in `widgetbook/lib/main.dart`.

**Use cases must cover:** default/all-props-default state, all enum variants, all boolean flag combinations (enabled/disabled, with/without optional props), and any error/loading states if they exist.

**Run widgetbook:** `flutter run -t widgetbook/lib/main.dart` (within the main project — not a separate Flutter project).
