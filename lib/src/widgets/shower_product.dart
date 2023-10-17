// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor_ui_kit/src/widgets/custom_animate_container.dart';

class CompositeWidgets {
  Widget showerProduct({
    required Color backgroundColor,
    required double heightBackground,
    required List<Widget> backgroundBody,
    required List<ShowerProductModel> images,
  }) =>
      _ShowerProductWidget(
        images: images,
        backgroundBody: backgroundBody,
        backgroundColor: backgroundColor,
        heightBackground: heightBackground,
      );
}

class _ShowerProductWidget extends StatefulWidget {
  final Color backgroundColor;
  final double heightBackground;
  final List<Widget> backgroundBody;
  final List<ShowerProductModel> images;

  const _ShowerProductWidget({
    Key? key,
    required this.images,
    required this.backgroundBody,
    required this.backgroundColor,
    required this.heightBackground,
  }) : super(key: key);

  @override
  State<_ShowerProductWidget> createState() => _ShowerProductWidgetState();
}

class _ShowerProductWidgetState extends State<_ShowerProductWidget> {
  List<Widget> children = [];

  @override
  void initState() {
    super.initState();

    widget.images
        .sort((a, b) => a.indexPositionType.compareTo(b.indexPositionType));

    children.add(
      Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: widget.heightBackground,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(33),
            bottomRight: Radius.circular(33),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.backgroundBody,
        ),
      ),
    );

    for (var element in widget.images) {
      Widget child;

      if (element.positionType == PositionType.MAIN) {
        child = CustomAnimateContainer(
          fromAnimationModel: FromAnimationModel(
            fromAnimation: FromAnimation.fromDown,
            child: _MainContainer(element: element),
            duration: const Duration(milliseconds: 500),
          ),
        );
      } else {
        child = _DecorationImage(element: element);
      }

      children.add(child);
    }
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.topCenter,
        children: children,
      );
}

class _DecorationImage extends StatelessWidget {
  final ShowerProductModel element;

  const _DecorationImage({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: element.left != null
          ? MediaQuery.of(context).size.width * element.left!
          : null,
      right: element.right != null
          ? MediaQuery.of(context).size.width * element.right!
          : null,
      bottom: element.bottom != null
          ? MediaQuery.of(context).size.height * element.bottom!
          : null,
      child: CustomAnimateContainer(
        fromAnimationModel: FromAnimationModel(
          fromAnimation: handledGenerateFromAnimation(element),
          child: Image(
            image: AssetImage(element.url),
            width: MediaQuery.of(context).size.width * element.width,
            height: MediaQuery.of(context).size.height * element.height,
          ),
        ),
      ),
    );
  }

  FromAnimation handledGenerateFromAnimation(ShowerProductModel element) {
    if (element.right != null) return FromAnimation.fromRight;
    if (element.left != null) return FromAnimation.fromLeft;
    if (element.bottom != null) return FromAnimation.fromDown;
    return FromAnimation.fromDown;
  }
}

class _MainContainer extends StatelessWidget {
  final ShowerProductModel element;

  const _MainContainer({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * element.width,
      height: MediaQuery.of(context).size.height * element.height,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.29,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(element.url),
        ),
      ),
    );
  }
}
