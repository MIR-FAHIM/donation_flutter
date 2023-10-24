import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/bill_payment/views/akash/controller/controller.dart';



class AkashBillPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AkashBillPaymentController>(
          () => AkashBillPaymentController(),
    );
  }
}
