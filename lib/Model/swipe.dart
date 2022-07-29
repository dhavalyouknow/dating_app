import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/squareprofileimage.dart';

class Swipe {
  Swipe({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dob,
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
  DateTime dob;
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
    print(json["dog"]);
    return Swipe(
      id: json["_id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      dob: DateTime.parse(json["dob"]),
      city: json["city"] ?? "",
      squareProfileImage: List<SquareProfileImage>.from(
          json["squareProfileImage"]
              .map((x) => SquareProfileImage.fromJson(x))),
      createdAt:
          json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
      updatedAt:
          json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      year: json["year"],
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
        "dob": dob.toIso8601String(),
        "city": city,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "year": year,
      };
}
