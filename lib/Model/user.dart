import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/squareprofileimage.dart';

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.isPro,
    this.isEmailVerified,
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
    required this.dog,
    this.googleId,
    this.googleLogin,
    this.facebookId,
    this.facebookLogin,
    this.appleId,
    this.appleLogin,
    this.lat,
    this.long,
    this.searchDistance,
    this.searchDistanceType,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? isPro;
  bool? isEmailVerified;
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
  List<Dog> dog;
  String? googleId;
  bool? googleLogin;
  String? facebookId;
  bool? facebookLogin;
  String? appleId;
  bool? appleLogin;
  int? lat;
  int? long;
  int? searchDistance;
  String? searchDistanceType;

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    bool? isPro,
    bool? isEmailVerified,
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
    String? googleId,
    bool? googleLogin,
    String? facebookId,
    bool? facebookLogin,
    String? appleId,
    bool? appleLogin,
    int? lat,
    int? long,
    int? searchDistance,
    String? searchDistanceType,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isPro: isPro ?? this.isPro,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
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
      googleId: googleId ?? this.googleId,
      googleLogin: googleLogin ?? this.googleLogin,
      facebookId: facebookId ?? this.facebookId,
      facebookLogin: facebookLogin ?? this.facebookLogin,
      appleId: appleId ?? this.appleId,
      appleLogin: appleLogin ?? this.appleLogin,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      searchDistance: searchDistance ?? this.searchDistance,
      searchDistanceType: searchDistanceType ?? this.searchDistanceType,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      email: json["email"] ?? "",
      isPro: json["isPro"] ?? false,
      isEmailVerified: json["isEmailVerified"] ?? false,
      gender: json["gender"] ?? "",
      dob: json["dob"] != null ? DateTime.parse(json["dob"]) : null,
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
      length: json["length"],
      haveKids: json["haveKids"] ?? false,
      interests: List<dynamic>.from(json["interests"].map((x) => x)),
      favouriteNight: List<dynamic>.from(json["favouriteNight"].map((x) => x)),
      activity: List<dynamic>.from(json["activity"].map((x) => x)),
      aboutSelf: json["aboutSelf"] ?? "",
      dog: List<Dog>.from(json["dog"].map((x) => Dog.fromJson(x))),
      googleId: json["googleId"] ?? "",
      googleLogin: json["googleLogin"] ?? false,
      facebookId: json["facebookId"] ?? "",
      facebookLogin: json["facebookLogin"] ?? false,
      appleId: json["appleId"] ?? "",
      appleLogin: json["appleLogin"] ?? false,
      lat: json["last"],
      long: json["long"],
      searchDistance: json["searchDistance"],
      searchDistanceType: json["searchDistanceType"] ?? "",
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
        "squareProfileImage":
            List.from(squareProfileImage!.map((x) => x.id)).toList(),
        "circleProfileImage": circleProfileImage?.id,
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
        //  "dog": List<Dog>.from(dog.map((x) => x.toJson())),
        "googleId": googleId,
        "googleLogin": googleLogin,
        "facebookId": facebookId,
        "facebookLogin": facebookLogin,
        "appleId": appleId,
        "appleLogin": appleLogin,
        "lat": lat,
        "long": long,
        "searchDistance": searchDistance,
        "searchDistanceType": searchDistanceType,
      };
}
