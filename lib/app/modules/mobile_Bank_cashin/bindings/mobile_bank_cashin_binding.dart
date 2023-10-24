import 'package:get/get.dart';

import '../controllers/mobile_bank_cashin_controller.dart';

class MobileBankCashinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileBankCashinController>(
      () => MobileBankCashinController(),
    );
  }
}
