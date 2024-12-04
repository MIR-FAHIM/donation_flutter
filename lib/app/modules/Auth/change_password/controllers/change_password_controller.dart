import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:donation_flutter/common/ui.dart';

class ChangePasswordController extends GetxController {
  //TODO: Implement ChangePasswordController

  final oldPin = ''.obs;
  final newPin = ''.obs;
  late GlobalKey<FormState> pinFormKey;

  final hideOldPin = true.obs;
  final hideNewPIN = true.obs;
  final hideConfirmPIN = true.obs;
  final result = false.obs;

  @override
  Future<void> onInit() async {
    pinFormKey = GlobalKey<FormState>();
    print(await FirebaseMessaging.instance.getToken());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }


}
