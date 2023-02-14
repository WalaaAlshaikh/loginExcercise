import 'package:flutter/material.dart';
import 'package:login_excerise/src/constants/colors.dart';

class TextFormFieldThemeW{
  TextFormFieldThemeW._();

  static InputDecorationTheme lightInputDecorationTheme=
       InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        prefixIconColor: secondaryColor,
        suffixIconColor: secondaryColor,
        floatingLabelStyle: TextStyle(color: secondaryColor),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(width: 2,color: secondaryColor)
        ),
      );

  static InputDecorationTheme darkInputDecorationTheme=
   InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      prefixIconColor: primaryColor,
      suffixIconColor: primaryColor,
      floatingLabelStyle: TextStyle(color: primaryColor),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(width: 2,color: primaryColor)
      )
  );

}