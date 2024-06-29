import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade100,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
  ),
  iconTheme: const IconThemeData(color: Colors.black54),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w200,
      color: Colors.red,
      fontSize: 22,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black87,
      fontSize: 15,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.grey.shade300,
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.black,
    ),
    actionsIconTheme: const IconThemeData(
      size: 20,
      color: Colors.black,
    ),
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
  iconTheme: const IconThemeData(color: Colors.white70),
  textTheme: const TextTheme(
    bodyLarge:
        TextStyle(fontWeight: FontWeight.w200, color: Colors.red, fontSize: 22),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.grey.shade800,
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
    ),
    actionsIconTheme: const IconThemeData(
      size: 20,
      color: Colors.white,
    ),
  ),
);
