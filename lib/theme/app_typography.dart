import 'package:flutter/material.dart';

///usage of custom text
// CustomText(
// "Dashboard",
// style: AppTypography.h1,
// )
//
// CustomText(
// "This is a description text",
// style: AppTypography.description,
// )
//
// CustomText(
// "Submit",
// style: AppTypography.button,
// isUppercase: true,
// )

class AppTypography {
  // HEADERS
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );

  // BODY
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
  );

  // DESCRIPTION / SUBTEXT
  static const TextStyle description = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    letterSpacing: 0.15,
  );

  // CAPTION / LABEL
  static const TextStyle caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  // BUTTON TEXT
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    color: Colors.white,
  );
}
