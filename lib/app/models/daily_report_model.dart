class DailyReportModel {
  String? customer_name;
  String? mobile_no;
  String? opening_balance;
  String? receive_balance;
  String? online_receive_balance;
  String? recharge_amount;
  String? commission;
  String? otf;
  String? bill_pay_amount;
  String? bill_pay_commission;
  String? daily_charge;
  String? closing_balance;
  String? ticketPurchase;
  String? packagePurchase;

  DailyReportModel({
    this.customer_name,
    this.mobile_no,
    this.opening_balance,
    this.receive_balance,
    this.online_receive_balance,
    this.recharge_amount,
    this.commission,
    this.otf,
    this.bill_pay_amount,
    this.bill_pay_commission,
    this.daily_charge,
    this.closing_balance,
    this.packagePurchase,
    this.ticketPurchase
  });

  DailyReportModel.fromJson(Map<String, dynamic> json) {
    customer_name = json['customer_name'];
    mobile_no = json['mobile_no'];
    opening_balance = json['opening_balance'];
    receive_balance = json['receive_balance'];
    online_receive_balance = json['online_receive_balance'];
    recharge_amount = json['recharge_amount'];
    commission = json['commission'];
    otf = json['otf'];
    bill_pay_amount = json['bill_pay_amount'];
    bill_pay_commission = json['bill_pay_commission'];
    daily_charge = json['daily_charge'];
    closing_balance = json['closing_balance'];
    packagePurchase = json['package_purchase'];
    ticketPurchase = json['ticket_purchase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customer_name;
    data['mobile_no'] = this.mobile_no;
    data['opening_balance'] = this.opening_balance;
    data['receive_balance'] = this.receive_balance;
    data['online_receive_balance'] = this.online_receive_balance;
    data['recharge_amount'] = this.recharge_amount;
    data['commission'] = this.commission;
    data['otf'] = this.otf;
    data['bill_pay_amount'] = this.bill_pay_amount;
    data['bill_pay_commission'] = this.bill_pay_commission;
    data['daily_charge'] = this.daily_charge;
    data['closing_balance'] = this.closing_balance;
    data['package_purchase'] = this.packagePurchase;
    data['ticket_purchase'] = this.ticketPurchase;

    return data;
  }
}
