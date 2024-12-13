import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_theme.dart';

class ZohAppTheme {
  ZohAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ZohTextTheme.lightTextTheme,
    elevatedButtonTheme: ZohElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: ZohAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: ZohBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: ZohCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: ZohChipTheme.lightChipTheme,
    outlinedButtonTheme: ZohOutlinedButtonTheme.lightOutlinedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ZohTextTheme.darkTextTheme,
    elevatedButtonTheme: ZohElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: ZohAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: ZohBottomSheetTheme.darkThemeSheetTheme,
    checkboxTheme: ZohCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: ZohChipTheme.darkChipTheme,
    outlinedButtonTheme: ZohOutlinedButtonTheme.darkOutlinedButtonTheme,
  );
}