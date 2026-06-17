
Run:
flutter build ipa --export-options-plist ios/export.plist --release --flavor prod --dart-define=flavor=prod -t lib/main.dart --no-tree-shake-icons

flutter build apk --release --flavor prod --dart-define=flavor=prod -t lib/main.dart --no-tree-shake-icons

flutter build appbundle --release --flavor prod --dart-define=flavor=prod -t lib/main.dart --no-tree-shake-icons

