import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(const TextStyle()),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromARGB(179, 33, 149, 243)),
            borderRadius: BorderRadius.circular(12.0))),
        elevation: MaterialStateProperty.all(6.0),
        shadowColor: MaterialStateProperty.all(Colors.blue),
        overlayColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.2)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.blue[400]),
        textStyle: MaterialStateProperty.all(
          const TextStyle(),
        ),
      ),
    ),
  );
}
