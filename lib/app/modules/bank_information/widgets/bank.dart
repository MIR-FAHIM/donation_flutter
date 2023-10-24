import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:latest_payplus_agent/app/modules/bank_information/controllers/bank_information_controller.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/drop_down_search_widget.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';

class BankWidget extends GetWidget<BankInformationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          TextFieldWidget(
            labelText: "Account Holder Name".tr,
            hintText: "Enter Account Holder Name".tr,
            // initialValue: controller.bankAccountHolderName.value,
            onChanged: (input) {
              controller.bankAccountHolderName.value = input;
            },
            validator: (input) =>
                !input!.isEmpty ? "This field is required".tr : null,
            iconData: null,
            imageData: null,
          ),
          TextFieldWidget(
            labelText: "Account No".tr,
            hintText: "Enter Account No".tr,
            keyboardType: TextInputType.number,
            // initialValue: controller.bankAccountNo.value,
            onChanged: (input) {
              controller.bankAccountNo.value = input;
            },
            validator: (input) =>
                !input!.isEmpty ? "This field is required".tr : null,
            iconData: null,
            imageData: null,
          ),
          DropDownWidget(
            labelText: "Bank Name".tr,
            hintText: "Select Bank".tr,
            initialValue: '',
            items: controller.bankList.map((item) => item.bankName!).toList(),
            onChanged: (input) {
              for (var item in controller.bankList) {
                if (item.bankName == input) {
                  controller.selectedBankId.value = item.id.toString();
                }
              }
              print('bank id: ${controller.selectedBankId.value}');
            },
            iconData: null,
          ),
          TextFieldWidget(
            labelText: "Bank Routing No".tr,
            hintText: "Enter Bank Routing No".tr,
            keyboardType: TextInputType.number,
            // initialValue: controller.bankRouting.value,
            onChanged: (input) {
              controller.bankRouting.value = input;
            },
            validator: (input) =>
                !input!.isEmpty ? "This field is required".tr : null,
            iconData: null,
            imageData: null,
          ),
        ],
      );
    });
  }
}
