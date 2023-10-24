import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/transaction_verify_payment.dart';
import 'package:latest_payplus_agent/app/repositories/balance_check_repository.dart';
import 'package:latest_payplus_agent/common/ui.dart';
import 'package:flutter/material.dart';

class TransactionChargeController extends GetxController {
  //TODO: Implement TransactionChargeController

  final transactionVerifyPayment = <TransactionVerifyPaymentModel>[].obs;
  final transactionVerifyLoaded = false.obs;
  late GlobalKey<FormState> formKey;
  final selectedMethod = TransactionVerifyPaymentModel().obs;
  final txrid = ''.obs;
  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    getPaymentList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPaymentList() async {
    BalanceCheckRepository().getTransactionPaymentMethods().then((resp) {
      transactionVerifyPayment.value = resp;
      selectedMethod.value = resp.first;
      transactionVerifyLoaded.value = true;
    });
  }

  verifyTransaction() async {
    if (formKey.currentState!.validate()) {
      Get.focusScope!.unfocus();
      formKey.currentState!.save();
      Ui.customLoaderDialog();
      BalanceCheckRepository()
          .transactionVerify(selectedMethod.value.name ?? '', txrid.value)
          .then((resp) {
        Get.back();
        if (resp['result'] == 'success') {
          Get.showSnackbar(
              Ui.SuccessSnackBar(message: resp['message'], title: 'Success'.tr));
        } else {
          Get.showSnackbar(Ui.ErrorSnackBar(message: resp['message'], title: 'Error'.tr));
        }
      });
    }
  }
}
