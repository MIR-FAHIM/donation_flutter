import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/common/ui.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/signup_service_fee_confirm_controller.dart';

class SignupServiceFeeConfirmView extends GetView<SignupServiceFeeConfirmController> {
  const SignupServiceFeeConfirmView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          "Terms & Condition of Signup".tr,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.size.width * .1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(controller.registrationInf.value.termsAndConditions!.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 15,
                ),
                child: Text(
                  '${controller.registrationInf.value.termsAndConditions![index].message}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              );
            }),
          ),
          SizedBox(
            height: Get.size.width * .08,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: RichText(
              text: TextSpan(
                text: 'Please read all the terms and condition and then proceed.'.tr + "  ",
                style: TextStyle(
                  fontSize: 18,
                  color: Get.theme.primaryColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Terms & Conditions".tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Get.theme.primaryColor,
                      color: Get.theme.primaryColor,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 2,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final String urlString = "https://raw.githubusercontent.com/musabbir-mamun/app-privacy-policy/master/paystation/paystation.html";

                        Uri url = Uri.parse(urlString);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("can not load this url");
                        }
                      },
                  ),
                ],
              ),
            ),

            // Text(
            //   'Please read all the terms and condition and then proceed.'.tr,
            //   style: TextStyle(
            //     color: Get.theme.primaryColor,
            //     fontSize: 18,
            //   ),
            // ),
          ),
          Obx(() {
            return CheckboxListTile(
              title: Text(
                "I agree with the terms & conditions".tr,
                style: TextStyle(
                  color: Get.theme.primaryColor,
                ),
              ),
              value: controller.isAgree.value,
              onChanged: (newValue) {
                controller.isAgree.value = newValue!;
              },
              controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
            );
          }),
          SizedBox(
            height: Get.size.width * .08,
          ),
          Center(
            child: BlockButtonWidget(
              width: Get.size.width * .8,
              onPressed: () {
                if (controller.isAgree.value) {
                  controller.getRegPaymentUrl();
                } else {
                  Get.showSnackbar(Ui.ErrorSnackBar(message: 'Please, Accept our terms and condition'.tr, title: 'error'.tr));
                }
              },
              color: Get.theme.primaryColor,
              text: Text(
                'Next'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
