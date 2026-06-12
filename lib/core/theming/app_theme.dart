import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Color Palette Definitions
  static const Color primaryTeal = Color(0xFF006D77);
  static const Color accentCoral = Color(0xFFFF6F61);
  static const Color neutralWhite = Color(0xFFFFFFFF);

  // Light Mode Colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF8F9FA);
  static const Color lightTextPrimary = Color(0xFF2D3748);
  static const Color lightTextSecondary = Color(0xFF718096);
  static const Color lightBorder = Color(0xFFE2E8F0);

  // Dark Mode Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E2729); // Slightly teal-tinted dark grey
  static const Color darkTextPrimary = Color(0xFFF7FAFC);
  static const Color darkTextSecondary = Color(0xFFA0AEC0);
  static const Color darkBorder = Color(0xFF2D3748);

  // Light ThemeData
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness:  .light,
      primaryColor: primaryTeal,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: const  .light(
        primary: primaryTeal,
        secondary: accentCoral,
        surface: lightSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: .new(
        color: lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:  .circular(12),
          side: const BorderSide(color: lightBorder),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: lightBorder,
        thickness: 1,
      ),
      switchTheme: SwitchThemeData(
        thumbColor:  .resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primaryTeal;
          return null;
        }),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: lightTextPrimary, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: lightTextPrimary),
        bodyMedium: TextStyle(color: lightTextSecondary),
      ),
    );
  }

  // Dark ThemeData
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness:  .dark,
      primaryColor: primaryTeal,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const  .dark(
        primary: primaryTeal,
        secondary: accentCoral,
        surface: darkSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: .new(
        color: darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:  .circular(12),
          side: const BorderSide(color: darkBorder),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: darkBorder,
        thickness: 1,
      ),
      switchTheme: SwitchThemeData(
        thumbColor:  .resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primaryTeal;
          return null;
        }),
        trackColor:  .resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primaryTeal.withOpacity(0.5);
          return null;
        }),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: darkTextPrimary, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: darkTextPrimary),
        bodyMedium: TextStyle(color: darkTextSecondary),
      ),
    );
  }
}
