import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/account_setting/controllers/account_setting_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class DeActivateAccountPinCode extends GetView<AccountSettingController> {
  @override
  Widget build(BuildContext context) {
    final maxLines = 4;
    final _size = Get.size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Enter PIN here'.tr),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.offAllNamed(Routes.ROOT),
          ),
        ),
      ),
      body: Obx(() {
        return WillPopScope(
          onWillPop: () {
            Get.offAllNamed(Routes.ROOT);
            return Future.value(false);
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text('Why are you deactivate your account?'.tr),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    color: AppColors.ThirdbackgroundColor,
                    height: maxLines * 24.0,
                    child: TextField(
                      onChanged: (value) {
                        controller.msg.value = value;
                      },
                      keyboardType: TextInputType.multiline,

                      maxLines:
                          maxLines, // when user presses enter it will adapt to it
                      decoration: InputDecoration(
                        hintText: "Write your opinion...".tr,
                        // suffixIcon: Icon(
                        //   Icons.description,
                        //   color: Theme.of(context).primaryColor,
                        //   size: 16,
                        // ),
                        labelStyle: TextStyle(
                            fontSize: 12, color: AppColors.homeTextColor3),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: _size.width,
                      //  height: 50,
                      decoration: Ui.getBoxDecoration(radius: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: TextFormField(
                          autofocus: true,
                          obscureText: true,
                          controller: controller.pinController,
                          cursorColor: Color(0xFF652981),
                          textAlign: TextAlign.center,

                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Enter PIN here'.tr,
                            hintStyle: TextStyle(
                                color: Color(0xFF652981), fontSize: 15),
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              color: Color(0xFF652981),
                            ).marginOnly(right: 14),

                            // floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusColor: Color(0xFF652981),
                          ),
                          focusNode: controller.pinFocusFocus,
                          keyboardType: TextInputType.phone,
                          // validator: (String? value) {
                          //
                          // },
                          onChanged: (input) {
                            controller.pinNumber.value = input;
                          },
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    controller.DeactivateAccount();
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 15, left: 15, right: 15),
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
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
                      'Confirm'.tr,
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
          ),
        );
      }),
    );
  }
}
