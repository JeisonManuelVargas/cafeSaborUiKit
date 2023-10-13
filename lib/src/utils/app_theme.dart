import 'package:cafe_sabor_ui_kit/src/utils/ui_color.dart';
import 'package:flutter/material.dart';

class AppThere {
  ThemeData getThemeData() => ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: UiColor.textColor),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: UiColor.textColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: UiColor.textColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: UiColor.textColor),
          ),
        ),
        appBarTheme: const AppBarTheme(color: UiColor.primary),
        scaffoldBackgroundColor: UiColor.primary,
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
        ),
      );
}
