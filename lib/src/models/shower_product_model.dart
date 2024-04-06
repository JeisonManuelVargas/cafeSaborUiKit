enum PositionType {
  FRONT,
  BACK,
  MAIN,
}

class ShowerProductModel {
  final String url;
  final double? left;
  final int width;
  final int height;
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

  Map<String, dynamic> toJson() => {
        "url": url,
        "left": left,
        "width": width,
        "height": height,
        "right": right,
        "bottom": bottom,
        "positionType": positionType.name,
      };

  factory ShowerProductModel.fromJson(data) => ShowerProductModel(
        url: data["url"] ?? "",
        left: data["left"]?.toDouble() ?? 0.0,
        width: data["width"]?.toDouble() ?? 0.0,
        height: data["height"]?.toDouble() ?? 0.0,
        right: data["right"]?.toDouble() ?? 0.0,
        bottom: data["bottom"]?.toDouble() ?? 0.0,
        positionType: data["positionType"] != null
            ? _generatePositionType(data["positionType"])
            : PositionType.BACK,
      );

  ShowerProductModel copyWith({
    String? url,
    double? left,
    int? width,
    int? height,
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

PositionType _generatePositionType(String name) {
  if (name == PositionType.BACK.name) return PositionType.BACK;
  if (name == PositionType.MAIN.name) return PositionType.MAIN;
  if (name == PositionType.FRONT.name) return PositionType.FRONT;
  return PositionType.BACK;
}
