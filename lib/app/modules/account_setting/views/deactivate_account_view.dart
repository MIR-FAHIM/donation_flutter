import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/account_setting/controllers/account_setting_controller.dart';
import 'package:latest_payplus_agent/app/modules/account_setting/views/widgets/confirm_dialog.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class DeActivateAccountView extends GetView<AccountSettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Account Deactivate'.tr),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.25,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage('assets/images/delete_account.png'),
                      fit: BoxFit.contain,
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "If the account is deactivated, you will not be able to make any more transactions. The account can be activated subject to the process prescribed by the company and payment of fees."
                      .tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Checkbox(
                      value: controller.isChecked.value,
                      onChanged: (value) {
                        controller.isChecked.value = value!;
                      },
                    ),
                    Container(
                      width: Get.width * 0.78,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'I want to deactivate my account by agreed the terms and condition'
                              .tr,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ).paddingSymmetric(vertical: 5, horizontal: 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  if (controller.isChecked.value) {
                    Get.dialog(ConfirmDialog());
                    // controller.getRegPaymentUrl();
                  } else {
                    Get.showSnackbar(Ui.ErrorSnackBar(
                        message: 'Please, Accept our terms and condition'.tr,
                        title: 'error'.tr));
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 15, left: 20, right: 20),
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: controller.isChecked.value
                        ? Color(0xFF652981)
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF652981).withOpacity(0.2),
                          blurRadius: 2,
                          offset: Offset(0, 2)),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    'Account Deactivate'.tr,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      }),
    );
  }
}
