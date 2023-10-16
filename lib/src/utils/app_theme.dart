import 'package:cafe_sabor_ui_kit/src/utils/ui_color.dart';
import 'package:flutter/material.dart';

class AppThere {
  ThemeData getThemeData() => ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: UiColor().textColor),
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: UiColor().textColor),
            borderRadius: BorderRadius.circular(7.0),
          ),
          border: OutlineInputBorder(
            borderSide:  BorderSide(color: UiColor().textColor),
            borderRadius: BorderRadius.circular(7.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide:  BorderSide(color: UiColor().textColor),
          ),
        ),
        appBarTheme:  AppBarTheme(color: UiColor().background),
        scaffoldBackgroundColor: UiColor().background,
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
        ),
      );
}
