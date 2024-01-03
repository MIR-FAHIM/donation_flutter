import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/billpayhistorymodel.dart';
import 'package:latest_payplus_agent/app/repositories/bill_pay_report_repo.dart';

class BillpayReportController extends GetxController {
  //TODO: Implement BillpayReportController
  final billReport = BillPayHistory().obs;
  final billReportLoaded = false.obs;
  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getBillHistory({String? dateTo, String?dateFrom, bool? fromNoti}) async {
    BillPayReportRepo().getBillHistory(dateTo: fromNoti == false ? "0" : dateTo!, dateFrom: fromNoti == false ? "0" :dateFrom!,  ).then((resp) {
      billReport.value = resp;
      billReportLoaded.value = true;
    });
  }
}
