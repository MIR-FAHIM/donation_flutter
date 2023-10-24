import 'package:get/get.dart';

import '../controllers/mobile_banking_controller.dart';

class MobileBankingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileBankingController>(
      () => MobileBankingController(),
    );
  }
}
