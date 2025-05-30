import 'package:flutter/material.dart';

import '../constants/storage_key.dart';
import '../services/preferences_manager.dart';

class ThemeController {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.dark); // Default to dark mode

  //
  init() {
    bool result = PreferencesManager().getBool(StorageKey.theme) ?? true;
    themeNotifier.value = result ? ThemeMode.dark : ThemeMode.light;
  }

  static toggleTheme() async {
    if (themeNotifier.value == ThemeMode.dark) {
      themeNotifier.value = ThemeMode.light;
      await PreferencesManager().setBool(StorageKey.theme, false);
    } else {
      themeNotifier.value = ThemeMode.dark;
      await PreferencesManager().setBool(StorageKey.theme, true);
    }
  }

  // Helper method to check current mode
  static bool isDark() => themeNotifier.value == ThemeMode.dark;
}
