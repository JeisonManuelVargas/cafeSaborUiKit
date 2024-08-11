import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserModel {
  String role;
  String name;
  String email;
  String image;
  String phone;
  String password;
  String lastName;
  String language;
  DateTime dateCreate;
  DocumentReference? id;
  List<AddressModel> address;

  UserModel({
    this.id,
    required this.role,
    required this.name,
    required this.image,
    required this.email,
    required this.phone,
    required this.address,
    required this.lastName,
    required this.language,
    required this.password,
    required this.dateCreate,
  });

  factory UserModel.fromJson(json, DocumentReference id) => UserModel(
        id: id,
        role: json["role"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        image: json["image"] ?? "",
        phone: json["phone"] ?? "",
        password: json["password"] ?? "",
        language: json["language"] ?? "",
        lastName: json["last_name"] ?? "",
        dateCreate: json["dateCreate"].toDate(),
        address: List<AddressModel>.from(
            json["address"].map((x) => AddressModel.fromJson(x))),
      );

  factory UserModel.init() => UserModel(
        role: "",
        name: "",
        image: "",
        email: "",
        phone: "",
        password: "",
        lastName: "",
        language: "",
        dateCreate: DateTime.now(),
        address: [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "email": email,
        "image": image,
        "phone": phone,
        "password": password,
        "language": language,
        "last_name": lastName,
        "dateCreate": dateCreate,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
      };

  Map<String, dynamic> toJsonUpdate() => {
        "role": role,
        "name": name,
        "email": email,
        "image": image,
        "phone": phone,
        "language": language,
        "last_name": lastName,
      };

  UserModel copyWith({
    String? role,
    String? name,
    String? email,
    String? image,
    String? phone,
    String? password,
    String? lastName,
    String? language,
    DateTime? dateCreate,
    DocumentReference? id,
    List<AddressModel>? address,
  }) =>
      UserModel(
        id: id ?? this.id,
        role: role ?? this.role,
        name: name ?? this.name,
        image: image ?? this.image,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        password: password ?? this.password,
        lastName: lastName ?? this.lastName,
        language: language ?? this.language,
        dateCreate: dateCreate ?? this.dateCreate,
      );
}

class AddressModel {
  String address;
  LatLng position;
  DateTime dateCreate;

  AddressModel({
    required this.address,
    required this.position,
    required this.dateCreate,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    double latitude = json["position"]["geopoint"].latitude;
    double longitude = json["position"]["geopoint"].longitude;

    final latLng = LatLng(latitude, longitude);

    return AddressModel(
      position: latLng,
      address: json["address"],
      dateCreate: json["dateCreate"].toDate(),
    );
  }

  factory AddressModel.init() => AddressModel(
        address: "",
        dateCreate: DateTime.now(),
        position: const LatLng(0, 0),
      );

  Map<String, dynamic> toJson() {
    final geo = GeoFlutterFire();
    final getFire = geo.point(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    return {
      "address": address,
      "dateCreate": dateCreate,
      "position": getFire.data,
    };
  }
}
