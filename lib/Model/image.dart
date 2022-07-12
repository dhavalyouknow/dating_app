import 'dart:convert';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

class Image {
  String id;
  String? description;
  String? title;
  String? url;

  Image({
    required this.id,
    this.description,
    this.title,
    this.url,
  });

  Image copyWith({
    String? id,
    String? description,
    String? title,
    String? url,
  }) =>
      Image(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
        url: url ?? this.url,
      );

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["_id"] ?? "",
      description: json["description"] ?? "",
      title: json["title"] ?? "",
      url: json["url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "title": title,
        "url": url,
      };
}
