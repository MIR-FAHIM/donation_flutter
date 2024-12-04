// To parse this JSON data, do
//
//     final projectActivityModel = projectActivityModelFromJson(jsonString);

import 'dart:convert';

ProjectActivityModel projectActivityModelFromJson(String str) => ProjectActivityModel.fromJson(json.decode(str));

String projectActivityModelToJson(ProjectActivityModel data) => json.encode(data.toJson());

class ProjectActivityModel {
  String? message;
  List<ActivityDatum>? data;

  ProjectActivityModel({
     this.message,
     this.data,
  });

  factory ProjectActivityModel.fromJson(Map<String, dynamic> json) => ProjectActivityModel(
    message: json["message"],
    data: List<ActivityDatum>.from(json["data"].map((x) => ActivityDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ActivityDatum {
  int id;
  String projectName;
  String projectId;
  String title;
  String details;
  String cost;
  String activityImage;
  DateTime createdAt;
  DateTime updatedAt;

  ActivityDatum({
    required this.id,
    required this.projectName,
    required this.projectId,
    required this.title,
    required this.details,
    required this.cost,
    required this.activityImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ActivityDatum.fromJson(Map<String, dynamic> json) => ActivityDatum(
    id: json["id"],
    projectName: json["project_name"],
    projectId: json["project_id"],
    title: json["title"],
    details: json["details"],
    cost: json["cost"],
    activityImage: json["activity_image"] ?? "No Data",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_name": projectName,
    "project_id": projectId,
    "title": title,
    "details": details,
    "cost": cost,
    "activity_image": activityImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
