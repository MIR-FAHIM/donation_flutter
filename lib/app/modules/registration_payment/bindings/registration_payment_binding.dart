import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/registration_payment/controllers/registration_payment_controller.dart';

class RegistrationPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationPaymentController>(
      () => RegistrationPaymentController(),
    );
  }
}
