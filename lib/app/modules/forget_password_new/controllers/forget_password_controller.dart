import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:latest_payplus_agent/app/repositories/auth_repositories.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class ForgetPasswordController extends GetxController {
  //TODO: Implement ForgetPasswordController

  final oldPin = ''.obs;
  final newPin = ''.obs;

  late GlobalKey<FormState> pinFormKey;

  final hideOldPin = true.obs;
  final hideNewPIN = true.obs;
  final hideConfirmPIN = true.obs;
  final result = false.obs;

  var startDate = ''.obs;

  var myFormat = DateFormat('dd-MM-yyyy');

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

  DateTime _selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
    }
    startDate.value = "${myFormat.format(_selectedDate)}";
  }

  test() {
    print(startDate.value);
  }

  changePin() async {
    Ui.customLoaderDialog();
    AuthRepository().forgetPassword(newPin.value).then((resp) {
      print(resp);
      // Get.back();
      if (resp['result'] == 'success') {
        Get.showSnackbar(Ui.SuccessSnackBar(
            message: 'New Password has been set'.tr, title: 'Success'.tr));
        // Get.find<AuthService>().removeCurrentUser();
        Get.offAllNamed(Routes.CHECK_PHONE_NUMBER);
        print("Done");
      } else {
        Get.showSnackbar(Ui.ErrorSnackBar(
            message: 'Something Went Wrong', title: 'error'.tr));
        print("not done");
      }
    });
  }
}
