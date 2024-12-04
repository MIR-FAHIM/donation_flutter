// To parse this JSON data, do
//
//     final allUserListModel = allUserListModelFromJson(jsonString);

import 'dart:convert';

AllUserListModel allUserListModelFromJson(String str) => AllUserListModel.fromJson(json.decode(str));

String allUserListModelToJson(AllUserListModel data) => json.encode(data.toJson());

class AllUserListModel {
  int? status;
  List<UserListDatum>? data;

  AllUserListModel({
     this.status,
     this.data,
  });

  factory AllUserListModel.fromJson(Map<String, dynamic> json) => AllUserListModel(
    status: json["status"],
    data: List<UserListDatum>.from(json["data"].map((x) => UserListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UserListDatum {
  int id;
  String name;
  String mobile;
  String country;
  String email;
  DateTime emailVerifiedAt;
  int donateAmount;
  DateTime createdAt;
  DateTime updatedAt;
  String? usertype;
  String? projectId;
  String? profileImage;

  UserListDatum({
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

  factory UserListDatum.fromJson(Map<String, dynamic> json) => UserListDatum(
    id: json["id"],
    name: json["name"]??"No Data",
    mobile: json["mobile"],
    country: json["country"] ?? "Bangladesh",
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"]??DateTime.now(),
    donateAmount: json["donate_amount"]??"0",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    usertype: json["usertype"],
    projectId: json["project_id"] ?? "0",
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


