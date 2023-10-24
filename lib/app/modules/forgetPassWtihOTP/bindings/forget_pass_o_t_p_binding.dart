import 'package:get/get.dart';

import '../controllers/forget_pass_wtih_o_t_p_controller.dart';

class ForgetPassWtihOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPassWtihOTPController>(
      () => ForgetPassWtihOTPController(),
    );
  }
}
