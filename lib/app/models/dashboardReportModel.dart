class DahsboardReportModel {
  String? result;
  var paymentCollection;
  var rechargeAmount;
  var billPayment;
  var mbanking;

  DahsboardReportModel(
      {this.result,
      this.paymentCollection = 0,
      this.rechargeAmount = 0,
      this.billPayment = 0,
      this.mbanking = 0});

  DahsboardReportModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    paymentCollection = json['payment_collection'] ?? '0';
    rechargeAmount = json['recharge_amount'] ?? '0';
    billPayment = json['bill_payment'] ?? '0';
    mbanking = json['mbanking'] ?? '0';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['payment_collection'] = this.paymentCollection;
    data['recharge_amount'] = this.rechargeAmount;
    data['bill_payment'] = this.billPayment;
    data['mbanking'] = this.mbanking;
    return data;
  }
}
