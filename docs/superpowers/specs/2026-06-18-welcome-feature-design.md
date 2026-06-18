# Welcome Feature Design

**Date:** 2026-06-18  
**Status:** Approved

---

## Goal

Replace `PlaceholderPage` with a `WelcomePage` feature that syncs colors and translations from local assets to the SQLite DB on cold start, shows a spinner during sync, then reveals a "Welcome" label and controls for switching theme and language.

---

## Architecture

### File Layout

```
lib/features/welcome/
  presentation/
    bloc/
      welcome_bloc.dart
      welcome_event.dart
      welcome_state.dart
    pages/
      welcome_page.dart
  BEHAVIOUR_CONTRACT.md
```

Existing files modified:
- `lib/core/routes/app_router.dart` — replace `PlaceholderPageRoute` with `WelcomePageRoute`
- `lib/features/placeholder/placeholder_page.dart` — deleted

---

## BLoC

### Events (`welcome_event.dart`) — `@freezed sealed class WelcomeEvent`

| Event | When |
|---|---|
| `InitializeWelcomeEvt` | Fired automatically in `WelcomeBloc` constructor |
| `TranslationCompletedEvt` | Internal — fired by `TranslationBloc` stream listener |
| `ChangeLanguageEvt({required String key})` | Language chip tapped on page |

### States (`welcome_state.dart`) — `@freezed sealed class WelcomeState`

| State | What is shown |
|---|---|
| `WelcomeLoading` | Centered `CircularProgressIndicator` |
| `WelcomeReady` | Welcome label + theme toggle + language chips |

### Sync Flow (`welcome_bloc.dart`) — `@lazySingleton`

1. Constructor fires `InitializeWelcomeEvt` immediately.
2. `_onInitialize` → `emit(WelcomeLoading())`, dispatch `SyncColorsEvt` to global `ColorBloc`.
3. Stream subscription on `ColorBloc`: when `ColorLoaded` → dispatch `InitializeTranslationsEvent` to global `TranslationBloc`.
4. Stream subscription on `TranslationBloc`: when `TranslationLanguageChanged` → fire internal `TranslationCompletedEvt`.
5. `_onTranslationCompleted` → `emit(WelcomeReady())`.
6. `_onChangeLanguage` → dispatch `ChangeLanguageEvent(languageCode: event.key)` to `TranslationBloc`. The global `TranslationBloc` drives locale update reactively.
7. `close()` cancels both stream subscriptions.

Both `ColorBloc` and `TranslationBloc` are global singletons injected into `WelcomeBloc` via constructor.

---

## Page UI

`WelcomePage` (`@RoutePage()`) wraps a `BlocProvider` that creates `sl<WelcomeBloc>()`.

Inner `_WelcomeView` (`StatelessWidget`) uses `BlocBuilder<WelcomeBloc, WelcomeState>`:

### Loading state
```
Scaffold(
  body: Center(child: CircularProgressIndicator())
)
```

### Ready state
```
Scaffold(
  body: Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context).translate('welcome_page_lbl_welcome'),
          style: context.textStyle(
            size: FontSize.s14,
            color: context.getColor(AppColor.sampleColor),
            weight: FontWeight.w700,
          ),
        ),
        SizedBox(height: AppSpace.s48),
        // Theme toggle
        Row(children: [
          Text('Theme', style: context.textStyle(size: FontSize.s14, color: context.getColor(AppColor.sampleColor))),
          SizedBox(width: AppSpace.s12),
          ToggleButtons(
            isSelected: [themeMode == ThemeMode.light, themeMode == ThemeMode.dark],
            onPressed: (i) => context.read<ThemeBloc>().add(SetThemeModeEvt(
              themeMode: i == 0 ? ThemeMode.light : ThemeMode.dark,
            )),
            children: [Icon(Icons.light_mode), Icon(Icons.dark_mode)],
          ),
        ]),
        SizedBox(height: AppSpace.s24),
        // Language chips
        Row(children: [
          for (final (code, label) in [('en','EN'), ('si','SI'), ('ta','TA')])
            Padding(
              padding: EdgeInsets.only(right: AppSpace.s8),
              child: ChoiceChip(
                label: Text(label),
                selected: currentLangCode == code,
                onSelected: (_) => context.read<WelcomeBloc>().add(ChangeLanguageEvt(key: code)),
              ),
            ),
        ]),
      ],
    ),
  ),
)
```

Theme toggle reads `context.watch<ThemeBloc>().state.themeMode`.  
Language chips read current language from `context.watch<TranslationBloc>().state` (cast to `TranslationLanguageChanged`), defaulting to `'en'`.

---

## Translation

Key: `welcome_page_lbl_welcome`  
Already defined in `assets/locales/language.json`:
- `en`: "Welcome"
- `si`: "සාදරයෙන් පිළිගනිමු!"
- `ta`: "நடப்புக்"

Accessed via `AppLocalizations.of(context).translate('welcome_page_lbl_welcome')`.

---

## Color & Typography

- Label color: `context.getColor(AppColor.sampleColor)` → `#1b8237` (same light/dark)
- Font size: `FontSize.s14` via `context.textStyle(...)` — never hardcoded
- Spacing: `AppSpace` constants only

---

## Route

`lib/core/routes/app_router.dart`:
```dart
AutoRoute(page: WelcomePageRoute.page, path: '/'),
```

`PlaceholderPage` and its route are deleted.

---

## Code Generation

After all files are written, run:
```
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

This regenerates:
- `welcome_event.freezed.dart`
- `welcome_state.freezed.dart`
- `app_router.gr.dart` (with `WelcomePageRoute`)
- `injection.config.dart` (with `WelcomeBloc` registered)

---

## Behaviour Contract

`lib/features/welcome/BEHAVIOUR_CONTRACT.md` to be created as part of implementation.

---

## Out of Scope

- Session checking / auth navigation — this is a template, no auth feature exists
- Lottie animation — no animation asset bundled; spinner only
- Deep link handling — no `DeepLinkService` in template
- FCM token push — no user profile in template
- Network error retry dialog — sync is local-asset-only, no network call
