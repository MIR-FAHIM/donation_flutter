// To parse this JSON data, do
//
//     final allDonationModel = allDonationModelFromJson(jsonString);

import 'dart:convert';

AllDonationModel allDonationModelFromJson(String str) => AllDonationModel.fromJson(json.decode(str));

String allDonationModelToJson(AllDonationModel data) => json.encode(data.toJson());

class AllDonationModel {
  int? status;
  String? message;
  List<Transaction>? transactions;

  AllDonationModel({
     this.status,
     this.message,
     this.transactions,
  });

  factory AllDonationModel.fromJson(Map<String, dynamic> json) => AllDonationModel(
    status: json["status"],
    message: json["message"],
    transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "transactions": List<dynamic>.from(transactions!.map((x) => x.toJson())),
  };
}

class Transaction {
  int id;
  String bankName;
  String accountName;
  String accountNum;
  int status;
  int userId;
  String userName;
  int projectId;
  int amount;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;

  Transaction({
    required this.id,
    required this.bankName,
    required this.accountName,
    required this.accountNum,
    required this.userId,
    required this.userName,
    required this.status,
    required this.projectId,
    required this.amount,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    bankName: json["bank_name"],
    accountName: json["account_name"],
    accountNum: json["account_num"].toString(),
    userId: json["user_id"],
    status: json["status"],
    userName: json["user_name"],
    projectId: json["project_id"],
    amount: json["amount"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bank_name": bankName,
    "account_name": accountName,
    "account_num": accountNum,
    "user_id": userId,
    "user_name": userName,
    "project_id": projectId,
    "amount": amount,
    "status": status,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum AccountName {
  FATEMA,
  SIFAT
}

final accountNameValues = EnumValues({
  "fatema": AccountName.FATEMA,
  "sifat": AccountName.SIFAT
});

enum BankName {
  BKASH,
  DHAKA_BANK,
  JAMUNA
}

final bankNameValues = EnumValues({
  "bkash": BankName.BKASH,
  "dhaka bank": BankName.DHAKA_BANK,
  "jamuna": BankName.JAMUNA
});

enum UserName {
  FAHIM,
  SIFAT,
  SONCHOI
}

final userNameValues = EnumValues({
  "fahim": UserName.FAHIM,
  "sifat": UserName.SIFAT,
  "sonchoi": UserName.SONCHOI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
