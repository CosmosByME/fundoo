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

  static Future<void> setAccessToken(String accessToken) async {
    final prefs = await futureOfSharedPreferences;
    await prefs.setString("accessToken", accessToken);
  }

  static Future<String> getAccessToken() async {
    final prefs = await futureOfSharedPreferences;
    return prefs.getString("accessToken") ?? "";
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    final prefs = await futureOfSharedPreferences;
    await prefs.setString("refreshToken", refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await futureOfSharedPreferences;
    return prefs.getString("refreshToken");
  }

  static Future<void> clearTokens() async {
    final prefs = await futureOfSharedPreferences;
    await prefs.remove("accessToken");
    await prefs.remove("refreshToken");
    await prefs.remove("fcpToken");
  }
  
  static Future<void> setFcpToken(String fcpToken) async {
    final prefs = await futureOfSharedPreferences;
    await prefs.setString("fcpToken", fcpToken);
  }
  
  static Future<String?> getFcpToken() async {
    final prefs = await futureOfSharedPreferences;
    return prefs.getString("fcpToken");
  }
}
