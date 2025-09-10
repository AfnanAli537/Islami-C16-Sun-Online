import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';

class ThemeManager{
  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.gold
      ),
      backgroundColor: ColorsManager.black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorsManager.gold,
      ),
      centerTitle:  true,
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.afacad(
        fontSize: 20,
        color: Colors.black
      )
    )
  );
  static final ThemeData dark = ThemeData();
}