class Event {
  Event({
    this.id,
    this.title,
    this.subTitle,
    this.location,
    this.desc,
    this.eventDate,
    this.time,
    this.recommendedAge,
    this.totalCapacity,
    this.bookedSeat,
    this.price,
    this.isInside,
    this.eventPic,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? title;
  String? subTitle;
  String? location;
  String? desc;
  DateTime? eventDate;
  String? time;
  String? recommendedAge;
  int? totalCapacity;
  int? bookedSeat;
  int? price;
  bool? isInside;
  List<EventPic>? eventPic;
  DateTime? createdAt;
  DateTime? updatedAt;

  Event copyWith({
    String? id,
    String? title,
    String? subTitle,
    String? location,
    String? desc,
    DateTime? eventDate,
    String? time,
    String? recommendedAge,
    int? totalCapacity,
    int? bookedSeat,
    int? price,
    bool? isInside,
    List<EventPic>? eventPic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Event(
        id: id ?? this.id,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        location: location ?? this.location,
        desc: desc ?? this.desc,
        eventDate: eventDate ?? this.eventDate,
        time: time ?? this.time,
        recommendedAge: recommendedAge ?? this.recommendedAge,
        totalCapacity: totalCapacity ?? this.totalCapacity,
        bookedSeat: bookedSeat ?? this.bookedSeat,
        price: price ?? this.price,
        isInside: isInside ?? this.isInside,
        eventPic: eventPic ?? this.eventPic,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["_id"],
        title: json["title"],
        subTitle: json["subTitle"],
        location: json["location"],
        desc: json["desc"],
        eventDate: DateTime.parse(json["eventDate"]),
        time: json["time"],
        recommendedAge: json["recommendedAge"],
        totalCapacity: json["totalCapacity"],
        bookedSeat: json["bookedSeat"],
        price: json["price"],
        isInside: json["isInside"],
        eventPic: List<EventPic>.from(
            json["eventPic"].map((x) => EventPic.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "subTitle": subTitle,
        "location": location,
        "desc": desc,
        "eventDate": eventDate?.toIso8601String(),
        "time": time,
        "recommendedAge": recommendedAge,
        "totalCapacity": totalCapacity,
        "bookedSeat": bookedSeat,
        "price": price,
        "isInside": isInside,
        "eventPic": List<EventPic>.from(eventPic!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class EventPic {
  EventPic({
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

  EventPic copyWith({
    String? id,
    String? description,
    String? title,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      EventPic(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
        url: url ?? this.url,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory EventPic.fromJson(Map<String, dynamic> json) => EventPic(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        url: json["url"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

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
