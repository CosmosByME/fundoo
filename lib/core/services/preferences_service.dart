import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static final futureOfSharedPreferences = SharedPreferences.getInstance();

  static void setIntroSeen() async {
    final prefs = await futureOfSharedPreferences;
    await prefs.setBool("intro_seen", true);
  }

  static Future<bool> getIntroSeen() async {
    final prefs = await futureOfSharedPreferences;
    return prefs.getBool("intro_seen") ?? false;
  }

  static void setDarkMode(bool isDarkMode) async {
    final prefs = await futureOfSharedPreferences;
    await prefs.setBool("dark_mode", isDarkMode);
  }

  static Future<bool?> getDarkMode() async {
    final prefs = await futureOfSharedPreferences;
    return prefs.getBool("dark_mode");
  }

  static void setLocale(String locale) async {
    final prefs = await futureOfSharedPreferences;
    await prefs.setString("locale", locale);
  }

  static Future<String?> getLocale() async {
    final prefs = await futureOfSharedPreferences;
    return prefs.getString("locale");
  }

  static void setIsRegistered(bool isRegistered) async {
    final prefs = await futureOfSharedPreferences;
    await prefs.setBool("is_registered", isRegistered);
  }

  static Future<bool> getIsRegistered() async {
    final prefs = await futureOfSharedPreferences;
    return prefs.getBool("is_registered") ?? false;
  }
}
