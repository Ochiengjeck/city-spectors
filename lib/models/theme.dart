import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color(0xFFFFC107),
    colorScheme: ColorScheme.fromSwatch(
      cardColor: const Color.fromARGB(255, 46, 45, 45),
    ).copyWith(
      secondary: Colors.orange,
      primary: const Color(0xFFFF0000),
      tertiary: const Color(0xFFFFC107),
    ),
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xFFFFC107),
    colorScheme: ColorScheme.fromSwatch(
            cardColor: const Color.fromARGB(255, 202, 201, 201))
        .copyWith(
      secondary: Colors.yellow,
      primary: const Color(0xFFFF0000),
      tertiary: const Color(0xFFFFC107),
    ),
  );
}
