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
    this.eventId,
    this.ticketId,
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
  List<Dog>? dog;
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
  List<dynamic>? eventId;
  List<dynamic>? ticketId;

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
    List<dynamic>? eventId,
    List<dynamic>? ticketId,
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
      eventId: eventId ?? this.eventId,
      ticketId: ticketId ?? this.ticketId,
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
      squareProfileImage: json["squareProfileImage"] != null
          ? List<SquareProfileImage>.from(json["squareProfileImage"]
              .map((x) => SquareProfileImage.fromJson(x)))
          : null,
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
      interests: json["interests"] != null
          ? List<dynamic>.from(json["interests"].map((x) => x))
          : null,
      favouriteNight: json["favouriteNight"] != null
          ? List<dynamic>.from(json["favouriteNight"].map((x) => x))
          : null,
      activity: json["activity"] != null
          ? List<dynamic>.from(json["activity"].map((x) => x))
          : null,
      aboutSelf: json["aboutSelf"] ?? "",
      dog: json["dog"] != null
          ? List<Dog>.from(json["dog"].map((x) => Dog.fromJson(x)))
          : null,
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
      eventId: json["eventId"] != null
          ? List<dynamic>.from(json["eventId"].map((x) => x))
          : null,
      ticketId: json["ticketId"] != null
          ? List<dynamic>.from(json["ticketId"].map((x) => x))
          : null,
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
        "eventId": List<dynamic>.from(eventId!.map((x) => x)),
        "ticketId": List<dynamic>.from(ticketId!.map((x) => x)),
      };
}

