import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final isDarkMode = false;
  final colorSchemeSeed = const Color(0XFFDED9E5);
  ThemeData getTheme() => ThemeData(
        scaffoldBackgroundColor:
            isDarkMode ? const Color(0XFF4A4453) : colorSchemeSeed,
        colorSchemeSeed: colorSchemeSeed,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        textTheme: isDarkMode
            ? GoogleFonts.aBeeZeeTextTheme(
                ThemeData.dark().textTheme,
              )
            : GoogleFonts.aBeeZeeTextTheme(
                ThemeData.light().textTheme,
              ),
        useMaterial3: true,
      );
  ThemeData copyWith({
    bool? isDarkMode,
    Color? colorSchemeSeed,
  }) =>
      ThemeData(
        colorSchemeSeed: colorSchemeSeed ?? this.colorSchemeSeed,
        brightness:
            isDarkMode ?? this.isDarkMode ? Brightness.dark : Brightness.light,
      );
}
