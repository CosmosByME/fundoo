import 'package:flutter/material.dart';

class MyAppThemes {
  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    scaffoldBackgroundColor: Color(0xFFF8FAFC),
    bottomAppBarTheme: BottomAppBarThemeData(color: Colors.white),
    primaryColor: Color(0xFF2563EB),
  );

  ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1E293B),
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Color(0xFF0F172A),
    bottomAppBarTheme: BottomAppBarThemeData(color: Color(0xFF1E293B)),
    primaryColor: Color(0xFF2563EB),
  );
}
