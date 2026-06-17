import 'package:collection/collection.dart';

enum Environment { dev, qa, prod }

T? enumFromString<T extends Enum>(String key, List<T> values) {
  return values.firstWhereOrNull(
    (value) =>
        value.toString().split('.').last.toLowerCase() == key.toLowerCase(),
  );
}
