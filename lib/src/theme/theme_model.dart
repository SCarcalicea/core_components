import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// This provider represents the core component for the theme of the entire application.
class ThemeModel extends ChangeNotifier {
  ThemeData _currentTheme = lightTheme();

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme =
        (_currentTheme == lightTheme()) ? darkTheme() : lightTheme();
    notifyListeners();
  }

  // Base colors
  static MaterialColor seedColor = Colors.purple;

  static ThemeData lightTheme() {
    return ThemeData(
        colorScheme: commonColorScheme(false),
        navigationBarTheme: navigationBarThemeData(),
        primaryColor: Color(0xff2457C5),
        useMaterial3: true,
        textTheme: commonTextTheme());
  }

  static ThemeData darkTheme() {
    return ThemeData(
        colorScheme: commonColorScheme(true),
        navigationBarTheme: navigationBarThemeData(),
        primaryColor: Colors.deepPurple,
        useMaterial3: true,
        textTheme: commonTextTheme());
  }

  static ColorScheme commonColorScheme(bool isDarkTheme) {
    return ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light);
  }

  static TextTheme commonTextTheme() {
    return TextTheme(
        // Large/Medium screen size
        displayLarge: GoogleFonts.sourceCodePro(
            fontSize: 20, fontWeight: FontWeight.bold),
        titleLarge: GoogleFonts.sourceCodePro(),
        bodyLarge: GoogleFonts.sourceCodePro(),
        // Small screen size
        displaySmall: GoogleFonts.sourceCodePro(),
        titleSmall: GoogleFonts.sourceCodePro(),
        bodySmall: GoogleFonts.sourceCodePro(),
        // Labels for widgets
        labelSmall: GoogleFonts.sourceCodePro(),
        labelLarge: GoogleFonts.sourceCodePro());
  }

  static NavigationBarThemeData navigationBarThemeData() {
    return NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        // Define different text styles based on different states
        if (states.contains(MaterialState.selected)) {
          // Return selected text style
          return GoogleFonts.sourceCodePro(
              fontSize: 10, fontWeight: FontWeight.bold);
        } else {
          // Return unselected text style
          return GoogleFonts.sourceCodePro(fontSize: 10);
        }
      }),
    );
  }
}
