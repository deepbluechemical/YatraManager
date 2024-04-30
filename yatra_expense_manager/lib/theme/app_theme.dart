import 'package:flutter/material.dart';
import 'package:yatra_expense_manager/theme/palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Palette.backgroundColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      backgroundColor: Palette.backgroundColor,
    ),
  );
}
