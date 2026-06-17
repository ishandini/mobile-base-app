import 'dart:async';

import 'package:injectable/injectable.dart';

typedef PushDestination = Map<String, String>;

@lazySingleton
class PushNotificationNavigationHandler {
  PushDestination? _pending;
  final _controller = StreamController<PushDestination>.broadcast();

  Stream<PushDestination> get stream => _controller.stream;

  void handle(Map<String, dynamic> data) {
    final destination = _resolve(data);
    if (destination == null) return;

    if (_controller.hasListener) {
      _controller.add(destination);
    } else {
      _pending = destination;
    }
  }

  void consumePending(void Function(PushDestination) callback) {
    final p = _pending;
    if (p != null) {
      _pending = null;
      callback(p);
    }
  }

  PushDestination? _resolve(Map<String, dynamic> data) {
    return null;
  }
}
