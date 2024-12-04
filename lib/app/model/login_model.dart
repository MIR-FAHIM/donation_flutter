// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  String? message;
  User? user;

  LoginModel({
     this.status,
     this.message,
     this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": user!.toJson(),
  };
}

class User {
  int id;
  String name;
  String mobile;
  String country;
  String email;
  DateTime emailVerifiedAt;
  int donateAmount;
  DateTime createdAt;
  DateTime updatedAt;
  String usertype;
  String projectId;
  String profileImage;

  User({
    required this.id,
    required this.name,
    required this.mobile,
    required this.country,
    required this.email,
    required this.emailVerifiedAt,
    required this.donateAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.usertype,
    required this.projectId,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    country: json["country"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"] ?? DateTime.now(),
    donateAmount: json["donate_amount"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    usertype: json["usertype"]?? "user",
    projectId: json["project_id"]?? "0",
    profileImage: json["profile_image"] ?? "" ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "country": country,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "donate_amount": donateAmount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "usertype": usertype,
    "project_id": projectId,
    "profile_image": profileImage,
  };
}
