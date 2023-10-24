import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:latest_payplus_agent/app/repositories/registartion_payment_repository.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class RegistrationPaymentController extends GetxController {
  //TODO: Implement AccountSettingController

  final name = ''.obs;
  final mobileNumber = ''.obs;
  final registartionMsg = ''.obs;
  final registartionAmount = ''.obs;
  final paymentUrl = ''.obs;
  final paymentURlLoaded = false.obs;
  final isRegistered = ''.obs;

  final payInfoLoaded = false.obs;
  final isChecked = false.obs;
  final registrationId = ''.obs;

  @override
  Future<void> onInit() async {
    mobileNumber.value = Get.arguments[0];
    registrationId.value = Get.arguments[1].toString();
    //isRegistered.value = Get.arguments['isRegistered'].toString();
    // await registartionInfo();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // registartionInfo() async {
  //   RegistartionPaymentRepository().RegPaymentInfo(mobileNumber.value).then((resp) {
  //     if (resp.result == 'success') {
  //       // if (resp['payment_status'] == 'unpaid') {
  //       //   payInfoLoaded.value = true;
  //       //   registartionMsg.value = resp['registration_information']['message'];
  //       //   registartionAmount.value = resp['registration_information']['payment_amount'].toString();
  //       //   print(resp['registration_information']['message']);
  //       // } else if (resp['payment_status'] == 'paid') {
  //       //   Get.toNamed(Routes.PHONE_VERIFICATION_WTIH_O_T_P, arguments: {'mobileNumber': mobileNumber.value, 'isRegistered': isRegistered.value});
  //       //   // Get.offAllNamed(Routes.SIGNUP, arguments: {
  //       //   //   'mobileNumber': mobileNumber.value,
  //       //   //   'isRegistered': isRegistered.value
  //       //   // });
  //       // }
  //       // Get.back();
  //
  //       // var url = 'https://dl.dropbox.com/s/4d6isp28ffg6ak3/registration.json';
  //
  //       // var response = await get(Uri.parse(url));
  //       // var resp = json.decode(response.body);
  //
  //       // var payment_status = resp['payment_status'];
  //
  //       // if (resp['result'] == 'success') {
  //       //   if (resp['payment_status'] == 'unpaid') {
  //       //     registartionMsg.value = resp['registration_information']['message'];
  //       //     registartionAmount.value =
  //       //         resp['registration_information']['payment_amount'].toString();
  //       //     print(resp['registration_information']['message']);
  //       //   } else if (resp['payment_status'] == 'paid') {
  //       //     Get.offAllNamed(Routes.SIGNUP, arguments: mobileNumber.value);
  //       //   }
  //       // }
  //       // Get.back();
  //       // if (isRegistered.value == '1') {
  //       //   Get.offAllNamed(Routes.LOGIN, arguments: mobileNumber.value);
  //       // } else {
  //       //   // Get.offAllNamed(Routes.SIGNUP, arguments: mobileNumber.value);
  //       //   Get.offAllNamed(Routes.Registration_Payment_View,
  //       //       arguments: mobileNumber.value);
  //
  //     } else {
  //       print("fail");
  //     }
  //   });
  // }

  getRegPaymentUrl() async {
    print(mobileNumber.value);
    print(registartionAmount.value);
    Ui.customLoaderDialog();

    RegistartionPaymentRepository()
        .getPaymentCollectionUrl(
            mobileNumber.value, registartionAmount.value, registrationId.value)
        .then((resp) {
      Get.back();
      if (resp['status'] == 'success') {
        paymentUrl.value = resp['payment_url'];
        paymentURlLoaded.value = true;
        print(paymentUrl.value);

        if (Uri.parse(paymentUrl.value).isAbsolute) {
          var data = {
            "mobileNumber": mobileNumber.value,
            "paymentURL": paymentUrl.value,
            "title": "Registration Payment",
          };
          Get.toNamed(Routes.SIGNUP_WEBVIEW, arguments: data);
        }
      }
    });
  }

  // getAccountData() async {
  //   divisionLoaded.value = false;
  //   AccountSettingRepository().accountInfo().then((resp) {
  //     print(resp);
  //     divisionLoaded.value = true;
  //   });
  // }
}
