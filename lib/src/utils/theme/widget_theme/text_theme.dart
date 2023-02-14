import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_excerise/src/constants/colors.dart';


class TextThemeW{
  TextThemeW._(); //To avoid creating instance
  static TextTheme lightTextTheme=TextTheme(
      displayLarge: GoogleFonts.montserrat(
        color: darkColor,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: darkColor,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      displaySmall: GoogleFonts.poppins(
        color: darkColor,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: darkColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      titleLarge: GoogleFonts.poppins(
        color: darkColor,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: darkColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: darkColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      titleSmall: GoogleFonts.poppins(color: Colors.black54, fontSize: 20));
  static TextTheme darkTextTheme=
   TextTheme(
        displayLarge: GoogleFonts.montserrat(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
            fontSize: 28,
        ),
       displayMedium: GoogleFonts.montserrat(
         color: Colors.white70,
         fontWeight: FontWeight.w700,
         fontSize: 24,
       ),
       displaySmall: GoogleFonts.poppins(
         color: Colors.white70,
         fontWeight: FontWeight.w700,
         fontSize: 24,
       ),
       headlineMedium: GoogleFonts.poppins(
         color: Colors.white70,
         fontWeight: FontWeight.w600,
         fontSize: 16,
       ),
       titleLarge: GoogleFonts.poppins(
         color: Colors.white70,
         fontWeight: FontWeight.w600,
         fontSize: 14,
       ),
       bodyLarge: GoogleFonts.poppins(
         color: Colors.white70,
         fontWeight: FontWeight.normal,
         fontSize: 14,
       ),
       bodyMedium: GoogleFonts.poppins(
         color: Colors.white70,
         fontWeight: FontWeight.normal,
         fontSize: 14,
       ),
        titleSmall: GoogleFonts.almarai(color: Colors.white60, fontSize: 20));
}