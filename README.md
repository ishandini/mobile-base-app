
# Flutter BaseApp · BLoC + Clean Architecture + DI

A starter template to learn and demonstrate BLoC, Clean Architecture, and Dependency Injection (DI) in Flutter.
The project is intentionally lightweight but production-leaning with code generation, a layered structure, and opinionated tooling.


## What’s inside

- Clean Architecture: domain / data / presentation split
- State management: flutter_bloc (+ equatable)
- DI: get_it (optionally injectable)
- Networking: dio (optionally retrofit)
- Codegen: json_serializable (+ build_runner)
- Routing: auto_route
- Linting: flutter_lints


## Project structure

```bash
lib/             
├─ core/
│  ├─ constants/              # APIConst, keys, etc.
│  ├─ error/                  # Failure, exceptions
│  ├─ network/                # Dio client, interceptors
│  ├─ router/                 # auto_route config
│  └─ di/                     # GetIt container (injection.dart)
├─ features/
│  └─ beneficiary/            # Example feature module
│     ├─ domain/
│     │  ├─ entities/         # Entity (UI-agnostic models)
│     │  ├─ repositories/     # Abstract repos
│     │  └─ usecases/         # Business logic
│     ├─ data/
│     │  ├─ models/           # Model (DTOs) + JSON
│     │  ├─ datasources/      # Remote/Local sources
│     │  └─ repositories/     # Repo implementations
│     └─ presentation/
│        ├─ bloc/             # Bloc/Cubit + state
│        └─ pages/            # Screens/Widgets
└─ main.dart                  
```
    
## Getting started

Clone & fetch packages

```bash
flutter pub get
```

Environment Configuration

This project includes a .env.example file. Treat it as the single source of truth for all required environment keys.
Developers should create environment-specific files by copying from this template.

Generate code (models/routes/etc.)

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the app

```bash
flutter run --flavor dev --dart-define=flavor=dev -t lib/main.dart
```

Clean & rebuild (when things get weird)

```bash
flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs
```
