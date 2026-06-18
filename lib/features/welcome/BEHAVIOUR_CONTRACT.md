# Welcome Feature — Behaviour Contract

## Purpose
Cold-start gate: syncs local asset data (colors + translations) to SQLite DB,
then presents theme and language controls.

## Responsibilities
- `WelcomeBloc` orchestrates color sync → translation init → ready state.
- `WelcomePage` is the only route at `/`.

## Entry / Exit
- Entered: automatically on every cold start (path `/`).
- No exit: this is a permanent landing page in the template.
  Replace with auth/onboarding navigation when building a real product.

## States
| State | UI |
|---|---|
| `WelcomeLoading` | Centered `CircularProgressIndicator` |
| `WelcomeReady` | Localized label + theme toggle + language chips |

## Constraints
- `WelcomeBloc` is `@lazySingleton` — instantiated once per app lifecycle.
- Label uses translation key `welcome_page_lbl_welcome`.
- Language list driven by `Const.supportLanguages` — add new languages there.
- No network calls — all sync is against local SQLite and bundled asset files.
