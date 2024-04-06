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
    required double heightBackground,
    List<Widget> backgroundBody = const [],
    required List<ShowerProductModel> images,
  }) =>
      _ShowerProductWidget(
        onTap: onTap,
        images: images,
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
  final List<ShowerProductModel> images;

  const _ShowerProductWidget({
    Key? key,
    this.onTap,
    required this.images,
    required this.marginTopMain,
    required this.backgroundBody,
    required this.backgroundColor,
    required this.heightBackground,
    required this.disableAnimation,
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
    Key? key,
    required this.element,
    required this.disableAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:
          element.left != null ? generateWidth(context) * element.left! : null,
      right: element.right != null
          ? generateWidth(context) * element.right!
          : null,
      bottom: element.bottom != null
          ? MediaQuery.of(context).size.height * element.bottom!
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

  double generateWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 2;

  FromAnimation handledGenerateFromAnimation(ShowerProductModel element) {
    if (element.right != null) return FromAnimation.fromRight;
    if (element.left != null) return FromAnimation.fromLeft;
    if (element.bottom != null) return FromAnimation.fromDown;
    return FromAnimation.fromDown;
  }
}

class _MainContainer extends StatelessWidget {
  final double marginTopMain;
  final ShowerProductModel element;

  const _MainContainer({
    Key? key,
    required this.element,
    required this.marginTopMain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: element.url,
      child: Container(
        width: MediaQuery.of(context).size.width * element.width,
        height: MediaQuery.of(context).size.height * element.height,
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
    Key? key,
    required this.child,
    required this.bodyBuild,
    required this.disableAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (disableAnimation) return child;
    return bodyBuild(child);
  }
}
