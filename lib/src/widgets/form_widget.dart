import 'package:cafe_sabor_ui_kit/src/utils/text_style.dart';
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

  Widget inputValidateCode({
    required int amountIndex,
    required Function() callBack,
  }) => _InputValidateCode(
    callBack: callBack,
    amountIndex: amountIndex,
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


//**********************************************
//**********************************************
//**********************************************
//**********************************************
//input validation widget
//**********************************************
//**********************************************
//**********************************************
//**********************************************

class _InputValidateCode extends StatefulWidget {
  final int amountIndex;
  final Function() callBack;

  const _InputValidateCode({
    Key? key,
    required this.callBack,
    required this.amountIndex,
  }) : super(key: key);

  @override
  State<_InputValidateCode> createState() => _InputValidateCodeState();
}

class _InputValidateCodeState extends State<_InputValidateCode> {
  List<FocusNode> listFocus = [];

  @override
  void initState() {
    for (int i = 0; i <= widget.amountIndex; i++) {
      listFocus.add(FocusNode());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(listFocus.length, (index) {
          return _CustomInput(
            focus: listFocus[index],
            change: (String value) {
              if (index == listFocus.length - 1 && value.isNotEmpty) {
                widget.callBack();
                FocusScope.of(context).unfocus();
                setState(() => listFocus[index].unfocus());
              }
              if (index != listFocus.length - 1 && value.isNotEmpty) {
                setState(() => listFocus[index + 1].requestFocus());
              }
            },
          );
        }),
      ),
    );
  }
}

class _CustomInput extends StatelessWidget {
  final FocusNode focus;
  final Function(String) change;

  const _CustomInput({
    Key? key,
    required this.focus,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.2,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: focus.hasFocus
            ? UiColor().lightYellow
            : UiColor().whiteCard,
      ),
      child: TextFormField(
        maxLength: 1,
        focusNode: focus,
        onChanged: change,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.phone,
        style: CafeTextStyle().title,
        cursorColor: UiColor().lightYellow,
        decoration: InputDecoration(
          counterStyle: const TextStyle(color: Colors.transparent),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: UiColor().backgroundButton),
          ),
        ),
      ),
    );
  }
}

