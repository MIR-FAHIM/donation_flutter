import 'package:get/get.dart';

import '../controllers/mobile_bank_transaction_history_controller.dart';

class MobileBankTransactionHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileBankTransactionHistoryController>(
      () => MobileBankTransactionHistoryController(),
    );
  }
}
