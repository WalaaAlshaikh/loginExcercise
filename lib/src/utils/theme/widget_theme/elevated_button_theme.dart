import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class ElevatedButtonThemeW{
  ElevatedButtonThemeW._();

  static final lightElevatedButtonTheme=ElevatedButtonThemeData(style:
  ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      foregroundColor: whiteColor,
      elevation: 0,
      backgroundColor: secondaryColor,
      side: const BorderSide(color: secondaryColor),
      padding: const EdgeInsets.symmetric(vertical: buttonHeight)));
  static final darkElevatedButtonTheme=ElevatedButtonThemeData(

    style:  ElevatedButton.styleFrom(
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        foregroundColor: secondaryColor,
        elevation: 0,
        backgroundColor: whiteColor,
        side: const BorderSide(color: whiteColor),
        padding: const EdgeInsets.symmetric(vertical: buttonHeight))
  );
}