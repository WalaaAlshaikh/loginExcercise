import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class OutlinedButtonThemeW {
  OutlinedButtonThemeW._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          foregroundColor: secondaryColor,
          side: BorderSide(color: secondaryColor),
          padding: EdgeInsets.symmetric(vertical: buttonHeight)));
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          foregroundColor: whiteColor,
          side: BorderSide(color: whiteColor),
          padding: EdgeInsets.symmetric(vertical: buttonHeight)));
}
