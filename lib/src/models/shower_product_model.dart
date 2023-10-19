enum PositionType {
  FRONT,
  BACK,
  MAIN,
}

class ShowerProductModel {
  final String url;
  final double? left;
  final double width;
  final double height;
  final double? right;
  final double? bottom;
  final PositionType positionType;

  ShowerProductModel({
    this.left,
    this.right,
    this.bottom,
    required this.url,
    required this.width,
    required this.height,
    required this.positionType,
  });

  ShowerProductModel copyWith({
    String? url,
    double? left,
    double? width,
    double? height,
    double? right,
    double? bottom,
    PositionType? positionType,
  }) =>
      ShowerProductModel(
        url: url ?? this.url,
        left: left ?? this.left,
        right: right ?? this.right,
        width: width ?? this.width,
        height: height ?? this.height,
        bottom: bottom ?? this.bottom,
        positionType: positionType ?? this.positionType,
      );
}