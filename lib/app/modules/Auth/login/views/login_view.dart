import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:donation_flutter/app/modules/global_widgets/block_button_widget.dart';
import 'package:donation_flutter/app/modules/global_widgets/text_field_widget.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/firebase_analytic.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/ui.dart';

import '../controllers/login_controller.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class LoginView extends GetView<LoginController> {
  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    userdata.write('mobile_number', controller.mobileNumber.value);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        return SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: kIsWeb && _size.width > 800 ? 600 : _size.width,
              height: _size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: kIsWeb ? 100 : 180,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: _size.width,
                      margin: EdgeInsets.all(_size.width * .04),
                      decoration: Ui.getBoxDecoration(color: Colors.white),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: _size.width * .04),
                            Center(
                              child: Text(
                                'Login to Shahajjo'.tr,
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            SizedBox(height: _size.width * .04),
                            TextFieldWidget(
                              labelText: "Email".tr,
                              hintText: "Email".tr,
                              keyboardType: TextInputType.text,
                              readOnly: false,
                              onChanged: (input) =>
                                  controller.emailController.value.text = input,
                              imageData: 'assets/icons/number_pad.png',
                            ),
                            TextFieldWidget(
                              labelText: "Pin:".tr,
                              hintText: "••••••••••••".tr,
                              keyboardType: TextInputType.number,
                              obscureText: controller.hidePassword.value,
                              onChanged: (input) {
                                controller.password.value = input;
                              },
                              limit: 6,
                              counterText: "",
                              validator: (input) => input!.length < 6
                                  ? "Should be more than 6 characters".tr
                                  : null,
                              iconData: CupertinoIcons.lock,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.REGISTER);
                                  },
                                  child: Container(
                                    child: Text(
                                      "Do Not Have An Account, Please Signup?"
                                          .tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 20),
                            SizedBox(height: _size.width * .04),
                            BlockButtonWidget(
                              onPressed: () {
                                controller.loginController();
                              },
                              color: AppColors.primaryColor,
                              text: Text(
                                "Login".tr,
                                style: Get.textTheme.headline6!.merge(
                                    const TextStyle(color: Colors.white)),
                              ),
                            ).paddingSymmetric(
                                vertical: _size.width * .04, horizontal: 20),
                            SizedBox(height: _size.width * .08),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
