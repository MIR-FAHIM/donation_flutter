import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/mobile_bank_tran_history.dart';
import 'package:latest_payplus_agent/app/modules/mobile_banking/controllers/mobile_banking_controller.dart';
import 'package:latest_payplus_agent/app/repositories/mobile_banking_repository.dart';

class MobileBankTransactionHistoryController extends GetxController {
  //TODO: Implement MobileBankTransactionHistoryController

  final history = MobileBankTransactionHistoryModel().obs;
  final historyLoaded = false.obs;
  final logo = "".obs;
  final searchString = "".obs;
  final searchController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getHistory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  String mfsCheckLogo(String name) {
    print("mfs name is $name");


    for (var item in Get.find<MobileBankingController>().paymentTypesMFS) {
      print("my logo is ${item.logo}");

        if (name == item.name) {
          logo.value = item.logo!;
        }

    }
    return logo.value;
  }
  void setSearchText(String text) {
    searchString.value = text;
  }
  List<DataHis> get filteredHistory {
    return history.value.data!.where((e) {

      final number =  e.number.toString();
      final searchTerm = searchString.value;

        return number.contains(searchTerm);

    }).toList();
  }
  getHistory() async {
    MobileBankingRepository().getMobileBankHistory().then((response) {
      print('MobileBankTransactionHistoryController.getHistory:${response.result}');
      if (response.result == 'success') {
        history.value = response;
      } else {}
      historyLoaded.value = true;
    });
  }
}
