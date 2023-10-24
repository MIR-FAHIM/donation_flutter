import 'package:get/get.dart';

import '../controllers/check_phone_number_controller.dart';

class CheckPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckPhoneNumberController>(
      () => CheckPhoneNumberController(),
    );
  }
}
