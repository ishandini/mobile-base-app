import 'package:injectable/injectable.dart';

@lazySingleton
class AppInitializationService {
  bool _isReady = false;

  bool get isReady => _isReady;

  void markReady() => _isReady = true;
}
