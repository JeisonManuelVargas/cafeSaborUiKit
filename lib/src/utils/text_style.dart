import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor_ui_kit/src/utils/ui_color.dart';
import 'package:flutter/material.dart';

class CafeTextStyle{

  TextStyle get titleXL {
    return _baseTextStyle.copyWith(
      fontSize: 40,
      fontFamily: FontFamilyType.SaborFont.name
    );
  }

  TextStyle get title {
    return _baseTextStyle.copyWith(
        fontSize: 32,
        fontFamily: FontFamilyType.SaborFont.name
    );
  }

  TextStyle get text {
    return _baseTextStyle.copyWith(
        fontSize: 14,
        fontFamily: FontFamilyType.Borna.name
    );
  }
  TextStyle get titleBorna {
    return _baseTextStyle.copyWith(
        fontSize: 20,
        fontFamily: FontFamilyType.Borna.name
    );
  }
  TextStyle get description {
    return _baseTextStyle.copyWith(
        fontSize: 25,
        fontFamily: FontFamilyType.Borna.name
    );
  }

  /// BASE
  static const _baseTextStyle = TextStyle(
    color: UiColor.textColor,
    fontWeight: FontWeight.normal,
  );
}