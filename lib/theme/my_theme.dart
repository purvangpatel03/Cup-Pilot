import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: ThemeColor.white,
  appBarTheme: AppBarTheme(
    backgroundColor: ThemeColor.white,
    surfaceTintColor: Colors.transparent,
  ),
  fontFamily: "Jakarta",
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ThemeColor.primary,
    shape: const CircleBorder(),
    foregroundColor: ThemeColor.white,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: ThemeColor.white,
        backgroundColor: ThemeColor.primary,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const CircleBorder(),
      padding: EdgeInsets.zero,
      foregroundColor: ThemeColor.textLight,
    )
  ),
  useMaterial3: true,
);