// import 'package:dating_app/Model/disliked..dart';
// import 'package:dating_app/Model/dog.dart';
// import 'package:dating_app/Model/squareprofileimage.dart';
//
// class User {
//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.isPro,
//     this.isEmailVerified,
//     this.gender,
//     this.dob,
//     this.city,
//     this.searchingFor,
//     this.squareProfileImage,
//     this.circleProfileImage,
//     this.userType,
//     this.haveDog,
//     this.haveKids,
//     this.relationshipStatus,
//     this.interestedIn,
//     this.occupation,
//     this.eyeColor,
//     this.length,
//     this.interests,
//     this.favouriteNight,
//     this.activity,
//     this.aboutSelf,
//     required this.dog,
//     this.googleId,
//     this.googleLogin,
//     this.facebookId,
//     this.facebookLogin,
//     this.appleId,
//     this.appleLogin,
//     this.lat,
//     this.long,
//     this.searchDistance,
//     this.searchDistanceType,
//     this.eventId,
//     this.ticketId,
//     this.updatedAt,
//     this.createdAt,
//     this.blocked,
//     this.disLiked,
//     this.disLikedDog,
//     this.liked,
//     this.likedBy,
//     this.likedCount,
//     this.likedDog,
//     this.loginCount,
//     this.matched,
//     this.matchedCount,
//     this.maxSwipeYears,
//     this.minSwipeYears,
//     this.superLiked,
//     this.superLikedBy,
//     this.superLikedCount,
//   });
//
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   bool? isPro;
//   bool? isEmailVerified;
//   String? gender;
//   DateTime? dob;
//   String? city;
//   List<dynamic>? searchingFor;
//   List<SquareProfileImage>? squareProfileImage;
//   SquareProfileImage? circleProfileImage;
//   String? userType;
//   bool? haveDog;
//   bool? haveKids;
//   String? relationshipStatus;
//   String? interestedIn;
//   String? occupation;
//   String? eyeColor;
//   int? length;
//   List<dynamic>? interests;
//   List<dynamic>? favouriteNight;
//   List<dynamic>? activity;
//   String? aboutSelf;
//   List<Dog> dog;
//   int? minSwipeYears;
//   int? maxSwipeYears;
//   String? googleId;
//   bool? googleLogin;
//   String? facebookId;
//   bool? facebookLogin;
//   String? appleId;
//   bool? appleLogin;
//   int? lat;
//   int? long;
//   int? searchDistance;
//   String? searchDistanceType;
//   List<String>? blocked;
//   List<DisLiked>? likedBy;
//   List<dynamic>? liked;
//   List<DisLiked>? disLiked;
//   List<dynamic>? superLikedBy;
//   List<dynamic>? superLiked;
//   List<dynamic>? matched;
//   List<dynamic>? likedDog;
//   List<dynamic>? disLikedDog;
//   int? loginCount;
//   int? likedCount;
//   int? superLikedCount;
//   int? matchedCount;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   List<dynamic>? eventId;
//   List<dynamic>? ticketId;
//
//   User copyWith({
//     String? id,
//     String? firstName,
//     String? lastName,
//     String? email,
//     bool? isPro,
//     bool? isEmailVerified,
//     String? gender,
//     DateTime? dob,
//     String? city,
//     List<dynamic>? searchingFor,
//     List<SquareProfileImage>? squareProfileImage,
//     SquareProfileImage? circleProfileImage,
//     String? userType,
//     bool? haveDog,
//     bool? haveKids,
//     String? relationshipStatus,
//     String? interestedIn,
//     String? occupation,
//     String? eyeColor,
//     int? length,
//     List<dynamic>? interests,
//     List<dynamic>? favouriteNight,
//     List<dynamic>? activity,
//     String? aboutSelf,
//     List<Dog>? dog,
//     String? googleId,
//     bool? googleLogin,
//     String? facebookId,
//     bool? facebookLogin,
//     String? appleId,
//     bool? appleLogin,
//     int? lat,
//     int? long,
//     int? searchDistance,
//     String? searchDistanceType,
//     List<dynamic>? eventId,
//     List<dynamic>? ticketId,
//     List<String>? blocked,
//     List<DisLiked>? likedBy,
//     List<dynamic>? liked,
//     List<DisLiked>? disLiked,
//     List<dynamic>? superLikedBy,
//     List<dynamic>? superLiked,
//     List<dynamic>? matched,
//     List<dynamic>? likedDog,
//     List<dynamic>? disLikedDog,
//     int? loginCount,
//     int? likedCount,
//     int? superLikedCount,
//     int? matchedCount,
//     int? minSwipeYears,
//     int? maxSwipeYears,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) {
//     return User(
//       id: id ?? this.id,
//       firstName: firstName ?? this.firstName,
//       lastName: lastName ?? this.lastName,
//       email: email ?? this.email,
//       isPro: isPro ?? this.isPro,
//       isEmailVerified: isEmailVerified ?? this.isEmailVerified,
//       gender: gender ?? this.gender,
//       dob: dob ?? this.dob,
//       city: city ?? this.city,
//       searchingFor: searchingFor ?? this.searchingFor,
//       squareProfileImage: squareProfileImage ?? this.squareProfileImage,
//       circleProfileImage: circleProfileImage ?? this.circleProfileImage,
//       userType: userType ?? this.userType,
//       haveDog: haveDog ?? this.haveDog,
//       relationshipStatus: relationshipStatus ?? this.relationshipStatus,
//       interestedIn: interestedIn ?? this.interestedIn,
//       occupation: occupation ?? this.occupation,
//       eyeColor: eyeColor ?? this.eyeColor,
//       length: length ?? this.length,
//       interests: interests ?? this.interests,
//       favouriteNight: favouriteNight ?? this.favouriteNight,
//       activity: activity ?? this.activity,
//       aboutSelf: aboutSelf ?? this.aboutSelf,
//       dog: dog ?? this.dog,
//       haveKids: haveKids ?? this.haveKids,
//       googleId: googleId ?? this.googleId,
//       googleLogin: googleLogin ?? this.googleLogin,
//       facebookId: facebookId ?? this.facebookId,
//       facebookLogin: facebookLogin ?? this.facebookLogin,
//       appleId: appleId ?? this.appleId,
//       appleLogin: appleLogin ?? this.appleLogin,
//       lat: lat ?? this.lat,
//       long: long ?? this.long,
//       searchDistance: searchDistance ?? this.searchDistance,
//       searchDistanceType: searchDistanceType ?? this.searchDistanceType,
//       eventId: eventId ?? this.eventId,
//       ticketId: ticketId ?? this.ticketId,
//       updatedAt: updatedAt ?? this.updatedAt,
//       createdAt: createdAt ?? this.createdAt,
//       blocked: blocked ?? this.blocked,
//       disLiked: disLiked ?? this.disLiked,
//       disLikedDog: disLikedDog ?? this.disLikedDog,
//       liked: liked ?? this.liked,
//       likedBy: likedBy ?? this.likedBy,
//       likedCount: likedCount ?? this.likedCount,
//       likedDog: likedDog ?? this.likedDog,
//       loginCount: loginCount ?? this.loginCount,
//       matched: matched ?? this.matched,
//       matchedCount: matchedCount ?? this.matchedCount,
//       maxSwipeYears: maxSwipeYears ?? this.maxSwipeYears,
//       minSwipeYears: minSwipeYears ?? this.minSwipeYears,
//       superLiked: superLiked ?? this.superLiked,
//       superLikedBy: superLikedBy ?? this.superLikedBy,
//       superLikedCount: superLikedCount ?? this.superLikedCount,
//     );
//   }
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json["_id"] ?? "",
//       firstName: json["firstName"] ?? "",
//       lastName: json["lastName"] ?? "",
//       email: json["email"] ?? "",
//       isPro: json["isPro"] ?? false,
//       isEmailVerified: json["isEmailVerified"] ?? false,
//       gender: json["gender"] ?? "",
//       dob: json["dob"] != null ? DateTime.parse(json["dob"]) : null,
//       city: json["city"] ?? "",
//       searchingFor: List<dynamic>.from(json["searchingFor"].map((x) => x)),
//       squareProfileImage: List<SquareProfileImage>.from(
//           json["squareProfileImage"]
//               .map((x) => SquareProfileImage.fromJson(x))),
//       circleProfileImage: json["circleProfileImage"] != null
//           ? SquareProfileImage.fromJson(json["circleProfileImage"])
//           : null,
//       userType: json["userType"] ?? "",
//       haveDog: json["haveDog"] ?? false,
//       relationshipStatus: json["relationshipStatus"] ?? "",
//       interestedIn: json["interestedIn"] ?? "",
//       occupation: json["occupation"] ?? "",
//       eyeColor: json["eyeColor"] ?? "",
//       length: json["length"],
//       haveKids: json["haveKids"] ?? false,
//       interests: List<dynamic>.from(json["interests"].map((x) => x)),
//       favouriteNight: List<dynamic>.from(json["favouriteNight"].map((x) => x)),
//       activity: List<dynamic>.from(json["activity"].map((x) => x)),
//       aboutSelf: json["aboutSelf"] ?? "",
//       dog: List<Dog>.from(json["dog"].map((x) => Dog.fromJson(x))),
//       googleId: json["googleId"] ?? "",
//       googleLogin: json["googleLogin"] ?? false,
//       facebookId: json["facebookId"] ?? "",
//       facebookLogin: json["facebookLogin"] ?? false,
//       appleId: json["appleId"] ?? "",
//       appleLogin: json["appleLogin"] ?? false,
//       lat: json["last"],
//       long: json["long"],
//       searchDistance: json["searchDistance"],
//       searchDistanceType: json["searchDistanceType"] ?? "",
//       eventId: List<dynamic>.from(json["eventId"].map((x) => x)),
//       ticketId: List<dynamic>.from(json["ticketId"].map((x) => x)),
//       superLikedCount: json["superLikedCount"],
//       superLikedBy: List<dynamic>.from(json["superLikedBy"].map((x) => x)),
//       superLiked: List<dynamic>.from(json["superLiked"].map((x) => x)),
//       matched: List<dynamic>.from(json["matched"].map((x) => x)),
//       minSwipeYears: json["minSwipeYears"],
//       maxSwipeYears: json["maxSwipeYears"],
//       matchedCount: json["matchedCount"],
//       loginCount: json["loginCount"],
//       likedCount: json["likedCount"],
//       likedDog: List<dynamic>.from(json["likedDog"].map((x) => x)),
//       likedBy:
//           List<DisLiked>.from(json["likedBy"].map((x) => DisLiked.fromJson(x))),
//       liked: List<dynamic>.from(json["liked"].map((x) => x)),
//       disLikedDog: List<dynamic>.from(json["disLikedDog"].map((x) => x)),
//       disLiked: List<DisLiked>.from(
//           json["disLiked"].map((x) => DisLiked.fromJson(x))),
//       blocked: List<String>.from(json["blocked"].map((x) => x)),
//       createdAt: DateTime.parse(json["createdAt"]),
//       updatedAt: DateTime.parse(json["updatedAt"]),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "firstName": firstName,
//         "lastName": lastName,
//         "email": email,
//         "isPro": isPro,
//         "isEmailVerified": isEmailVerified,
//         "gender": gender,
//         "dob": dob?.toIso8601String(),
//         "city": city,
//         "searchingFor": List<dynamic>.from(searchingFor!.map((x) => x)),
//         "squareProfileImage":
//             List<dynamic>.from(squareProfileImage!.map((x) => x.toJson())),
//         "circleProfileImage": circleProfileImage?.toJson(),
//         "userType": userType,
//         "haveDog": haveDog,
//         "relationshipStatus": relationshipStatus,
//         "interestedIn": interestedIn,
//         "haveKids": haveKids,
//         "occupation": occupation,
//         "eyeColor": eyeColor,
//         "length": length,
//         "interests": List<dynamic>.from(interests!.map((x) => x)),
//         "favouriteNight": List<dynamic>.from(favouriteNight!.map((x) => x)),
//         "activity": List<dynamic>.from(activity!.map((x) => x)),
//         "aboutSelf": aboutSelf,
//         "dog": List<dynamic>.from(dog.map((x) => x.toJson())),
//         "minSwipeYears": minSwipeYears,
//         "maxSwipeYears": maxSwipeYears,
//         "googleLogin": googleLogin,
//         "facebookLogin": facebookLogin,
//         "appleLogin": appleLogin,
//         "lat": lat,
//         "long": long,
//         "searchDistance": searchDistance,
//         "searchDistanceType": searchDistanceType,
//         "blocked": List<dynamic>.from(blocked!.map((x) => x)),
//         "likedBy": List<dynamic>.from(likedBy!.map((x) => x.toJson())),
//         "liked": List<dynamic>.from(liked!.map((x) => x)),
//         "disLiked": List<dynamic>.from(disLiked!.map((x) => x.toJson())),
//         "superLikedBy": List<dynamic>.from(superLikedBy!.map((x) => x)),
//         "superLiked": List<dynamic>.from(superLiked!.map((x) => x)),
//         "matched": List<dynamic>.from(matched!.map((x) => x)),
//         "likedDog": List<dynamic>.from(likedDog!.map((x) => x)),
//         "disLikedDog": List<dynamic>.from(disLikedDog!.map((x) => x)),
//         "loginCount": loginCount,
//         "likedCount": likedCount,
//         "superLikedCount": superLikedCount,
//         "matchedCount": matchedCount,
//         "eventId": List<dynamic>.from(eventId!.map((x) => x)),
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//       };
// }
