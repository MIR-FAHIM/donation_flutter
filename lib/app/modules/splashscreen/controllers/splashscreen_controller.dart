import 'dart:async';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';
import 'package:latest_payplus_agent/main.dart';

import '../../Auth/signup/controllers/signup_controller.dart';
import '../../package/controller/package_list_controller.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;

  @override
  Future<void> onInit() async {

    Get.lazyPut<SignupController>(
          () => SignupController(),
    );
    Get.lazyPut<PackageController>(
          () => PackageController(),
    );
   // getPackageName();
    Timer(const Duration(seconds: 3), () {

      //Get.find<PackageController>().currentPackageModel.value.data!.packageName;
      if (Get.find<AuthService>().used.value) {
        if (Get.find<AuthService>().isAuth) {
          print('SplashscreenController.onInit:$type');
          Get.offAllNamed(Routes.ROOT, arguments: type);
        } else {
          Get.offAllNamed(Routes.CHECK_PHONE_NUMBER);
        }
      } else {
        Get.offAllNamed(Routes.WELCOME);
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getPackageName(){


      return Get.find<PackageController>().currentPackageModel.value.data!.packageName;




  }
}
