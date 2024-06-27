import 'package:class_catch/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Pallete.mainText),
      hintStyle: TextStyle(color: Pallete.mainText),
    ),
  );
}
