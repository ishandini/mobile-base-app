import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_template/core/utils/storage_manager.dart';

class FreshInstallGuard {
  FreshInstallGuard._();

  static Future<void> run() async {
    final hasLaunched = await StorageManager.getString(StorageKeys.hasLaunched);
    if (hasLaunched != null) return;

    await FirebaseAuth.instance.signOut();
    await StorageManager.clear(secure: true);
    await StorageManager.saveString(StorageKeys.hasLaunched, 'true');
  }
}
