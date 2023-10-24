import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';
import 'package:latest_payplus_agent/common/Color.dart';

import '../../../../common/ui.dart';
import '../controllers/forget_pass_wtih_o_t_p_controller.dart';

class ForgetPassWtihOTPView extends GetView<ForgetPassWtihOTPController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF652981),
        centerTitle: true,
        title: Text('Identity Verification'.tr),
        elevation: 0,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Verification Code'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          controller.codeVerifyTime.value == 0
                              ? ElevatedButton(
                                  onPressed: () {
                                    controller.sendOTP();
                                    controller.initSmsListener();
                                    controller.codeVerifyTime.value = 60;
                                    controller.verifyTimeStart();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF652981),
                                  ),
                                  child: Text(
                                    'Resend Code'.tr,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ))
                              : Text(
                                  'Resend code after'.tr +
                                      ' ${controller.codeVerifyTime.value}s',
                                )
                          // Obx(() {
                          //   if (controller.codeVerifyTime.value == 0) {
                          //     return ElevatedButton(
                          //         onPressed: () {
                          //           controller.sendOTP();
                          //           controller.initSmsListener();
                          //           controller.codeVerifyTime.value = 60;
                          //           controller.verifyTimeStart();
                          //         },
                          //         style: ElevatedButton.styleFrom(
                          //           primary: Color(0xFF652981),
                          //         ),
                          //         child: Text(
                          //           'Resend Code'.tr,
                          //           style: TextStyle(
                          //             fontSize: 16,
                          //             color: Colors.white,
                          //           ),
                          //         ));
                          //   } else {
                          //     return Text(
                          //       'Resend code after'.tr + ' ${controller.codeVerifyTime.value}s',
                          //     );
                          //   }
                          // }),
                        ],
                      ),
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          readOnly: false,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            inactiveFillColor: Colors.white,
                            inactiveColor: Colors.grey,
                            selectedColor: Color(0xFF652981),
                            selectedFillColor: Colors.white,
                            activeFillColor: Colors.white,
                            activeColor: Color(0xFF652981),
                          ),
                          cursorColor: Colors.black,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: false,
                          controller: controller.codeController,
                          keyboardType: TextInputType.number,
                          enabled: true,
                          textStyle: TextStyle(
                            color: Color(0xFF652981),
                          ),
                          boxShadows: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: controller.code.value == '1'
                                  ? Colors.black12
                                  : Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            controller.code.value = '1';
                            //do something or move to next screen when code complete
                          },
                          onChanged: (value) {
                            controller.code.value = '1';
                            print(value);
                          },
                        ),
                      );
                    }),
                  ],
                );
              }),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      text: "A verification has been sent to this number".tr +
                          " +88${controller.mobileNumber.value}.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ( Change Number ) '.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF652981),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              Form(
                key: controller.pinFormKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      labelText: "NID No".tr,
                      hintText: "Enter NID".tr,
                      keyboardType: TextInputType.number,
                      onChanged: (input) => controller.nidNumber.value = input,
                      validator: (input) => input!.length < 1
                          ? 'Please provide your NID number'.tr
                          : null,
                      iconData: null,
                      imageData: 'assets/images/nid.png',
                    ),
                    //Calender
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                      child: InkWell(
                        onTap: (){
                          controller.selectDate(context);
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  'Date of birth'.tr,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                controller.startDate.value,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.homeTextColor3),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Theme.of(context).primaryColor,
                                size: 18,
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (controller.pinFormKey.currentState!.validate()) {
            controller.VerifyOTPWithNID();

            // Get.find<AuthService>().removeCurrentUser();
            // Get.offAllNamed(Routes.CHECK_PHONE_NUMBER);
            // Get.offAndToNamed(Routes.CHECK_PHONE_NUMBER);
          } else
            Get.showSnackbar(Ui.ErrorSnackBar(
                message: "Please fill all item", title: 'Error'.tr));
        },
        child: Container(
          height: 60,
          decoration: Ui.getBoxDecoration(color: Colors.white, radius: 0),
          child: Stack(
            children: [
              Container(
                width: Get.size.width,
                height: 60,
                color: Colors.white,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Confirm'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF652981),
                      ),
                    ),
                  )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      if (controller.pinFormKey.currentState!.validate()) {
                        controller.VerifyOTPWithNID();

                        // Get.find<AuthService>().removeCurrentUser();
                        // Get.offAllNamed(Routes.CHECK_PHONE_NUMBER);
                        // Get.offAndToNamed(Routes.CHECK_PHONE_NUMBER);
                      } else
                        Get.showSnackbar(Ui.ErrorSnackBar(
                            message: "Please fill all item",
                            title: 'Error'.tr));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF652981),
                        size: 40,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
