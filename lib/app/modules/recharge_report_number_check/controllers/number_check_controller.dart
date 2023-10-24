import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/recharge_report_model.dart';
import 'package:latest_payplus_agent/app/repositories/recharge_repository.dart';

class NumberCheckController extends GetxController {
  //TODO: Implement NumberCheckController

  final rechargeReport = RechargeReportModel().obs;
  final rechargeReportLoaded = true.obs;

  final number = ''.obs;
  @override
  void onInit() {
    getRechargeReportAll();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getRechargeReport(String number) async {
    rechargeReportLoaded.value = false;
    RechargeRepository().getRechargeReportsSearch(number).then((resp) {
      rechargeReport.value = resp;
      rechargeReportLoaded.value = true;
    });
  }

  getRechargeReportAll() async {
    rechargeReportLoaded.value = false;
    RechargeRepository().getRechargeReports().then((resp) {
      rechargeReport.value = resp;
      rechargeReportLoaded.value = true;
    });
  }
}
