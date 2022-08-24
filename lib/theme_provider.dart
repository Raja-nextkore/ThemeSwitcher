import 'package:flutter/material.dart';
import 'package:theme_switcher/local_storage.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  ThemeProvider(String theme) {
    if (theme == 'light') {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }

  void toggleTheme() async {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      await LocalStorage.setTheme('dark');
    } else {
      themeMode = ThemeMode.light;
      await LocalStorage.setTheme('light');
    }
    notifyListeners();
  }
}
