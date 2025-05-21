import 'package:flutter/material.dart';

//--- Colour Palette ---
const Color steelBlue = Color(0xFF4682B4); //Primary
const Color ivoryTint = Color(0xFFFAF9F6); //Background
const Color mistyGrey = Color(0xFFA3ABAF); //Border/outlines
const Color softOnyx = Color(0xFF464A4C); //Normal text/icons/labels
const Color mutedAmber = Color(0xFFD8A94F); //Secondary
const Color softCoral = Color(0xFFE58C85); //Error

//--- Light Colour Scheme ---
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
  colorScheme: myLightTheme,
  scaffoldBackgroundColor: myLightTheme.surface,

  //-- Language Button Bar --
  appBarTheme: AppBarTheme(
    backgroundColor: myLightTheme.surface,
    foregroundColor: myLightTheme.onSurface,
  ),

  //-- Report History Individual Cards --
  cardTheme: CardTheme(
    color: myLightTheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3),
    ),
  ),

  //-- Text Themes --
  textTheme: TextTheme(
    //- Screen Headings -
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: myLightTheme.onSurface,
    ),
    //- Sub-Headings -
    titleMedium: TextStyle(
      fontSize: 18,
      color: myLightTheme.onSurface,
    ),
    //- Normal Text -
    bodyLarge: TextStyle(
      color: myLightTheme.onSurface,
    ),
    //- Text Links -
    bodyMedium: TextStyle(
      color: myLightTheme.secondary,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    //- Button Texts -
    labelLarge: TextStyle(
      fontSize: 16,
      color: myLightTheme.onPrimary,
    ),
  ),

  //-- Form Fields: Reporting, Login, Register --
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: myLightTheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myLightTheme.primary),
    ),
    labelStyle: TextStyle(color: myLightTheme.surfaceContainerHighest),
    floatingLabelStyle: TextStyle(color: myLightTheme.primary),
  ),

  //-- Button Themes --
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: myLightTheme.outline,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: myLightTheme.primary,
      foregroundColor: myLightTheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    ),
  ),

  //-- Errors
  dialogTheme: DialogTheme(
    backgroundColor: myLightTheme.surface,
    titleTextStyle: TextStyle(
      color: myLightTheme.error,
      fontSize: 18,
      // fontWeight: FontWeight.bold,
    ),
  ),
);

//--- Dark Colour Scheme ---
// var myDarkTheme = ColorScheme(

// );
