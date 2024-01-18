import 'package:cafe_sabor_ui_kit/src/models/button_model.dart';
import 'package:cafe_sabor_ui_kit/src/utils/ui_color.dart';
import 'package:flutter/material.dart';

class UiButton {
  Widget formButton(ButtonModel buttonModel) =>
      buttonModel.type == ButtonType.dark
          ? _DarkButton(buttonModel)
          : _LightButton(buttonModel);

  Widget goBackButton({required Function() onTap}) => _GoBackButton(onTap);
}

class _GoBackButton extends StatelessWidget {
  final Function() onTap;

  const _GoBackButton(this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: UiColor().backgroundButton,
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 1.5),
              child: Icon(Icons.arrow_back_ios_new_sharp, color: UiColor().whiteCard, size: 17),
            ),
          )
        ],
      ),
    );
  }
}

class _DarkButton extends StatelessWidget {
  final ButtonModel buttonModel;

  const _DarkButton(this.buttonModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor().backgroundButton,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: () => buttonModel.onTap(),
        child: Container(
          height: 42,
          alignment: Alignment.center,
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
        border: Border.all(color: UiColor().backgroundButton),
      ),
      child: InkWell(
        onTap: () => buttonModel.onTap(),
        child: Container(
          height: 42,
          alignment: Alignment.center,
          child: Text(
            buttonModel.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: UiColor().backgroundButton,
            ),
          ),
        ),
      ),
    );
  }
}
