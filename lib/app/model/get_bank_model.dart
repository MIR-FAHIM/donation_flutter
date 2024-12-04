// To parse this JSON data, do
//
//     final getBankModel = getBankModelFromJson(jsonString);

import 'dart:convert';

GetBankModel getBankModelFromJson(String str) => GetBankModel.fromJson(json.decode(str));

String getBankModelToJson(GetBankModel data) => json.encode(data.toJson());

class GetBankModel {
  String? message;
  List<DatumBank>? data;

  GetBankModel({
     this.message,
     this.data,
  });

  factory GetBankModel.fromJson(Map<String, dynamic> json) => GetBankModel(
    message: json["message"],
    data: List<DatumBank>.from(json["data"].map((x) => DatumBank.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumBank {
  int? id;
  String? bankName;
  String? accountName;
  String? accountNum;
  int? createdBy;
  int? routeNo;
  String? branch;
  int? projectId;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumBank({
     this.id,
     this.bankName,
     this.accountName,
     this.accountNum,
     this.createdBy,
     this.routeNo,
     this.branch,
     this.projectId,
     this.createdAt,
     this.updatedAt,
  });

  factory DatumBank.fromJson(Map<String, dynamic> json) => DatumBank(
    id: json["id"],
    bankName: json["bank_name"],
    accountName: json["account_name"],
    accountNum: json["account_num"].toString(),
    createdBy: json["created_by"],
    routeNo: json["route_no"],
    branch: json["branch"],
    projectId: json["project_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bank_name": bankName,
    "account_name": accountName,
    "account_num": accountNum,
    "created_by": createdBy,
    "route_no": routeNo,
    "branch": branch,
    "project_id": projectId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
