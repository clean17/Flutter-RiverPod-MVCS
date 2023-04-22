// import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.password,
//     required this.email,
//     required this.created,
//     required this.updated,
//   });

//   int id;
//   String name;
//   dynamic password;
//   String email;
//   DateTime created;
//   DateTime updated;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         name: json["name"],
//         password: json["password"],
//         email: json["email"],
//         created: DateTime.parse(json["created"]),
//         updated: DateTime.parse(json["updated"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "password": password,
//         "email": email,
//         "created": created.toIso8601String(),
//         "updated": updated.toIso8601String(),
//       };
// }

class User {
  final int id;
  final String name;
  final String email;
  final String createdAt;
  // final DateTime updated;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    // required this.updated,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt,
        // "updated": updated
      };

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"],
        createdAt = json["createdAt"];
  // created = DateFormat("yyyy-mm-dd").parse(json["created"]);
  // updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);
}
