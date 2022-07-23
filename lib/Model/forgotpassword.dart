class ForgotPassword {
  ForgotPassword({
    required this.email,
  });

  String email;

  ForgotPassword copyWith({
    String? email,
  }) =>
      ForgotPassword(
        email: email ?? this.email,
      );

  factory ForgotPassword.fromJson(Map<String, dynamic> json) => ForgotPassword(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
