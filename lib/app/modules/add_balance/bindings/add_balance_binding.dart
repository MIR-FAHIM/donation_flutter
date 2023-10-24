import 'package:get/get.dart';

import '../controllers/add_balance_controller.dart';

class AddBalanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddbalanceController>(
      () => AddbalanceController(),
    );
  }
}
