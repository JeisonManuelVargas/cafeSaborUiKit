// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor_ui_kit/src/models/price_model.dart';
import 'package:cafe_sabor_ui_kit/src/utils/ui_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String name;
  final Color color;
  final bool enabled;
  final String description;
  final DocumentReference? id;
  final List<PriceModel> price;
  final List<ShowerProductModel> images;

  ProductModel({
    this.id,
    required this.name,
    required this.color,
    required this.price,
    required this.images,
    required this.enabled,
    required this.description,
  });

  factory ProductModel.init() => ProductModel(
        id: null,
        name: "",
        price: [],
        images: [],
        enabled: true,
        description: "",
        color: CafeKit.util.color.green,
      );

  factory ProductModel.fromJson(DocumentReference id, data) => ProductModel(
        id: id,
        name: data["name"] ?? "",
        enabled: data["enabled"] ?? true,
        description: data["description"] ?? "",
        color:
            data["color"] != null ? Color(data["color"]) : UiColor().textColor,
        price: List<PriceModel>.from(
            data["price"].map((x) => PriceModel.fromJson(x))),
        images: List<ShowerProductModel>.from(
            data["images"].map((x) => ShowerProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "enabled": enabled,
        "color": color.value,
        "description": description,
        "price": List<dynamic>.from(price.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };

  ProductModel copyWith({
    String? name,
    Color? color,
    bool? enabled,
    List<PriceModel>? price,
    String? description,
    DocumentReference? id,
    List<ShowerProductModel>? images,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        price: price ?? this.price,
        images: images ?? this.images,
        enabled: enabled ?? this.enabled,
        description: description ?? this.description,
      );
}
