import 'dart:convert';

class PriceModel {
  final int price;
  final String size;
  final bool enable;

  PriceModel({
    required this.price,
    required this.size,
    required this.enable,
  });

  PriceModel copyWith({
    int? price,
    String? size,
    bool? enable,
  }) =>
      PriceModel(
        size: size ?? this.size,
        price: price ?? this.price,
        enable: enable ?? this.enable,
      );

  factory PriceModel.fromRawJson(String str) => PriceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
    size: json["size"],
    price: json["price"],
    enable: json["enable"],
  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "price": price,
    "enable": enable,
  };
}
