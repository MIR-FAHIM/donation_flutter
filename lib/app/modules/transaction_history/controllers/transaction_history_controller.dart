import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/transaction_report_model.dart';
import 'package:latest_payplus_agent/app/repositories/notification_repository.dart';

class TransactionHistoryController extends GetxController {
  //TODO: Implement TransactionHistoryController

  final count = 0.obs;
  final transactionReport = <TransactionReportModel>[].obs;
  final transactionReportLoaded = false.obs;
  @override
  void onInit() {

    // getTransactionReport();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getTransactionReport({String type = '14'}) async {
    transactionReportLoaded.value = false;
    NotificationRepository().gettransactionReport(type: type).then((resp) {
      transactionReport.value = resp;
      transactionReportLoaded.value = true;
    });
  }
}
