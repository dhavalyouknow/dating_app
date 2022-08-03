class Chatting {
  final String id;
  final String room;
  final String sender;
  final String message;

  final List<String> received;
  final List<String> seen;
  final List<String> deleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Chatting({
    required this.id,
    required this.room,
    required this.sender,
    required this.message,
    required this.received,
    required this.seen,
    required this.deleted,
    this.createdAt,
    this.updatedAt,
  });

  Chatting copyWith({
    String? id,
    String? room,
    String? sender,
    String? message,
    List<String>? received,
    List<String>? seen,
    List<String>? deleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Chatting(
        id: id ?? this.id,
        room: room ?? this.room,
        sender: sender ?? this.sender,
        message: message ?? this.message,
        received: received ?? this.received,
        seen: seen ?? this.seen,
        deleted: deleted ?? this.deleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  factory Chatting.fromJson(Map<String, dynamic> json) {
    print(json['_id']);
    return Chatting(
      id: json['_id'],
      room: json['room'],
      sender: json['sender'],
      message: json['message'] ?? "",
      received: (json['received'] as List).isNotEmpty ? json['received'] : [],
      seen: (json['seen'] as List).isNotEmpty ? json['seen'] : [],
      deleted: (json['deleted'] as List).isNotEmpty ? json['deleted'] : [],
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }
}
