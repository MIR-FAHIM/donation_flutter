import 'package:donation_flutter/app/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:device_information/device_information.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:donation_flutter/app/services/firebase_messaging_service.dart';
import 'package:donation_flutter/app/services/location_service.dart';
import 'package:donation_flutter/common/ui.dart';
import 'package:donation_flutter/service/shared_pref.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final codeController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final fullName = TextEditingController().obs;
  final mobileController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final mobileNumber = ''.obs;
  var regisFormKey = GlobalKey<FormState>().obs;
  final imeiNumber = ''.obs;
  final password = ''.obs;
  final deviceToken = ''.obs;
  final hidePassword = true.obs;
  final loginTime = DateTime.now().obs;

  late GlobalKey<FormState> loginFormKey;
  @override
  void onInit() {
    mobileNumber.value = Get.arguments ?? '';
    loginFormKey = GlobalKey<FormState>();
    imeiNumber.value = Get.find<LocationService>().imei.value;
    askingPhonePermission();
    // getDeviceInfo();
    //printSimCardsData();
    // sendUssdRequest();

    super.onInit();
  }

  Future<String> askingPhonePermission() async {
    final PermissionStatus permissionStatus = await _getPhonePermission();
    return permissionStatus.name;
  }

  Future<PermissionStatus> _getPhonePermission() async {
    final PermissionStatus permission = await Permission.phone.status;
    print(
        "kaj ekhane hocche location service permissioon status  ${Permission.phone.status.isGranted}");

    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.phone].request();
      return permissionStatus[Permission.phone] ?? PermissionStatus.restricted;
    } else {
      print("device info is coming from login controller");
      getDeviceInfo();

      return permission;
    }
  }

  loginController(){
   AuthRepository().userLogin(emailController.value.text, password.value).then((value) {
    //  AuthRepository().userLogin("ridoyfahim92@gmail.com", "123456").then((value) {

        if(value.status == 200){
        Get.find<AuthService>().setUser(value);
        Get.find<AuthService>().setFirstLoggedOrNot();

        Get.toNamed(Routes.HOME);

      }else{
        Get.showSnackbar(Ui.ErrorSnackBar(
            message:
            'Something went wrong'.tr,
            title: 'Error'.tr));
      }
    });
  }

  registerController(){
    Map data = {
    'name' : fullName.value.text,
    'email' : emailController.value.text,
    'mobile' : mobileController.value.text,
    'donate_amount' : '0',
      "usertype" : "user",
      "project_id" : "0",

    'password' : codeController.value.text,
    'country' : countryController.value.text,
    };
    AuthRepository().userRegister(data).then((value) {
      if(value['status'] == 200){
        Get.toNamed(Routes.LOGIN);

      }else{
        Get.showSnackbar(Ui.ErrorSnackBar(
            message:
            'Something went wrong'.tr,
            title: 'Error'.tr));
      }
    });
  }

  getDeviceInfo() async {
    try {
      String platformVersion = await DeviceInformation.platformVersion;
      imeiNumber.value = await DeviceInformation.deviceIMEINumber;

      print("hlw bro imie${imeiNumber.value}");
    } on PlatformException {
      print('Failed to get platform version.');
    }
  }



  // void printSimCardsData() async {
  //   try {
  //     SimData simData = await SimDataPlugin.getSimData();
  //     for (var s in simData.cards) {
  //       print('Serial number: ${s.serialNumber}');
  //       print('Serial number: ${s.subscriptionId}');
  //       print('Serial number: ${s.carrierName}');
  //     }
  //   } on PlatformException catch (e) {
  //     print("error! code: ${e.code} - message: ${e.message}");
  //   }
  // }

  // makeMyRequest() async {
  //   int subscriptionId = 2; // sim card subscription ID
  //   String code = "*2#"; // ussd code payload
  //   try {
  //     String ussdResponseMessage = await UssdService.makeRequest(
  //       subscriptionId,
  //       code,
  //       Duration(seconds: 10), // timeout (optional) - default is 10 seconds
  //     );
  //     print("succes! message: $ussdResponseMessage");
  //   } catch (e) {
  //     debugPrint("error! code: ${e} - message: ${e}");
  //   }
  // }

  // Future<void> sendUssdRequest() async {
  //   String _requestCode = "*2#";
  //   String _responseCode = "";
  //   String _responseMessage = "";
  //   try {
  //     String responseMessage;
  //     await Permission.phone.request();
  //     if (!await Permission.phone.isGranted) {
  //       throw Exception("permission missing");
  //     }

  //     SimData simData = await SimDataPlugin.getSimData();
  //     for (var s in simData.cards) {
  //       print('Serial number: ${s.serialNumber}');
  //       print('Serial number: ${s.subscriptionId}');
  //       print('Serial number: ${s.carrierName}');
  //       responseMessage =
  //           await UssdService.makeRequest(s.subscriptionId, '*2#');

  //       print('ussd: ${responseMessage}');
  //       _responseMessage = responseMessage;
  //     }
  //   } on PlatformException catch (e) {
  //     _responseCode = e is PlatformException ? e.code : "";
  //     _responseMessage = e.message ?? '';
  //   }
  // }
}

