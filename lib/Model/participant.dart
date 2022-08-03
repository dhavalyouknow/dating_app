class Participant {
  final String id;
  final String firstName;
  final String lastName;
  final String image;

  Participant({
    required this.firstName,
    required this.id,
    required this.image,
    required this.lastName,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
      id: json["_id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      image: json["image"] ?? "");

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "image": image,
      };
}
