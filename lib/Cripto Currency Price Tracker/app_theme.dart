import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  static bool isDarkModeEnabled = false;

  static Future<void> getThemeValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    isDarkModeEnabled = pref.getBool('isDarkMode') ?? false;
  }
}
