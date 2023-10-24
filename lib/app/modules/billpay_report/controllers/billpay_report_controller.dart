import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/billpayhistorymodel.dart';
import 'package:latest_payplus_agent/app/repositories/bill_pay_report_repo.dart';

class BillpayReportController extends GetxController {
  //TODO: Implement BillpayReportController
  final billReport = BillPayHistory().obs;
  final billReportLoaded = false.obs;
  @override
  void onInit() {
    getBillHistory();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getBillHistory() async {
    BillPayReportRepo().getBillHistory().then((resp) {
      billReport.value = resp;
      billReportLoaded.value = true;
    });
  }
}
