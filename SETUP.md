# Setup Guide

Steps to take after using this template to start a new project.

## 1. Rename the package

Find-and-replace `com.yourcompany.app` across the entire repo:

```bash
# Android
sed -i '' 's/com\.yourcompany\.app/com.yourcompany.yournewapp/g' android/app/build.gradle

# iOS
sed -i '' 's/com\.yourcompany\.app/com.yourcompany.yournewapp/g' ios/Runner.xcodeproj/project.pbxproj
```

## 2. Rename the Dart package

In `pubspec.yaml`, change:
```yaml
name: flutter_app_template
```
to your app's snake_case name (e.g. `my_finance_app`).

Then update all Dart import paths:
```bash
find lib test -name "*.dart" -exec sed -i '' 's/package:flutter_app_template\//package:my_finance_app\//g' {} +
```

## 3. Add Firebase configs

Replace the placeholder files with your real Firebase project configs:

- `android/app/src/dev/google-services.json` — DEV Firebase project
- `android/app/src/prod/google-services.json` — PROD Firebase project
- `ios/Runner/configs/dev/GoogleService-Info.plist` — DEV scheme
- `ios/Runner/configs/prod/GoogleService-Info.plist` — PROD scheme

> Do NOT commit real Firebase config files. Add them to `.gitignore` after replacing.

## 4. Update app name

In `pubspec.yaml`:
```yaml
description: Your app description.
```

In `android/app/src/main/AndroidManifest.xml` (and flavor-specific ones), update `android:label`.

In `ios/Runner/Info.plist`, update `CFBundleName` and `CFBundleDisplayName`.

## 5. Install dependencies and regenerate code

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

## 6. Verify the app boots

```bash
flutter run --flavor dev -t lib/main.dart
```

Expected: app launches to the placeholder screen.

## 7. Start building

- Add your first feature with `/new-feature`
- Add your first screen with `/new-screen`
- Build components from Figma with the scout → component-builder → screen-assembler workflow
