// Text theme for Material Design 3 themed screens.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme materialTextTheme() {
  const textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
    displayMedium: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
        fontSize: 22, letterSpacing: 0.25, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(
        fontSize: 16, letterSpacing: 0.15, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(
        fontSize: 14, letterSpacing: 0.1, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(
      fontSize: 16,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(fontSize: 12, letterSpacing: 0.4),
    labelLarge: TextStyle(fontSize: 14, letterSpacing: 0.1),
    labelMedium: TextStyle(fontSize: 12, letterSpacing: 0.5),
    labelSmall: TextStyle(
      fontSize: 11,
      letterSpacing: 0.5,
    ),
  );

  // Using Rubik font
  return GoogleFonts.latoTextTheme(textTheme).copyWith(
    bodyLarge: GoogleFonts.lato(textStyle: textTheme.bodyLarge),
    bodyMedium: GoogleFonts.lato(textStyle: textTheme.bodyMedium),
    bodySmall: GoogleFonts.lato(textStyle: textTheme.bodySmall),
    labelSmall: GoogleFonts.lato(textStyle: textTheme.labelSmall),
    labelMedium: GoogleFonts.lato(textStyle: textTheme.labelMedium),
    labelLarge: GoogleFonts.lato(textStyle: textTheme.labelLarge),
  );
}
