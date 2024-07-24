import 'package:elocalize_library_task/core/theming/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData whiteTheme = ThemeData(
    fontFamily: 'Inter',
    primaryColor: ColorsManager.mainColor,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.lightergray,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.lightergray,

    )
  );
}
