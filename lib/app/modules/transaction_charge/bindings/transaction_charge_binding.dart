import 'package:get/get.dart';

import '../controllers/transaction_charge_controller.dart';

class TransactionChargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionChargeController>(
      () => TransactionChargeController(),
    );
  }
}
