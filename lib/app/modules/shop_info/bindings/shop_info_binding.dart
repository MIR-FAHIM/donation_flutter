import 'package:get/get.dart';

import '../controllers/shop_info_controller.dart';

class ShopInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopInfoController>(
      () => ShopInfoController(),
    );
  }
}
