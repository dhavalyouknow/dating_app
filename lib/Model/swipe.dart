// To parse this JSON data, do
//
//     final swipe = swipeFromJson(jsonString);

import 'dart:convert';

import 'package:dating_app/Model/squareprofileimage.dart';

List<Swipe> swipeFromJson(String str) =>
    List<Swipe>.from(json.decode(str).map((x) => Swipe.fromJson(x)));

String swipeToJson(List<Swipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Swipe {
  Swipe({
    this.id,
    this.firstName,
    this.lastName,
    this.squareProfileImage,
    this.dog,
    this.createdAt,
    this.updatedAt,
    this.circleProfileImage,
  });

  String? id;
  String? firstName;
  String? lastName;
  List<SquareProfileImage>? squareProfileImage;
  List<Dog>? dog;
  DateTime? createdAt;
  DateTime? updatedAt;
  SquareProfileImage? circleProfileImage;

  Swipe copyWith({
    String? id,
    String? firstName,
    String? lastName,
    List<SquareProfileImage>? squareProfileImage,
    List<Dog>? dog,
    DateTime? createdAt,
    DateTime? updatedAt,
    SquareProfileImage? circleProfileImage,
  }) =>
      Swipe(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        squareProfileImage: squareProfileImage ?? this.squareProfileImage,
        dog: dog ?? this.dog,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        circleProfileImage: circleProfileImage ?? this.circleProfileImage,
      );

  factory Swipe.fromJson(Map<String, dynamic> json) => Swipe(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        squareProfileImage: List<SquareProfileImage>.from(
            json["squareProfileImage"].map((x) => x)),
        dog: List<Dog>.from(json["dog"].map((x) => Dog.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        circleProfileImage: json["circleProfileImage"] == null
            ? null
            : SquareProfileImage.fromJson(json["circleProfileImage"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "circleProfileImage": circleProfileImage,
      };
}

class Dog {
  Dog({
    this.id,
    this.dogName,
    this.gender,
    this.size,
    this.lookingFor,
    this.squareProfileImage,
    this.circleProfileImage,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? dogName;
  String? gender;
  String? size;
  List<String>? lookingFor;
  List<SquareProfileImage>? squareProfileImage;
  List<SquareProfileImage>? circleProfileImage;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Dog copyWith({
    String? id,
    String? dogName,
    String? gender,
    String? size,
    List<String>? lookingFor,
    List<SquareProfileImage>? squareProfileImage,
    List<SquareProfileImage>? circleProfileImage,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      Dog(
        id: id ?? this.id,
        dogName: dogName ?? this.dogName,
        gender: gender ?? this.gender,
        size: size ?? this.size,
        lookingFor: lookingFor ?? this.lookingFor,
        squareProfileImage: squareProfileImage ?? this.squareProfileImage,
        circleProfileImage: circleProfileImage ?? this.circleProfileImage,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        id: json["_id"],
        dogName: json["dogName"],
        gender: json["gender"],
        size: json["size"],
        lookingFor: List<String>.from(json["lookingFor"].map((x) => x)),
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dogName": dogName,
        "gender": gender,
        "size": size,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
