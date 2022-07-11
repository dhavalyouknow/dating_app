import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/squareprofileimage.dart';

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.isPro,
    this.gender,
    this.dob,
    this.city,
    this.searchingFor,
    this.squareProfileImage,
    this.circleProfileImage,
    this.userType,
    this.haveDog,
    this.haveKids,
    this.relationshipStatus,
    this.interestedIn,
    this.occupation,
    this.eyeColor,
    this.length,
    this.interests,
    this.favouriteNight,
    this.activity,
    this.aboutSelf,
    this.dog,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? isPro;
  String? gender;
  DateTime? dob;
  String? city;
  List<dynamic>? searchingFor;
  List<SquareProfileImage>? squareProfileImage;
  SquareProfileImage? circleProfileImage;
  String? userType;
  bool? haveDog;
  bool? haveKids;
  String? relationshipStatus;
  String? interestedIn;
  String? occupation;
  String? eyeColor;
  int? length;
  List<dynamic>? interests;
  List<dynamic>? favouriteNight;
  List<dynamic>? activity;
  String? aboutSelf;
  List<Dog>? dog;

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    bool? isPro,
    String? gender,
    DateTime? dob,
    String? city,
    List<dynamic>? searchingFor,
    List<SquareProfileImage>? squareProfileImage,
    SquareProfileImage? circleProfileImage,
    String? userType,
    bool? haveDog,
    bool? haveKids,
    String? relationshipStatus,
    String? interestedIn,
    String? occupation,
    String? eyeColor,
    int? length,
    List<dynamic>? interests,
    List<dynamic>? favouriteNight,
    List<dynamic>? activity,
    String? aboutSelf,
    List<Dog>? dog,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isPro: isPro ?? this.isPro,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      city: city ?? this.city,
      searchingFor: searchingFor ?? this.searchingFor,
      squareProfileImage: squareProfileImage ?? this.squareProfileImage,
      circleProfileImage: circleProfileImage ?? this.circleProfileImage,
      userType: userType ?? this.userType,
      haveDog: haveDog ?? this.haveDog,
      relationshipStatus: relationshipStatus ?? this.relationshipStatus,
      interestedIn: interestedIn ?? this.interestedIn,
      occupation: occupation ?? this.occupation,
      eyeColor: eyeColor ?? this.eyeColor,
      length: length ?? this.length,
      interests: interests ?? this.interests,
      favouriteNight: favouriteNight ?? this.favouriteNight,
      activity: activity ?? this.activity,
      aboutSelf: aboutSelf ?? this.aboutSelf,
      dog: dog ?? this.dog,
      haveKids: haveKids ?? this.haveKids,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      email: json["email"] ?? "",
      isPro: json["isPro"] ?? false,
      gender: json["gender"] ?? "",
      dob: DateTime.parse(json["dob"]),
      city: json["city"] ?? "",
      searchingFor: List<dynamic>.from(json["searchingFor"].map((x) => x)),
      squareProfileImage: List<SquareProfileImage>.from(
          json["squareProfileImage"]
              .map((x) => SquareProfileImage.fromJson(x))),
      circleProfileImage: json["circleProfileImage"] != null
          ? SquareProfileImage.fromJson(json["circleProfileImage"])
          : null,
      userType: json["userType"] ?? "",
      haveDog: json["haveDog"] ?? false,
      relationshipStatus: json["relationshipStatus"] ?? "",
      interestedIn: json["interestedIn"] ?? "",
      occupation: json["occupation"] ?? "",
      eyeColor: json["eyeColor"] ?? "",
      length: json["length"] ?? "",
      haveKids: json["haveKids"] ?? false,
      interests: List<dynamic>.from(json["interests"].map((x) => x)),
      favouriteNight: List<dynamic>.from(json["favouriteNight"].map((x) => x)),
      activity: List<dynamic>.from(json["activity"].map((x) => x)),
      aboutSelf: json["aboutSelf"] ?? "",
      dog: List<Dog>.from(json["dog"].map((x) => Dog.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "isPro": isPro,
        "gender": gender,
        "dob": dob?.toIso8601String(),
        "city": city,
        "searchingFor": List<dynamic>.from(searchingFor!.map((x) => x)),
        "squareProfileImage": List<SquareProfileImage>.from(
            squareProfileImage!.map((x) => x.toJson())),
        "circleProfileImage": circleProfileImage,
        "userType": userType,
        "haveDog": haveDog,
        "relationshipStatus": relationshipStatus,
        "interestedIn": interestedIn,
        "occupation": occupation,
        "eyeColor": eyeColor,
        "length": length,
        "interests": List<dynamic>.from(interests!.map((x) => x)),
        "favouriteNight": List<dynamic>.from(favouriteNight!.map((x) => x)),
        "activity": List<dynamic>.from(activity!.map((x) => x)),
        "aboutSelf": aboutSelf,
        "haveKids": haveKids,
        "dog": List<Dog>.from(dog!.map((x) => x.toJson())),
      };
}
