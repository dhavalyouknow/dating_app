class User {
    User({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.isEmailVerified,
        this.gender,
        this.dob,
        this.city,
        this.password,
        this.fcmToken,
        this.userType,
    });

    String? id;
    String? firstName;
    String? lastName;
    String? email;
    bool? isEmailVerified;
    String? gender;
    DateTime? dob;
    String? city;
    String? password;
    List<dynamic>? fcmToken;
    String? userType;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        isEmailVerified: json["isEmailVerified"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        city: json["city"],
        password: json["password"],
        fcmToken: List<dynamic>.from(json["FCMToken"].map((x) => x)),
        userType: json["userType"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "isEmailVerified": isEmailVerified,
        "gender": gender,
        "dob": dob,
        "city": city,
        "password": password,
        "userType": userType,
    };
}
