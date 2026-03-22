import 'package:flutter/material.dart';

class AppTheme {
  static const Color _seed = Color(0xFF6E5CF8);

  static ThemeData get lightTheme {
    final scheme = ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: Brightness.dark,
      primary: const Color(0xFF8B7CFF),
      secondary: const Color(0xFFFF7AB6),
      tertiary: const Color(0xFF57D7FF),
      surface: const Color(0xFF1B1736),
      error: const Color(0xFFFF6B8A),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFF0F0C24),
      textTheme:
          const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
            headlineMedium: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
            titleLarge: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
            titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ).apply(
            bodyColor: const Color(0xFFF5F1FF),
            displayColor: const Color(0xFFF5F1FF),
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF7E6BFF),
          minimumSize: const Size(160, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          elevation: 0,
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        backgroundColor: Colors.white.withValues(alpha: 0.08),
        selectedColor: const Color(0xFF8B7CFF).withValues(alpha: 0.35),
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
      cardTheme: CardThemeData(
        color: Colors.white.withValues(alpha: 0.08),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Color(0xFF9F92FF), width: 1.5),
        ),
      ),
    );
  }
}
