import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor_ui_kit/src/utils/ui_color.dart';
import 'package:flutter/material.dart';

class CafeTextStyle{

  TextStyle get title {
    return _baseTextStyle.copyWith(
      fontSize: 30,
      fontFamily: FontFamilyType.SaborFont.name
    );
  }

  TextStyle get description {
    return _baseTextStyle.copyWith(
        fontSize: 14,
        fontFamily: FontFamilyType.Borna.name
    );
  }

  /// BASE
  static const _baseTextStyle = TextStyle(
    color: UiColor.textColor,
    fontWeight: FontWeight.normal,
  );
}