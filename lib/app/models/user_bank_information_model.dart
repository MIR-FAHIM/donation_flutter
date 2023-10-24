class UserBankInformationModel {
  int? id;
  int? bankType;
  String? bankName;
  String? accNo;
  String? accName;
  String? routingNo;

  UserBankInformationModel({this.id, this.bankType, this.bankName, this.accNo, this.accName, this.routingNo});

  UserBankInformationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankType = json['bank_type'];
    bankName = json['bank_name'];
    accNo = json['acc_no'];
    accName = json['acc_name'];
    routingNo = json['routing_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_type'] = this.bankType;
    data['bank_name'] = this.bankName;
    data['acc_no'] = this.accNo;
    data['acc_name'] = this.accName;
    data['routing_no'] = this.routingNo;
    return data;
  }
}
