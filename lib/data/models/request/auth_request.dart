// To parse this JSON data, do
//
//     final authRequest = authRequestFromJson(jsonString);

import 'dart:convert';

AuthRequest authRequestFromJson(String str) => AuthRequest.fromJson(json.decode(str));

String authRequestToJson(AuthRequest data) => json.encode(data.toJson());

class AuthRequest {
  String? email;
  String? password;
  int? rememberMe;
  int? systemUser;

  AuthRequest({
    this.email,
    this.password,
    this.rememberMe,
    this.systemUser,
  });

  factory AuthRequest.fromJson(Map<String, dynamic> json) => AuthRequest(
    email: json["email"],
    password: json["password"],
    rememberMe: json["remember_me"],
    systemUser: json["system_user"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "remember_me": rememberMe,
    "system_user": systemUser,
  };
}
