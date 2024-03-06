import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latest_payplus_agent/app/models/add_balance_model/mfs_list_model.dart';
import 'package:latest_payplus_agent/app/models/user_bank_information_model.dart';
import 'package:latest_payplus_agent/app/modules/bank_information/controllers/bank_information_controller.dart';
import 'package:latest_payplus_agent/app/modules/home/controllers/home_controller.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/views/successful_view.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/views/withdraw_amount.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/widgets/bankSelectWidget.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/widgets/banks_widget.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/widgets/mobile_banking_widget.dart';
import 'package:latest_payplus_agent/app/repositories/bank_info_repo.dart';
import 'package:latest_payplus_agent/app/repositories/withdraw_repository.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class WithdrawController extends GetxController {
  //TODO: Implement WithdrawController
  final gateWay = ''.obs;
  final selectedIndex = 0.obs;
  final contactListClicked = false.obs;
  final searchString = "".obs;
  final bodyPageIndex = 0.obs;
  final number_type = 'Prepaid'.obs;
  final amountOfferFound = false.obs;
  final imageUrl = ''.obs;
  final userBankInformation = <UserBankInformationModel>[].obs;
  final userBankInfoLoaded = false.obs;
  final page = [BanksWidget(), MobileBanksWidget()].obs;
  final contactsResult = <Contact>[].obs;
  final selectedBankInfo = UserBankInformationModel().obs;
  final currentTabIndex = 0.obs;

  final mobileNumber = ''.obs;
  final count = 1.obs;
  final pinFocusFocus = FocusNode().obs;
  final alphabetFoundList = [].obs;
  final addNumberWidgets = [].obs;
  final keyboardText = ''.obs;
  final pinNumber = ''.obs;
  final simOperator = ''.obs;
  final simOperatorLogo = ''.obs;
  final keyboardType = ''.obs;
  final searchStart = false.obs;
  final contactLoad = false.obs;
  final paymentTypesMFS = <MFSListModel>[].obs;

  final amount = ''.obs;

  final withdrawController = TextEditingController().obs;
  final pinController = TextEditingController().obs;
  final numberController = TextEditingController().obs;
  final amountController = TextEditingController().obs;
  TextEditingController searchController = TextEditingController();



  late FocusNode withdrawFocusFocus;

  final bodyWidget =
      [BankSelectWidget(), WithdrawAmount(), WithdrawSuccessView()].obs;
  @override
  Future<void> onInit() async {

    withdrawFocusFocus = FocusNode();
    await getUserBankInfo();
    super.onInit();
  }
  showPopup(String? id) {

    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            title: Text('Are yuu sure you want to remove your bank information? '),
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){

                      Get.put(BankInformationController());
                      Get.find<BankInformationController>().deleteBankDetails(id!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      height: Get.height*.06,
                      width: Get.width*.2,

                      child: Center(child: Text("Yes", style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(.6),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      height: Get.height*.06,
                      width: Get.width*.2,

                      child: Center(child: Text("No", style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ],
              ),
            )
          // actions: <Widget>[

          // ],
        );
      },
    );
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
            selectedBankInfo.value.id!.toString(), withdrawController.value.text, pinController.value.text)
        .then((resp) {
      Get.back();
      if (resp['result'] == 'success') {
        withdrawController.value.clear();
        pinController.value.clear();
        Get.offNamed(Routes.WITHDRAW_SUCCESS,);
        Get.find<HomeController>().getBalance();
      } else {
        Get.offNamed(Routes.MBANKINGFAIL, arguments: [resp['message']]);
      }
    });
  }

  @override
  void refresh() {
    // TODO: implement refresh
    withdrawController.value.clear();
    super.refresh();
  }
}
