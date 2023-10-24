import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latest_payplus_agent/app/models/user_bank_information_model.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/views/successful_view.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/views/withdraw_amount.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/widgets/bankSelectWidget.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/widgets/banks_widget.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/widgets/mobile_banking_widget.dart';
import 'package:latest_payplus_agent/app/repositories/bank_info_repo.dart';
import 'package:latest_payplus_agent/app/repositories/withdraw_repository.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class WithdrawController extends GetxController {
  //TODO: Implement WithdrawController

  final selectedIndex = 0.obs;
  final bodyPageIndex = 0.obs;
  final userBankInformation = <UserBankInformationModel>[].obs;
  final userBankInfoLoaded = false.obs;
  final page = [BanksWidget(), MobileBanksWidget()].obs;

  final selectedBankInfo = UserBankInformationModel().obs;

  late TextEditingController withdrawController;
  late FocusNode withdrawFocusFocus;

  final bodyWidget =
      [BankSelectWidget(), WithdrawAmount(), WithdrawSuccessView()].obs;
  @override
  Future<void> onInit() async {
    withdrawController = TextEditingController();
    withdrawFocusFocus = FocusNode();
    await getUserBankInfo();
    super.onInit();
  }

  Future getUserBankInfo() async {
    BankInfoRepository().getBankInfo().then((resp) {
      userBankInformation.value = resp;
      userBankInfoLoaded.value = true;
    });
  }

  Future withdrawMoney() async {
    Ui.customLoaderDialog();
    WithdrawRepository()
        .withdrawMoney(
            selectedBankInfo.value.id!.toString(), withdrawController.text)
        .then((resp) {
      Get.back();
      if (resp['result'] == 'success') {
        Get.toNamed(Routes.WITHDRAW_SUCCESS);
      }
    });
  }

  @override
  void refresh() {
    // TODO: implement refresh
    withdrawController.clear();
    super.refresh();
  }
}
