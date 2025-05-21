import 'package:flutter/material.dart';

const Color steelBlue = Color(0xFF4682B4);  //Primary
const Color ivoryTint = Color(0xFFFAF9F6);  //Background
const Color mistyGrey = Color(0xFFBFC8CC);  //Border/outlines
const Color softOnyx = Color(0xFF464A4C);   //Normal text/icons/labels
const Color mutedAmber = Color(0xFFD8A94F); //Secondary
const Color softCoral = Color(0xFFE58C85);  //Error

final myLightTheme = ColorScheme(
  brightness: Brightness.light,
  primary: steelBlue,
  onPrimary: Colors.white,
  secondary: mutedAmber,
  onSecondary: Colors.white,
  error: softCoral,
  onError: Colors.white,
  surface: ivoryTint,
  onSurface: softOnyx,
  surfaceContainerHighest: mistyGrey,
  outline: mistyGrey,
  inversePrimary: softOnyx,
  inverseSurface: steelBlue,
);



final ThemeData myLightThemeScheme = ThemeData(
);

// var myDarkTheme = ColorScheme(

// );
