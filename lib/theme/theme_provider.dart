import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  ThemeProvider() {
    loadTheme();
  }
  bool get isDarkMode => _isDarkMode;
  
  void toggleTheme() {
    if (_isDarkMode == false) {
      _isDarkMode = true;
    } else {
      _isDarkMode = false;
    }
    saveTheme();
    notifyListeners();
  }

  Future<void> saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }
}
