import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> saveString(String key, String value,
      {bool secure = false}) async {
    if (secure) {
      await _secureStorage.write(key: key, value: value);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    }
  }

  static Future<String?> getString(String key, {bool secure = false}) async {
    if (secure) {
      return await _secureStorage.read(key: key);
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    }
  }

  static Future<void> saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<void> remove(String key, {bool secure = false}) async {
    if (secure) {
      await _secureStorage.delete(key: key);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    }
  }

  static Future<void> clear({bool secure = false}) async {
    if (secure) {
      await _secureStorage.deleteAll();
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    }
  }

  static Future<void> saveStringList(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  static Future<List<String>> getStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }
}

extension StorageKeys on StorageManager {
  static const String isLoggedIn = 'isLoggedIn';
  static const String fcmToken = 'fcmToken';
  static const String username = 'username';
  static const String language = 'language';
  static const String themeMode = 'themeMode';
  static const String translationSyncDateTime = 'translationSyncDateTime';
  static const String colorSyncDateTime = 'colorSyncDateTime';
  static const String fontScale = 'fontScale';

  static const String hasLaunched = 'hasLaunched';
}
