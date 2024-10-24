import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color(0xFFFFC107),
    colorScheme: ColorScheme.fromSwatch(
      cardColor: const Color.fromARGB(255, 46, 45, 45),
    ).copyWith(
      secondary: Colors.orange,
      primary: const Color(0xFFFF0000), // SOS button
      tertiary: const Color(0xFFFFC107), // Yellow buttons

      // quaternary: const Color(0xFF6C757D), // Gray buttons
      // quinary: const Color(0xFF28A745), // Green buttons
      // senary: const Color(0xFFDC3545), // Red buttons
      // septenary: const Color(0xFF007BFF), // Blue buttons
      // octonary: const Color(0xFFE83E8C), // Pink buttons
      // nonary: const Color(0xFF6F42C1), // Purple buttons
    ),
    // Add other customizations here
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xFFFFC107),
    colorScheme: ColorScheme.fromSwatch(
            cardColor: const Color.fromARGB(255, 202, 201, 201))
        .copyWith(
      secondary: Colors.yellow,
      primary: const Color(0xFFFF0000), // SOS button
      tertiary: const Color(0xFFFFC107), // Yellow buttons
      // quaternary: const Color(0xFF6C757D), // Gray buttons
      // quinary: const Color(0xFF28A745), // Green buttons
      // senary: const Color(0xFFDC3545), // Red buttons
      // septenary: const Color(0xFF007BFF), // Blue buttons
      // octonary: const Color(0xFFE83E8C), // Pink buttons
      // nonary: const Color(0xFF6F42C1), // Purple buttons
    ),
    // Add other customizations here
  );
}
