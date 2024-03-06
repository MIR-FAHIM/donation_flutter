import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latest_payplus_agent/app/models/bank_model.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/controllers/withdraw_controller.dart';
import 'package:latest_payplus_agent/app/repositories/bank_info_repo.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class BankInformationController extends GetxController {
  //TODO: Implement BankInformationController

  final bankList = <BankModel>[].obs;
  final bankListLoaded = false.obs;
  final selectedBankId = ''.obs;
  final bankAccountController = TextEditingController().obs;

  final accountNoController = TextEditingController().obs;

  final routingController = TextEditingController().obs;
  final bankAccountHolderName = ''.obs;
  final bankAccountNo = ''.obs;
  final bankRouting = ''.obs;

  final paymentMethod = 'Bank'.obs;
  final mobileBank = ''.obs;

  late FocusNode accountNameFocus;
  late FocusNode accountNoFocus;
  late FocusNode routingFocus;

  @override
  void onInit() {
    getBankList();
    accountNameFocus = FocusNode();
    accountNoFocus = FocusNode();
    routingFocus = FocusNode();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    accountNameFocus.dispose();
    accountNoFocus.dispose();
    routingFocus.dispose();

    super.dispose();
  }

  Future getBankList() async {
    BankInfoRepository().getBankList().then((resp) {
      bankList.value = resp;
      selectedBankId.value = bankList[0].id!.toString();
      bankListLoaded.value = true;
    });
  }

  Future saveBankDetails() async {
    Get.focusScope!.unfocus();
    Ui.customLoaderDialog();
    BankInfoRepository()
        .saveBankInfo(selectedBankId.value, bankAccountHolderName.value,
            bankAccountNo.value, bankRouting.value)
        .then((resp) {
      Get.back();
      // refresh();
      if (resp['result'] == 'success') {
        buildSuccessDialog();
      } else {
        Get.showSnackbar(
            Ui.ErrorSnackBar(message: resp['message'], title: 'Error'.tr));
      }
    });
  }

  Future deleteBankDetails(String selectAcccountId) async {
    Get.focusScope!.unfocus();
    Ui.customLoaderDialog();
    BankInfoRepository()
        .deleteBankInfo(selectAcccountId.toString())
        .then((resp) {
      Get.back();
      if (resp['result'] == 'success') {
        Get.find<WithdrawController>().getUserBankInfo();
        buildSuccessDialog();
      } else {
        Get.showSnackbar(
            Ui.ErrorSnackBar(message: resp['message'], title: 'Error'.tr));
      }
    });
  }

  Future editBankDetails(
      {String? selectAcccountId,
      String? accountName,
      String? accRouting,
      String? accNo}) async {
    Get.focusScope!.unfocus();
    Ui.customLoaderDialog();
    BankInfoRepository()
        .editBankInfo(
            selectAcccountId.toString(), accountName!, accNo!, accRouting!)
        .then((resp) {
      Get.back();
      print("bank update response is ${resp['result']}");
      if (resp['result'] == 'success') {
        Get.find<WithdrawController>().getUserBankInfo();
        buildSuccessDialog();
      } else {
        Get.showSnackbar(
            Ui.ErrorSnackBar(message: resp['message'], title: 'Error'.tr));
      }
    });
  }

  buildSuccessDialog() {
    return Get.defaultDialog(
        title: '',
        titlePadding: EdgeInsets.only(left: 20, right: 20),
        contentPadding: EdgeInsets.all(10),
        radius: 8,
        content: Container(
          width: Get.size.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Bank info success'.tr,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF652981),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.find<WithdrawController>().getUserBankInfo();
              Get.offNamed(Routes.WITHDRAW);
            },
            child: Container(
              decoration:
                  Ui.getBoxDecoration(color: Color(0xFF652981), radius: 8),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 5, bottom: 5),
                child: Center(
                  child: Text(
                    'Okay'.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ]);
  }

  @override
  void refresh() {
    // TODO: implement refresh

    selectedBankId.value = '';
    selectedBankId.update((val) {});

    bankAccountHolderName.value = '';
    bankAccountHolderName.update((val) {});
    bankAccountNo.value = '';
    bankAccountNo.update((val) {});

    bankRouting.value = '';
    bankRouting.update((val) {});

    super.refresh();
  }
}
