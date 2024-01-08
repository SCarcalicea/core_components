import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light(useMaterial3: true);

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme =
    (_currentTheme == ThemeData.light(useMaterial3: true)) ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true);
    notifyListeners();
  }
}
