// To parse this JSON data, do
//
//     final getReviewModel = getReviewModelFromJson(jsonString);

import 'dart:convert';

GetReviewModel getReviewModelFromJson(String str) => GetReviewModel.fromJson(json.decode(str));

String getReviewModelToJson(GetReviewModel data) => json.encode(data.toJson());

class GetReviewModel {
  String? message;
  int? status;
  List<DatumReview>? data;

  GetReviewModel({
     this.message,
     this.status,
     this.data,
  });

  factory GetReviewModel.fromJson(Map<String, dynamic> json) => GetReviewModel(
    message: json["message"],
    status: json["status"],
    data: List<DatumReview>.from(json["data"].map((x) => DatumReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumReview {
  int id;
  String projectName;
  String email;
  String mobile;
  String message;
  String userId;
  String projectId;
  String star;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  DatumReview({
    required this.id,
    required this.projectName,
    required this.email,
    required this.mobile,
    required this.message,
    required this.userId,
    required this.projectId,
    required this.star,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory DatumReview.fromJson(Map<String, dynamic> json) => DatumReview(
    id: json["id"],
    projectName: json["project_name"],
    email: json["email"],
    mobile: json["mobile"],
    message: json["message"],
    userId: json["user_id"],
    projectId: json["project_id"],
    star: json["star"],
    user: User.fromJson(json["user"]) ,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_name": projectName,
    "email": email,
    "mobile": mobile,
    "message": message,
    "user_id": userId,
    "project_id": projectId,
    "star": star,
    "user": user.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
class User {
  int id;
  String name;
  String mobile;
  String country;
  String email;
  dynamic emailVerifiedAt;
  int donateAmount;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic usertype;
  dynamic projectId;
  dynamic profileImage;

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
    emailVerifiedAt: json["email_verified_at"],
    donateAmount: json["donate_amount"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    usertype: json["usertype"],
    projectId: json["project_id"],
    profileImage: json["profile_image"],
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