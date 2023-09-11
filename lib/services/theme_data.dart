import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? Color.fromARGB(66, 162, 179, 244) : Colors.white,
        primaryColor: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: isDarkTheme
                  ? Colors.grey
                  : const Color.fromARGB(255, 255, 88, 59),
              brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            ),
        cardColor: isDarkTheme ? Colors.blue[100] : Colors.teal[100],
        canvasColor: isDarkTheme
            ? const Color.fromARGB(255, 167, 227, 235)
            : const Color.fromARGB(255, 179, 223, 98));
  }
}
