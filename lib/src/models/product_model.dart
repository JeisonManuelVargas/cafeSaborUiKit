// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor_ui_kit/src/utils/ui_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String name;
  final Color color;
  final double price;
  final String description;
  final DocumentReference? id;
  final List<ShowerProductModel> images;

  ProductModel({
    this.id,
    required this.name,
    required this.color,
    required this.price,
    required this.images,
    required this.description,
  });

  factory ProductModel.init() => ProductModel(
        id: null,
        name: "",
        images: [],
        price: 0.0,
        description: "",
        color: CafeKit.util.color.green,
      );

  factory ProductModel.fromJson(DocumentReference id, data) => ProductModel(
        id: id,
        name: data["name"] ?? "",
        price: data["price"] ?? 0.0,
        description: data["description"] ?? "",
        color: data["color"] != null ? Color(data["color"]) : UiColor().textColor,
        images: List<ShowerProductModel>.from(data["images"].map((x) => ShowerProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "color": color.value,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };

  ProductModel copyWith({
    String? name,
    Color? color,
    double? price,
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
        description: description ?? this.description,
      );
}
