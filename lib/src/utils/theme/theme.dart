import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_excerise/src/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:login_excerise/src/utils/theme/widget_theme/oulined_button_theme.dart';
import 'package:login_excerise/src/utils/theme/widget_theme/text_form_field_theme.dart';
import 'package:login_excerise/src/utils/theme/widget_theme/text_theme.dart';

class ThemeApp {
  ThemeApp._();
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(0xffffe200, <int, Color>{
      50: Color(0x1affe200),
      100: Color(0x33ffe200),
      200: Color(0x4dffe200),
      300: Color(0x66ffe200),
      400: Color(0x80ffe200),
      500: Color(0xffffe200),
      600: Color(0xb3ffe200),
      700: Color(0xccffe200),
      800: Color(0xe6dac311),
      900: Color(0xffcbb825),
    }),
    textTheme:TextThemeW.lightTextTheme ,
    outlinedButtonTheme: OutlinedButtonThemeW.lightOutlinedButtonTheme,
    elevatedButtonTheme: ElevatedButtonThemeW.lightElevatedButtonTheme,
    inputDecorationTheme:TextFormFieldThemeW.lightInputDecorationTheme,

  );
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextThemeW.darkTextTheme,
    outlinedButtonTheme: OutlinedButtonThemeW.darkOutlinedButtonTheme,
      elevatedButtonTheme: ElevatedButtonThemeW.darkElevatedButtonTheme,
    inputDecorationTheme:TextFormFieldThemeW.darkInputDecorationTheme,
  );
}
