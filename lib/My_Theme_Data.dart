import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color Cblack = Color(0xFF242424);
  static Color Cwhite = Color(0xFFF8F8F8);
  static Color Cbage = Color(0xFFB7935F);
  static Color Cyellow = Color(0xFFFACC1D);
  static Color Cblue = Color(0xFF141A2E);
  static Color Tcblue = Color(0xCC141A2E);
  static Color Tcwhit = Color(0xCCF8F8F8);

  static ThemeData LightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Cwhite,
        onPrimary: Cblack,
        secondary: Cbage,
        onSecondary: Cwhite,
        error: Colors.red,
        onError: Colors.white,
        surface: Cwhite,
        onSurface: Cblack
    ),
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
    dividerTheme: DividerThemeData(
      color: Cbage
    )
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Cblue,
        onPrimary: Cyellow,
        secondary: Cblue,
        onSecondary: Cwhite,
        error: Colors.red,
        onError: Colors.white,
        surface: Cblue,
        onSurface: Cyellow
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.elMessiri(color: Cblack, fontSize: 20),
      bodyMedium: GoogleFonts.elMessiri(color: Cyellow, fontSize: 25),
      bodyLarge: GoogleFonts.elMessiri(
        color: Cwhite,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Cyellow,
      unselectedItemColor: Cwhite,
    ),
      dividerTheme: DividerThemeData(
          color: Cyellow
      )
  );
}
