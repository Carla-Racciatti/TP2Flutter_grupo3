import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const _themeKey = 'isDarkMode';

  static Future<bool> getThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;  // false por defecto (modo claro)
  }

  static Future<void> setThemePreference(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDarkMode);
  }
}
