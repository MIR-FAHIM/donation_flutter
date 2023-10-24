import 'package:get/get.dart';

import '../controllers/mobile_bank_cashout_controller.dart';

class MobileBankCashoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileBankCashoutController>(
      () => MobileBankCashoutController(),
    );
  }
}
