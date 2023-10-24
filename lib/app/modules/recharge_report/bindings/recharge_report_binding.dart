import 'package:get/get.dart';

import '../controllers/recharge_report_controller.dart';

class RechargeReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RechargeReportController>(
      () => RechargeReportController(),
    );
  }
}
