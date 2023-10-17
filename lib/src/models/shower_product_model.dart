enum PositionType{
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
}