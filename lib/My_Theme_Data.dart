import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color Cblack = Color(0xFF242424);
  static Color Cwhite = Color(0xFFF8F8F8);
  static Color Cprime = Color(0xFFB7935F);

  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.elMessiri(color: Cblack, fontSize: 20),
      bodyMedium: GoogleFonts.elMessiri(color: Cblack, fontSize: 25),
      bodyLarge: GoogleFonts.elMessiri(
        color: Cblack,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Cblack,
      unselectedItemColor: Cwhite,
    ),
  );
}
