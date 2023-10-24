import 'package:get/get.dart';

import '../controllers/billpay_report_controller.dart';

class BillpayReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillpayReportController>(
      () => BillpayReportController(),
    );
  }
}
