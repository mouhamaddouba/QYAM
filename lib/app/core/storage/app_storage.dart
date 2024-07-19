import 'package:get_storage/get_storage.dart';

abstract class AppStorage {
  static final _getStorage = GetStorage();

  //region Keys

  static const String isLoggedIn = 'isLoggedIn';
  static const String isStudent = 'isStudent';
  static const String loginData = 'loginData';
  static const String isDarkMode = 'isDarkMode';
  static const String theme = 'theme';
  static const String isRTL = 'isRTL';
  static const String locale = 'locale';

  //endregion

  //region Functions

  static T read<T>(String key, T defaultValue) =>
      _getStorage.read<T>(key) ?? defaultValue;

  static Future<void> write(String key, dynamic value) =>
      _getStorage.write(key, value);

  static Future<void> remove(String key) => _getStorage.remove(key);

  static Future<void> removeAll() => _getStorage.erase();

  //endregion
}
