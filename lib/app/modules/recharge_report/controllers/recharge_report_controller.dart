import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/recharge_report_model.dart';
import 'package:latest_payplus_agent/app/repositories/recharge_repository.dart';

class RechargeReportController extends GetxController {
  //TODO: Implement RechargeReportController

  final rechargeReport = RechargeReportModel().obs;
  final rechargeReportLoaded = false.obs;
  @override
  void onInit() {
    getRechargeReport();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getRechargeReport() async {
    RechargeRepository().getRechargeReports().then((resp) {
      rechargeReport.value = resp;
      rechargeReportLoaded.value = true;
    });
  }
}
