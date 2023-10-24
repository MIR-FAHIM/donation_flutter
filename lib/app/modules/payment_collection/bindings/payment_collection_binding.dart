import 'package:get/get.dart';

import '../controllers/payment_collection_controller.dart';

class PaymentCollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentCollectionController>(
      () => PaymentCollectionController(),
    );
  }
}
