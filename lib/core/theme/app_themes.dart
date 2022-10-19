import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark,
  custom,
}

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.orange,
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
  )
};
