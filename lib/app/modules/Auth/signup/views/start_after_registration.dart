import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latest_payplus_agent/app/modules/Auth/signup/controllers/signup_controller.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';

import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class StartAfterRegistrationComplete extends GetView<SignupController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/start_after_signup.png'),
                fit: BoxFit.fill,
              )),
            )),
        Positioned(
          top: 240,
          left: 0,
          right: 0,
          child: Container(
            width: _size.width,
            margin: EdgeInsets.all(20),
            decoration: Ui.getBoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Text(
                      'Welcome to Pay Plus App'.tr,
                      style: TextStyle(
                        color: Color(0xFF652981),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'start_message'.tr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BlockButtonWidget(
                  onPressed: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  color: Color(0xFF652981),
                  text: Text(
                    "Start".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ).paddingSymmetric(vertical: 25, horizontal: 20),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
