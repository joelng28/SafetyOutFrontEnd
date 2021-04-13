import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_mode_handler/theme_mode_manager_interface.dart';

class ThemeModeManager implements IThemeModeManager {
  static const _key = 'theme_mode';

  @override
  Future<String> loadThemeMode() async {
    final _prefs = await SharedPreferences.getInstance();

    return _prefs.getString(_key) != null
        ? _prefs.getString(_key)
        : ThemeMode.system;
  }

  @override
  Future<bool> saveThemeMode(String value) async {
    final _prefs = await SharedPreferences.getInstance();

    return _prefs.setString(_key, value);
  }
}
