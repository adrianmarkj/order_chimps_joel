// To parse this JSON data, do
//
//     final authRequest = authRequestFromJson(jsonString);

import 'dart:convert';

import 'package:base_project/data/models/common/api_request.dart';

AuthRequest authRequestFromJson(String str) => AuthRequest.fromJson(json.decode(str));

String authRequestToJson(AuthRequest data) => json.encode(data.toJson());

class AuthRequest extends Serializable {
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

  @override
  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "remember_me": rememberMe,
    "system_user": systemUser,
  };
}
