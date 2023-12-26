import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/inbox/controllers/transactionController.dart';

import '../controllers/inbox_controller.dart';

class InboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxController>(
      () => InboxController(),
    );
  }
}


class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
          () => TransactionController(),
    );
  }
}