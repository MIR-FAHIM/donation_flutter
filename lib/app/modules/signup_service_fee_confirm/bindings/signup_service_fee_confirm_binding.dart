import 'package:get/get.dart';

import '../controllers/signup_service_fee_confirm_controller.dart';

class SignupServiceFeeConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupServiceFeeConfirmController>(
      () => SignupServiceFeeConfirmController(),
    );
  }
}
