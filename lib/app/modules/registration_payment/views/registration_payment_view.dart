import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/registration_payment_controller.dart';
import 'package:flutter/cupertino.dart';

class RegistrationPaymentView extends GetView<RegistrationPaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: const Color(0xFF652981),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Registration Payment'.tr),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.payInfoLoaded.isTrue) {
          return WillPopScope(
            onWillPop: () {
              Get.back();
              // Get.offAllNamed(Routes.CHECK_PHONE_NUMBER);
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.25,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: const BoxDecoration(
                        // color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage('assets/icons/pay_registration.png'),
                          fit: BoxFit.contain,
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      controller.registartionMsg.value + "।",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
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
                        Text(
                          'I agree to your'.tr,
                          style: const TextStyle(color: Colors.black, fontSize: 13),
                        ).paddingSymmetric(vertical: 5, horizontal: 1),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: InkWell(
                            onTap: () async {
                              final String urlString = "https://raw.githubusercontent.com/musabbir-mamun/app-privacy-policy/master/paystation/paystation.html";

                              String url = "https://shl.com.bd/terms-and-conditions.php";
                              if (await canLaunch(urlString)) {
                                await launch(url, forceSafariVC: false);
                              } else {
                                print("can not load this url");
                              }
                            },
                            child: Container(
                                child: Text(
                              "terms and condition".tr,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  // fontSize: 12,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.isChecked.value) {
                        controller.getRegPaymentUrl();
                      } else {
                        Get.showSnackbar(Ui.ErrorSnackBar(message: 'Please, Accept our terms and condition'.tr, title: 'error'.tr));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 15, left: 20, right: 20),
                      margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: controller.isChecked.value ? const Color(0xFF652981) : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: const Color(0xFF652981).withOpacity(0.2), blurRadius: 2, offset: const Offset(0, 2)),
                        ],
                      ),
                      child: Center(
                          child: Text(
                        'Payment'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Ui.customLoader(),
          );
        }
      }),
    );
  }
}
