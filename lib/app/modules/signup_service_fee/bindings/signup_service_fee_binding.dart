import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/services/location_service.dart';

import '../controllers/signup_service_fee_controller.dart';

class SignupServiceFeeBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<SignupServiceFeeController>(
      () => SignupServiceFeeController(),
    );
  }
}
