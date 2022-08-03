import 'package:dating_app/Model/participant.dart';

class ChatRoom {
  final String id;
  final String admin;
  final List<Participant> participants;
  final bool lock;
  final String title;
  final String image;

  ChatRoom({
    required this.image,
    required this.id,
    required this.participants,
    required this.admin,
    required this.lock,
    required this.title,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    List<Participant> participants = [];
    for (var participant in json["participants"]) {
      participants.add(Participant.fromJson(participant));
    }
    return ChatRoom(
      id: json['_id'],
      admin: json['admin'],
      lock: json['lock'],
      participants: participants,
      title: json['title'] ?? "",
      image: json['image'] ?? "",
    );
  }
}
