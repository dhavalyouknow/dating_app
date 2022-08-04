// class DisLiked {
//   DisLiked({
//     this.userId,
//     this.createdDate,
//     this.id,
//   });
//
//   String? userId;
//   DateTime? createdDate;
//   String? id;
//
//   DisLiked copyWith({
//     String? userId,
//     DateTime? createdDate,
//     String? id,
//   }) =>
//       DisLiked(
//         userId: userId ?? this.userId,
//         createdDate: createdDate ?? this.createdDate,
//         id: id ?? this.id,
//       );
//
//   factory DisLiked.fromJson(Map<String, dynamic> json) => DisLiked(
//         userId: json["userId"],
//         createdDate: DateTime.parse(json["createdDate"]),
//         id: json["_id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "createdDate": createdDate?.toIso8601String(),
//         "_id": id,
//       };
// }
