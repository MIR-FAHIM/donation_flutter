import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/registration_payment_info_model.dart';
import 'package:latest_payplus_agent/app/models/service_fee_model.dart';
import 'package:latest_payplus_agent/app/repositories/account_setting_repository.dart';
import 'package:latest_payplus_agent/app/repositories/registartion_payment_repository.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class SignupServiceFeeController extends GetxController {
  //TODO: Implement SignupServiceFeeController
  final serviceCharge = ServiceFeeModel().obs;
  final serviceLoaded = false.obs;
  final selectedServiceType = ''.obs;
  final selectedServiceCharge = ''.obs;

  final registrationPaymentInfo = RegistrationPaymentInformationModel().obs;

  final mobileNumber = ''.obs;
  final isRegistered = ''.obs;
  @override
  void onInit() {
    super.onInit();
    mobileNumber.value = Get.arguments['mobileNumber'];
    isRegistered.value = Get.arguments['isRegistered'];
    getServiceFeeList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getServiceFeeList() async {
    // favBillerLoaded.value = false;
    serviceLoaded.value = false;
    AccountSettingRepository().getServiceFee().then((resp) {
      serviceLoaded.value = true;
      serviceCharge.value = resp;
      selectedServiceType.value = resp.servicefeedata!.first.serviceFeeTypeId.toString();
      // userData.value.service_fee_type =
      //     serviceCharge[0].service_fee_type_id!.toString();

      // favBillerLoaded.value = true;
    });
  }

  getRegistrationPaymentInfo() async {
    Ui.customLoaderDialog();
    RegistartionPaymentRepository().RegPaymentInfo(mobileNumber.value, selectedServiceType.value).then((resp) {
      registrationPaymentInfo.value = resp;
      if (registrationPaymentInfo.value.result == 'success') {
        if (registrationPaymentInfo.value.paymentStatus == 'unpaid') {
          Get.back();
          Get.toNamed(Routes.SIGNUP_SERVICE_FEE_CONFIRM, arguments: [
            mobileNumber.value,
            registrationPaymentInfo.value,
            selectedServiceCharge.value,
            selectedServiceType.value,
          ]);
          // Get.offAllNamed(Routes.Registration_Payment_View,
          //     arguments: [mobileNumber.value,  registrationPaymentInfo.value.registrationInformation]);
        } else if (registrationPaymentInfo.value.paymentStatus == 'paid') {
          Get.back();
          Get.offAllNamed(Routes.SIGNUP, arguments: [
            mobileNumber.value,
            selectedServiceType.value,
          ]);
          // Get.offAllNamed(Routes.PHONE_VERIFICATION_WTIH_O_T_P, arguments: {
          //   'mobileNumber': mobileNumber.value,
          //   'isRegistered': '0',
          //   'registrationInfo': registrationPaymentInfo.value,
          //   'selectedServiceType': selectedServiceCharge.value,
          //   'selectedServiceTypeId': selectedServiceType.value,
          // });
        }
      } else {
        Get.back();
        //Get.offAllNamed(Routes.SIGNUP_SERVICE_FEE_CONFIRM, arguments: mobileNumber.value);
      }
    });
  }
}
