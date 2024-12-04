// To parse this JSON data, do
//
//     final getProjectImagesModel = getProjectImagesModelFromJson(jsonString);

import 'dart:convert';

GetProjectImagesModel getProjectImagesModelFromJson(String str) => GetProjectImagesModel.fromJson(json.decode(str));

String getProjectImagesModelToJson(GetProjectImagesModel data) => json.encode(data.toJson());

class GetProjectImagesModel {
  String? status;
  List<DatumImg>? data;

  GetProjectImagesModel({
     this.status,
     this.data,
  });

  factory GetProjectImagesModel.fromJson(Map<String, dynamic> json) => GetProjectImagesModel(
    status: json["status"],
    data: List<DatumImg>.from(json["data"].map((x) => DatumImg.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumImg {
  int id;
  String projectId;
  String imageUrl;
  String fileName;
  DateTime createdAt;
  DateTime updatedAt;

  DatumImg({
    required this.id,
    required this.projectId,
    required this.imageUrl,
    required this.fileName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DatumImg.fromJson(Map<String, dynamic> json) => DatumImg(
    id: json["id"],
    projectId: json["project_id"],
    imageUrl: json["image_url"],
    fileName: json["file_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_id": projectId,
    "image_url": imageUrl,
    "file_name": fileName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
