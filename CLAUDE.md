# Prime Lands Mobile — Claude Context

---

## 🗂 Project Codebases

| Name | Description | Path |
|------|-------------|------|
| **This app** | Active development — your project built on this template. Clean Architecture, injectable, auto_route, freezed, BLoC, Firebase. | `lib/` in this repo |

---

## 📚 Project Docs

> **Do NOT load docs at init.** Read specific docs on demand using `@.claude/docs/<name>.md`.
> Commands load only what they need via `@` references in their own files.

| Doc | What it covers |
|-----|----------------|
| `architecture.md` | App structure, Flutter/Dart versions, packages, folder layout, feature module template, code-gen |
| `di-registry.md` | All injectable annotations, @module classes, every registered singleton/factory/lazySingleton |
| `design-system.md` | Color tokens, typography (FontSize, textStyle), spacing/radius/border constants, usage rules |
| `design-system-core-components.md` | BasePage, AppTitleBar, AuthBasePage, NavBackButton, PlainCard, PageBottomBar, AppLoaderOverlay, AppSnackBar, InfoCard, ProfileSettingsTile, MenuButton, StepStatusBadge |
| `design-system-input-components.md` | PrimaryButton, SecondaryButton, ChipButton, SocialLoginButton, AppTextField, PhoneNumberField, OtpInput, GenderSelection, AddToFavoriteButton, AppDropdownField, GuestLockedDialog |
| `design-system-feature-components.md` | PropertyTile, HomePageSliderView, HeaderProfileView, QuickLinksView, ReservationDetailCard, MyPropertySliderCard, SectionIntroductionCard, AppTabBar, PaginationDots, DiscoverPropertiesView |
| `localization.md` | Translation key naming conventions, AppLocalizations, TranslationBloc, all defined keys per screen |
| `navigation.md` | All routes and their params, auto_route setup, navigation patterns (push/replace/pop) |
| `networking.md` | Dio config, ApiClient endpoints, SapApiClient, PgResponse vs BaseResponse patterns, error types |
| `shared-utilities.md` | StorageManager/StorageKeys, Helper, all String/bool/context extensions, EnvConfig, DateConst, Const |
| `conventions.md` | File/class naming, import ordering, lint rules, BLoC patterns, freezed conventions, widgetbook story placement |
| `tech-debt.md` | Known issues, workarounds, missing features, stub implementations, TODO tracking |

---

## 🤖 Available Agents

Specialized subagents in `.claude/agents/`. Claude Code selects them automatically based on your request.

| Agent | Model | Use when |
|-------|-------|----------|
| `figma-component-scout` | Haiku | You provide a Figma frame and want to know what components to build |
| `component-builder` | Sonnet | Building one reusable widget from a Figma component node |
| `screen-assembler` | Sonnet | Assembling a full page from a Figma screen frame (after components are built) |
| `feature-developer` | Sonnet | Implementing a full Clean Architecture feature (datasource → BLoC → page) |
| `code-reviewer` | Sonnet | Reviewing code for convention compliance |

### Figma → Flutter workflow
1. **Scout** — provide Figma screen URL → get component build plan
2. **Build** — run `component-builder` once per new component in the plan
3. **Assemble** — run `screen-assembler` with the same Figma screen URL

---

## 🛠 Commands

Slash commands in `.claude/commands/`. Invoke with `/command-name`.

| Command | Purpose |
|---------|---------|
| `/new-feature` | Scaffold a full Clean Architecture feature — hard-gated: brainstorm → plan → execute → verify |
| `/new-screen` | Create a new screen — hard-gated: brainstorm → plan → execute → verify |
| `/debug` | Structured bug investigation — root cause first, fix second, verify last |
| `/plan` | Write an implementation plan for any task |
| `/finish` | Close out a development branch — verify, sync-docs, review scope, open PR |
| `/commit` | Structured commit — verify, sync-docs, message, push |
| `/refactor` | Structured refactor — review targets, propose changes, apply, verify |
| `/sync-docs` | Update all `.claude/docs/` files after a task |
| `/new-utility` | Create a new shared utility/helper/extension |
| `/new-adr` | Create a new Architecture Decision Record |
| `/update-widgetbook` | Add a widgetbook story for a new shared component |
| `/build-prod-app` | Build IPA, APK, and App Bundle for production |

---

## 🚦 Development Lifecycle

All feature and screen work follows this hard-gated lifecycle:

```
DISCOVER → PLAN → EXECUTE → VERIFY → INTEGRATE
```

| Stage | Skill | Gate |
|---|---|---|
| Discover | `superpowers:brainstorming` | No code until user approves design |
| Plan | `superpowers:writing-plans` | No code until user approves plan |
| Execute | `superpowers:executing-plans` | Follow plan task-by-task |
| Verify | `superpowers:verification-before-completion` | `flutter analyze` must show 0 errors |
| Integrate | `superpowers:finishing-a-development-branch` | `/finish` command |

**Bug path:** `/debug` → `superpowers:systematic-debugging` → verify

**Hard gate rule:** `/new-feature` and `/new-screen` will not create any
file until brainstorming AND writing-plans are both approved by the user.

---

## 📋 Architecture Decisions

> Read any ADR files in `.claude/decisions/` that are relevant to your task.

---

## 🔄 SELF-MAINTENANCE RULE

After every task, check if anything changed in the areas below.
If yes, update the relevant file in `.claude/docs/` immediately.
Do NOT update CLAUDE.md itself — update the specific doc file instead.

| Changed area | Update this file |
|---|---|
| DI registration, injectable annotations | `di-registry.md` |
| New BLoC, Cubit, UseCase, Repository | `architecture.md` + `di-registry.md` |
| New route or navigation change | `navigation.md` |
| New color, TextStyle, font, or spacing constant | `design-system.md` |
| Dark/light theme token added or changed | `design-system.md` |
| Font scaling behavior changed | `design-system.md` |
| New scaffold/layout/feedback component added | `design-system-core-components.md` |
| New button or input component added | `design-system-input-components.md` |
| New feature or data-aware widget added | `design-system-feature-components.md` |
| New translation key or language added | `localization.md` |
| Localization package or config changed | `localization.md` |
| New API endpoint or interceptor | `networking.md` |
| New helper, extension, or utility added | `shared-utilities.md` |
| New constant added | `shared-utilities.md` |
| New naming rule or lint change | `conventions.md` |
| New package added to pubspec.yaml | `architecture.md` |
| Workaround or known bug introduced | `tech-debt.md` |
| Major architectural decision made | `decisions/00X-title.md` (new ADR file) |
| Agent prompt or behaviour changed | `.claude/agents/<agent-name>.md` |

After every update always output:
📄 Updated: .claude/docs/[filename].md — [what changed]

---

## 🏃 Before Touching Any Feature

Read the `BEHAVIOUR_CONTRACT.md` inside that feature folder if it exists.
If it does not exist, create one after completing your work.

---

## Widgetbook Rule

Every time a new shared component is created in `lib/core/widgets/`:
1. Create a corresponding widgetbook story in `widgetbook/lib/components/`
2. Show all variants, states, and prop combinations
3. Update `widgetbook/lib/main.dart` to include the new story
