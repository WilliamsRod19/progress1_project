// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';
import 'package:progress1_project/src/domain/models/CreateUserResponse.dart';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
    CreateUserResponse createUserResponse;
    String token;

    AuthResponse({
        required this.createUserResponse,
        required this.token,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        createUserResponse: CreateUserResponse.fromJson(json["createUserResponse"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "createUserResponse": createUserResponse.toJson(),
        "token": token,
    };
}