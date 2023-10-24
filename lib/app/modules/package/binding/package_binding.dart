import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/package/controller/package_list_controller.dart';



class PackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PackageController>(
          () => PackageController(),
    );
  }
}
