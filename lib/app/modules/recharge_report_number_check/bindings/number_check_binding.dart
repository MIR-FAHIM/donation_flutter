import 'package:get/get.dart';

import '../controllers/number_check_controller.dart';

class NumberCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NumberCheckController>(
      () => NumberCheckController(),
    );
  }
}
