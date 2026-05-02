import 'package:progress1_project/src/domain/models/Role.dart';

class CreateUserResponse {
  String email;
  String name;
  int id;
  String? image;
  String lastName;
  String? notificationToken;
  String phone;
  List<Role> roles;

  CreateUserResponse({
    required this.email,
    required this.name,
    required this.id,
    required this.lastName,
    this.image,
    this.notificationToken,
    required this.phone,
    required this.roles,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      CreateUserResponse(
        email: json["email"],
        id: json["id"],
        image: json["image"],
        lastName: json["lastName"],
        name: json["name"],
        notificationToken: json["notification_token"],
        phone: json["phone"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "email": email,
    "id": id,
    "image": image,
    "lastName": lastName,
    "name": name,
    "notification_token": notificationToken,
    "phone": phone,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}
