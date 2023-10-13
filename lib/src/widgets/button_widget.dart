import 'package:cafe_sabor_ui_kit/src/models/button_model.dart';
import 'package:cafe_sabor_ui_kit/src/utils/ui_color.dart';
import 'package:flutter/material.dart';

class UiButton {
  Widget formButton(ButtonModel buttonModel) =>
      buttonModel.type == ButtonType.dark
          ? _DarkButton(buttonModel)
          : _LightButton(buttonModel);
}

class _DarkButton extends StatelessWidget {
  final ButtonModel buttonModel;

  const _DarkButton(this.buttonModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 17),
          child: Text(buttonModel.label),
        ),
      ),
    );
  }
}

class _LightButton extends StatelessWidget {
  final ButtonModel buttonModel;

  const _LightButton(this.buttonModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: UiColor.backgroundButton),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: Text(buttonModel.label, style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: UiColor.backgroundButton,
            )),
          ),
        ));
  }
}
