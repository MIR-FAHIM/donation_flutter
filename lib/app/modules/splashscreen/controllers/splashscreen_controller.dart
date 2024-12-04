import 'dart:async';

import 'package:device_information/device_information.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;

  @override
  Future<void> onInit() async {
    print('called');


    Timer(Duration(seconds: 3), () {

        if (Get.find<AuthService>().currentUser.value.user == null) {
          Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.offAllNamed(Routes.HOME);
        }

    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
