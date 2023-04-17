import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.created,
    required this.updated,
  });

  int id;
  String username;
  dynamic password;
  String email;
  DateTime created;
  DateTime updated;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
      };
}
