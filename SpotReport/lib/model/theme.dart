import 'package:flutter/material.dart';

//--- Colour Palette ---
//-- Light --
const Color steelBlue = Color(0xFF4682B4); // Primary
const Color ivoryTint = Color(0xFFFAF9F6); // Background
const Color mistyGrey = Color(0xFFA3ABAF); // Border/outlines
const Color softOnyx = Color(0xFF464A4C); // Normal text/icons/labels
const Color mutedAmber = Color(0xFFD8A94F); // Secondary
const Color softCoral = Color(0xFFD17972); // Error

//-- Dark --
// Primary same
const Color deepCharcoal = Color(0xFF1C1C1C); // Background
const Color fogGrey = Color(0xFFAAB4B8); // Border/outlines
const Color paleGrey = Color(0xFFEAEAEA); // Normal text/icons/labels
// Secondary same
// Error same

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
  surfaceContainerHighest: Color(0xFFEAE9E5), // Dark variation of ivoryTint
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
    color: myLightTheme.surfaceContainerHighest,
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
    labelStyle: TextStyle(color: myLightTheme.outline),
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
      fontSize: 20,
      // fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      color: myLightTheme.error,
      fontSize: 16,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: myLightTheme.error,
    contentTextStyle: TextStyle(
      color: myLightTheme.onError,
      fontSize: 18,
    ),
  ),
);

//--- Dark Colour Scheme ---
final myDarkTheme = ColorScheme(
  brightness: Brightness.light,
  primary: steelBlue,
  onPrimary: Colors.white,
  secondary: mutedAmber,
  onSecondary: Colors.white,
  error: softCoral,
  onError: Colors.white,
  surface: deepCharcoal,
  onSurface: paleGrey,
  surfaceContainerHighest: Color(0xFF2A2A2A), // Light variation of deepCharcoal
  outline: mistyGrey,
  inversePrimary: paleGrey,
  inverseSurface: steelBlue,
);

final ThemeData myDarkThemeScheme = ThemeData(
  colorScheme: myDarkTheme,
  scaffoldBackgroundColor: myDarkTheme.surface,

  //-- Language Button Bar --
  appBarTheme: AppBarTheme(
    backgroundColor: myDarkTheme.surface,
    foregroundColor: myDarkTheme.onSurface,
  ),

  //-- Report History Individual Cards --
  cardTheme: CardTheme(
    color: myDarkTheme.surfaceContainerHighest,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3),
    ),
  ),

  //-- Text Themes --
  textTheme: TextTheme(
    //- Screen Headings -
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: myDarkTheme.onSurface,
    ),
    //- Sub-Headings -
    titleMedium: TextStyle(
      fontSize: 18,
      color: myDarkTheme.onSurface,
    ),
    //- Normal Text -
    bodyLarge: TextStyle(
      color: myDarkTheme.onSurface,
    ),
    //- Text Links -
    bodyMedium: TextStyle(
      color: myDarkTheme.secondary,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    //- Button Texts -
    labelLarge: TextStyle(
      fontSize: 16,
      color: myDarkTheme.onPrimary,
    ),
  ),

  //-- Form Fields: Reporting, Login, Register --
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: myDarkTheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myDarkTheme.primary),
    ),
    labelStyle: TextStyle(color: myDarkTheme.outline),
    floatingLabelStyle: TextStyle(color: myDarkTheme.primary),
  ),

  //-- Button Themes --
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: myDarkTheme.outline,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: myDarkTheme.primary,
      foregroundColor: myDarkTheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    ),
  ),

  //-- Errors
  dialogTheme: DialogTheme(
    backgroundColor: myDarkTheme.surface,
    titleTextStyle: TextStyle(
      color: myDarkTheme.error,
      fontSize: 20,
      // fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      color: myDarkTheme.error,
      fontSize: 16,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: myDarkTheme.error,
    contentTextStyle: TextStyle(
      color: myDarkTheme.onError,
      fontSize: 18,
    ),
  ),
);
