# DI Registry

## Core Singletons (auto-registered via @injectable)

| Class | Annotation | Module |
|-------|-----------|--------|
| `AppRouter` | `@lazySingleton` | `CoreModule` |
| `TranslationBloc` | `@injectable` | — |
| `ColorBloc` | `@injectable` | — |
| `ThemeBloc` | `@injectable` | — |
| `RemoteConfigBloc` | `@injectable` | — |
| `NotificationsBloc` | `@injectable` | — |
| `AppInitializationService` | `@lazySingleton` | — |

Add new registrations here as features are implemented.
