import 'package:cafe_sabor_ui_kit/src/utils/ui_color.dart';
import 'package:flutter/material.dart';

class UiForm {
  Widget input({
    required String label,
    Function(String)? onChange,
    TextInputType? keyboardType,
    String? Function(String? text)? validator,
  }) =>
      _Input(
        label: label,
        onChange: onChange,
        validator: validator,
        keyboardType: keyboardType,
      );
}

class _Input extends StatelessWidget {
  final String label;
  final Function(String)? onChange;
  final TextInputType? keyboardType;
  final String? Function(String? text)? validator;

  const _Input({
    Key? key,
    this.onChange,
    this.validator,
    this.keyboardType,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: UiColor().textColor,
      style: TextStyle(
        fontSize: 14,
        color: UiColor().textColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 14,
          color: UiColor().textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
