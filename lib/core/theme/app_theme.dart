import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6366F1);
  static const Color secondaryColor = Color(0xFF10B981);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color successColor = Color(0xFF10B981);

  // Light theme colors
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF1E293B);
  static const Color lightSecondaryContainer = Color(0xFFF1F5F9);

  // Dark theme colors
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkOnSurface = Color(0xFFF1F5F9);
  static const Color darkSecondaryContainer = Color(0xFF334155);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
        background: lightBackground,
        surface: lightSurface,
        onSurface: lightOnSurface,
        secondaryContainer: lightSecondaryContainer,
      ),
      textTheme: _textTheme(lightOnSurface),
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      inputDecorationTheme: _inputDecorationTheme(false),
      cardTheme: _cardTheme(false),
      appBarTheme: _appBarTheme(false),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(false),
      scaffoldBackgroundColor: lightBackground,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
        background: darkBackground,
        surface: darkSurface,
        onSurface: darkOnSurface,
        secondaryContainer: darkSecondaryContainer,
      ),
      textTheme: _textTheme(darkOnSurface),
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      inputDecorationTheme: _inputDecorationTheme(true),
      cardTheme: _cardTheme(true),
      appBarTheme: _appBarTheme(true),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(true),
      scaffoldBackgroundColor: darkBackground,
    );
  }

  static TextTheme _textTheme(Color color) {
    return GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color.withOpacity(0.7),
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: const BorderSide(color: primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(bool isDark) {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isDark ? darkSecondaryContainer : lightSecondaryContainer,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isDark ? darkSecondaryContainer : lightSecondaryContainer,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      filled: true,
      fillColor: isDark ? darkSurface : lightSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  static CardThemeData _cardTheme(bool isDark) {
    return CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: isDark ? darkSurface : lightSurface,
      shadowColor: Colors.black.withOpacity(0.05),
    );
  }

  static AppBarTheme _appBarTheme(bool isDark) {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: isDark ? darkBackground : lightBackground,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: isDark ? darkOnSurface : lightOnSurface,
      ),
      iconTheme: IconThemeData(
        color: isDark ? darkOnSurface : lightOnSurface,
      ),
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarTheme(bool isDark) {
    return BottomNavigationBarThemeData(
      backgroundColor: isDark ? darkSurface : lightSurface,
      selectedItemColor: primaryColor,
      unselectedItemColor: (isDark ? darkOnSurface : lightOnSurface).withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    );
  }
}