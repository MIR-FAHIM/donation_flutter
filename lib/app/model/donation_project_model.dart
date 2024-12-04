// To parse this JSON data, do
//
//     final donationProjectListModel = donationProjectListModelFromJson(jsonString);

import 'dart:convert';

DonationProjectListModel donationProjectListModelFromJson(String str) => DonationProjectListModel.fromJson(json.decode(str));

String donationProjectListModelToJson(DonationProjectListModel data) => json.encode(data.toJson());

class DonationProjectListModel {
  String? message;
  List<DatumProject>? data;

  DonationProjectListModel({
     this.message,
     this.data,
  });

  factory DonationProjectListModel.fromJson(Map<String, dynamic> json) => DonationProjectListModel(
    message: json["message"],
    data: List<DatumProject>.from(json["data"].map((x) => DatumProject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumProject {
  int? id;
  int? adminId;
  String? projectName;
  String? details;
  String? address;
  dynamic lat;
  dynamic lon;
  String? mobile;
  String? members;
  String? authority;
  String? website;
  String? district;
  dynamic donationRequired;
  dynamic donationRequiredMonth;
  String? email;
  String? image;
  String? motive;
  String? whoGetHelp;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumProject({
     this.id,
     this.adminId,
     this.projectName,
     this.details,
     this.address,
     this.lat,
     this.lon,
     this.mobile,
     this.members,
     this.authority,
     this.website,
     this.district,
     this.donationRequired,
     this.donationRequiredMonth,
     this.email,
     this.image,
     this.whoGetHelp,
     this.motive,
     this.createdAt,
     this.updatedAt,
  });

  factory DatumProject.fromJson(Map<String, dynamic> json) => DatumProject(
    id: json["id"],
    adminId: json["admin_id"],
    projectName: json["project_name"],
    details: json["details"],
    address: json["address"],
    lat: json["lat"],
    lon: json["lon"],
    mobile: json["mobile"],
    members: json["members"],
    authority: json["authority"],
    website: json["website"],
    district: json["district"],
    donationRequired: json["donation_required"],
    donationRequiredMonth: json["donation_required_month"],
    email: json["email"],
    motive: json["motive"],
    whoGetHelp: json["who_get_help"],
    image: json["project_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "project_name": projectName,
    "details": details,
    "address": address,
    "lat": lat,
    "lon": lon,
    "mobile": mobile,
    "members": members,
    "authority": authority,
    "website": website,
    "district": district,
    "motive": motive,
    "who_get_help": whoGetHelp,
    "project_image": image,
    "donation_required": donationRequired,
    "donation_required_month": donationRequiredMonth,
    "email": email,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
