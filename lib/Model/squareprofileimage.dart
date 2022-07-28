class SquareProfileImage {
  SquareProfileImage({
    this.id,
    this.description,
    this.title,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? description;
  String? title;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory SquareProfileImage.fromJson(Map<String, dynamic> json) {
    return SquareProfileImage(
      id: json["_id"] ?? "",
      description: json["description"] ?? "",
      title: json["title"] ?? "",
      url: json["url"] ?? "",
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "title": title,
        "url": url,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
