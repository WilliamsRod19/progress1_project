// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String name;
  String lastname;
  String phone;
  String email;
  String password;

  User({
    required this.name,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    lastname: json["lastname"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lastname": lastname,
    "phone": phone,
    "email": email,
    "password": password,
  };
}
