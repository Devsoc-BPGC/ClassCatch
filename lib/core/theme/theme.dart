import 'package:class_catch/core/theme/app_pallate.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: Pallete.mainText),
      hintStyle: const TextStyle(color: Pallete.mainText),
    ),
  );
}
