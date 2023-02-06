
import 'package:flutter/material.dart';
import 'package:github_repos_multithread/constants/palette.dart';
import 'package:github_repos_multithread/constants/styles.dart';

ThemeData buildTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Palette.background,
    primarySwatch: _createMaterialColor(Palette.white),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: fontFamily,
        textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Palette.mainGreen,
    ),
  );
}

MaterialColor _createMaterialColor(Color color) {
  final strengths = <double>[0.05];
  final swatch = <int, Color>{};

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (final strength in strengths) {
    final ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      color.red + ((ds < 0 ? color.red : (255 - color.red)) * ds).round(),
      color.green + ((ds < 0 ? color.green : (255 - color.green)) * ds).round(),
      color.blue + ((ds < 0 ? color.blue : (255 - color.blue)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}