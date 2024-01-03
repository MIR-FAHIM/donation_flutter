import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/recharge_report_model.dart';
import 'package:latest_payplus_agent/app/repositories/recharge_repository.dart';

class RechargeReportController extends GetxController {
  //TODO: Implement RechargeReportController

  final rechargeReport = RechargeReportModel().obs;
  final rechargeReportLoaded = false.obs;
  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getRechargeReport({bool? fromNotiFi, String? dateFil}) async {
    RechargeRepository().getRechargeReports(fromNotiFi == true ? dateFil! : "all").then((resp) {
      rechargeReport.value = resp;
      rechargeReportLoaded.value = true;
    });

  }
}
