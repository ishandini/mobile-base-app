# DI Registry

## Core Singletons (auto-registered via @injectable)

| Class | Annotation | Module |
|-------|-----------|--------|
| `AppRouter` | `@lazySingleton` | `CoreModule` |
| `AppLocalizations` | `@singleton` | `AppModule` |
| `TranslationBloc` | `@injectable` | — |
| `ColorBloc` | `@injectable` | — |
| `ThemeBloc` | `@injectable` | — |
| `RemoteConfigBloc` | `@injectable` | — |
| `NotificationsBloc` | `@injectable` | — |
| `AppInitializationService` | `@lazySingleton` | — |

## NetworkModule (`lib/core/di/modules/network_module.dart`)

| Provided | Annotation | Notes |
|----------|-----------|-------|
| `Dio` (main) | `@lazySingleton` | Injects `AppLocalizations` to construct `ErrorInterceptor` |
| `Dio` (SAP) | `@lazySingleton @Named('sap')` | No `ErrorInterceptor`, no `SecurityInterceptor` |
| `ApiClient` | `@lazySingleton` | Retrofit wrapper for main Dio |
| `SapApiClient` | `@lazySingleton` | Retrofit wrapper for SAP Dio |

`AppLocalizations` is passed as a parameter to `NetworkModule.dio()` — injectable resolves it automatically from the `AppModule` singleton.

Add new registrations here as features are implemented.
