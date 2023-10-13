import 'package:flutter/material.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';

extension CafeTextStyleExtension on TextStyle {
  TextStyle get borna => copyWith(fontFamily: FontFamilyType.Borna.name);
  TextStyle get saborFont => copyWith(fontFamily: FontFamilyType.SaborFont.name);
}
