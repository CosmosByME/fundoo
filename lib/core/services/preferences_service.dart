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
}