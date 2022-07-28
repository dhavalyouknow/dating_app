import 'package:dating_app/Model/squareprofileimage.dart';

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
  SquareProfileImage? circleProfileImage;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      id: json["_id"] ?? "",
      dogName: json["dogName"] ?? "",
      gender: json["gender"] ?? "",
      size: json["size"] ?? "",
      lookingFor: List<String>.from(json["lookingFor"].map((x) => x)),
      squareProfileImage: List<SquareProfileImage>.from(
          json["squareProfileImage"]
              .map((x) => SquareProfileImage.fromJson(x))),
      circleProfileImage: json["circleProfileImage"] != null
          ? SquareProfileImage.fromJson(json["circleProfileImage"])
          : null,
      userId: json["userId"] ?? "",
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dogName": dogName,
        "gender": gender,
        "size": size,
        "squareProfileImage":
            List.from(squareProfileImage!.map((x) => x.id)).toList(),
        "circleProfileImage": circleProfileImage?.id,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

  Dog copyWith(
      {String? id,
      String? dogName,
      String? gender,
      String? size,
      List<String>? lookingFor,
      List<SquareProfileImage>? squareProfileImage,
      SquareProfileImage? circleProfileImage,
      String? userId,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? v}) {
    return Dog(
        gender: gender ?? this.gender,
        circleProfileImage: circleProfileImage ?? this.circleProfileImage,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        dogName: dogName ?? this.dogName,
        lookingFor: lookingFor ?? this.lookingFor,
        size: size ?? this.size,
        squareProfileImage: squareProfileImage ?? this.squareProfileImage,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        v: v ?? this.v);
  }
}
