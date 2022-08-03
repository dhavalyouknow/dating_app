import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/squareprofileimage.dart';

class Swipe {
  Swipe({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.about,
    this.dob,
    required this.city,
    required this.squareProfileImage,
    required this.createdAt,
    required this.updatedAt,
    required this.year,
    this.dog,
    required this.circleProfileImage,
  });

  String id;
  String firstName;
  String lastName;
  String? about;
  DateTime? dob;
  String city;
  List<SquareProfileImage> squareProfileImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int year;
  List<Dog>? dog;
  List<SquareProfileImage> circleProfileImage;

  Swipe copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? about,
    DateTime? dob,
    String? city,
    List<SquareProfileImage>? squareProfileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? year,
    List<Dog>? dog,
    List<SquareProfileImage>? circleProfileImage,
  }) =>
      Swipe(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        about: about ?? this.about,
        dob: dob ?? this.dob,
        city: city ?? this.city,
        squareProfileImage: squareProfileImage ?? this.squareProfileImage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        year: year ?? this.year,
        dog: dog ?? this.dog,
        circleProfileImage: circleProfileImage ?? this.circleProfileImage,
      );

  factory Swipe.fromJson(Map<String, dynamic> json) {
    return Swipe(
      id: json["_id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      about: json["about"] ?? "",
      dob: json["dob"] != null ? DateTime.parse(json["dob"]) : null,
      city: json["city"] ?? "",
      squareProfileImage: List<SquareProfileImage>.from(
          json["squareProfileImage"]
              .map((x) => SquareProfileImage.fromJson(x))),
      createdAt:
          json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
      updatedAt:
          json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      year: json["year"] ?? 0,
      dog: json["dog"] != null
          ? List<Dog>.from(json["dog"].map((x) => Dog.fromJson(x)))
          : null,
      circleProfileImage: List<SquareProfileImage>.from(
          (json["circleProfileImage"] ?? [])
              .map((x) => SquareProfileImage.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "dob": dob?.toIso8601String(),
        "city": city,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "year": year,
      };
}
