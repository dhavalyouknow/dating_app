import 'package:dating_app/Model/squareprofileimage.dart';

class DogSwipe {
  DogSwipe({
    required this.id,
    required this.dogName,
    required this.gender,
    required this.size,
    required this.lookingFor,
    required this.squareProfileImage,
    required this.userId,
  });

  String? id;
  String? dogName;
  String? gender;
  String? size;
  List<dynamic>? lookingFor;
  List<SquareProfileImage>? squareProfileImage;
  UserId? userId;

  DogSwipe copyWith({
    String? id,
    String? dogName,
    String? gender,
    String? size,
    List<dynamic>? lookingFor,
    List<SquareProfileImage>? squareProfileImage,
    UserId? userId,
  }) =>
      DogSwipe(
        id: id ?? this.id,
        dogName: dogName ?? this.dogName,
        gender: gender ?? this.gender,
        size: size ?? this.size,
        lookingFor: lookingFor ?? this.lookingFor,
        squareProfileImage: squareProfileImage ?? this.squareProfileImage,
        userId: userId ?? this.userId,
      );

  factory DogSwipe.fromJson(Map<String, dynamic> json) {
    return DogSwipe(
      id: json["_id"],
      dogName: json["dogName"],
      gender: json["gender"],
      size: json["size"],
      lookingFor: List<dynamic>.from(json["lookingFor"].map((x) => x)),
      squareProfileImage: json["squareProfileImage"] != null
          ? List<SquareProfileImage>.from(json["squareProfileImage"]
              .map((x) => SquareProfileImage.fromJson(x)))
          : null,
      userId: json["userId"] != null ? UserId.fromJson(json["userId"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dogName": dogName,
        "gender": gender,
        "size": size,
        "userId": userId,
      };
}

class UserId {
  UserId({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.city,
    this.squareProfileImage,
  });

  String? id;
  String? firstName;
  String? lastName;
  DateTime? dob;
  String? city;
  List<SquareProfileImage>? squareProfileImage;

  UserId copyWith({
    String? id,
    String? firstName,
    String? lastName,
    DateTime? dob,
    String? city,
    List<SquareProfileImage>? squareProfileImage,
  }) =>
      UserId(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        dob: dob ?? this.dob,
        city: city ?? this.city,
        squareProfileImage: squareProfileImage ?? this.squareProfileImage,
      );

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      id: json["_id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      dob: json["dob"] != null ? DateTime.parse(json["dob"]) : null,
      city: json["city"],
      squareProfileImage: json["squareProfileImage"] != null
          ? List<SquareProfileImage>.from(
              json["squareProfileImage"].map(
                (x) => SquareProfileImage.fromJson(x),
              ),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "dob": dob?.toIso8601String(),
        "city": city,
        // "squareProfileImage":
        //     List<dynamic>.from(squareProfileImage!.map((x) => x.toJson())),
      };
}
