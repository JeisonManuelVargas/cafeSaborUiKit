// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor_ui_kit/src/widgets/custom_animate_container.dart';

class CompositeWidgets {
  Widget showerProduct({
    Function? onTap,
    double marginTopMain = 0,
    bool disableAnimation = false,
    required Color backgroundColor,
    AlignmentDirectional? alignment,
    required double heightBackground,
    List<Widget> backgroundBody = const [],
    required List<ShowerProductModel> images,
  }) =>
      _ShowerProductWidget(
        onTap: onTap,
        images: images,
        alignment: alignment,
        marginTopMain: marginTopMain,
        backgroundBody: backgroundBody,
        backgroundColor: backgroundColor,
        disableAnimation: disableAnimation,
        heightBackground: heightBackground,
      );
}

class _ShowerProductWidget extends StatefulWidget {
  final Function? onTap;
  final double marginTopMain;
  final Color backgroundColor;
  final bool disableAnimation;
  final double heightBackground;
  final List<Widget> backgroundBody;
  final AlignmentDirectional? alignment;
  final List<ShowerProductModel> images;

  const _ShowerProductWidget({
    this.onTap,
    this.alignment,
    required this.images,
    required this.marginTopMain,
    required this.backgroundBody,
    required this.backgroundColor,
    required this.heightBackground,
    required this.disableAnimation,
  });

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
        child: Stack(
          alignment: widget.alignment != null ? widget.alignment! : Alignment.center,
          children: widget.backgroundBody,
        ),
      ),
    );

    for (var element in widget.images) {
      Widget child;

      if (element.positionType == PositionType.MAIN) {
        child = InkWell(
          onTap: widget.onTap != null ? () => widget.onTap!() : () {},
          child: _GenerateBody(
            bodyBuild: (Widget body) => CustomAnimateContainer(
              fromAnimationModel: FromAnimationModel(
                fromAnimation: FromAnimation.fromDown,
                child: body,
                duration: const Duration(milliseconds: 500),
              ),
            ),
            disableAnimation: widget.disableAnimation,
            child: _MainContainer(
              element: element,
              marginTopMain:
                  widget.marginTopMain != 0 ? widget.marginTopMain : 0.29,
            ),
          ),
        );
      } else {
        child = _DecorationImage(
          element: element,
          disableAnimation: widget.disableAnimation,
        );
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
  final bool disableAnimation;
  final ShowerProductModel element;

  const _DecorationImage({
    required this.element,
    required this.disableAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: element.left != 0
          ? (_generateWidth(context) * element.left!) / 10
          : null,
      right: element.right != 0
          ? (_generateWidth(context) * element.right!) / 10
          : null,
      bottom: element.bottom != 0
          ? (MediaQuery.of(context).size.height / 2 * element.bottom!) / 10
          : null,
      child: _GenerateBody(
        disableAnimation: disableAnimation,
        bodyBuild: (Widget child) => CustomAnimateContainer(
          fromAnimationModel: FromAnimationModel(
            fromAnimation: handledGenerateFromAnimation(element),
            child: child,
          ),
        ),
        child: Image(
          image: NetworkImage(element.url),
          width: element.width.floorToDouble(),
          height: element.height.floorToDouble(),
        ),
      ),
    );
  }

  double _generateWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 2;

  FromAnimation handledGenerateFromAnimation(ShowerProductModel element) {
    if (element.right != null && element.right != 0)
      return FromAnimation.fromRight;
    if (element.left != null && element.left != 0)
      return FromAnimation.fromLeft;
    if (element.bottom != null && element.bottom != 0)
      return FromAnimation.fromDown;
    return FromAnimation.fromDown;
  }
}

class _MainContainer extends StatelessWidget {
  final double marginTopMain;
  final ShowerProductModel element;

  const _MainContainer({
    required this.element,
    required this.marginTopMain,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: element.url,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * marginTopMain,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(element.url),
          ),
        ),
      ),
    );
  }
}

class _GenerateBody extends StatelessWidget {
  final Widget child;
  final bool disableAnimation;
  final Widget Function(Widget) bodyBuild;

  const _GenerateBody({
    required this.child,
    required this.bodyBuild,
    required this.disableAnimation,
  });

  @override
  Widget build(BuildContext context) {
    if (disableAnimation) return child;
    return bodyBuild(child);
  }
}
