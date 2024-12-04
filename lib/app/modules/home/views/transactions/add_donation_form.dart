// import 'dart:html';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_flutter/app/modules/admin/controllers/admin_controller.dart';
import 'package:donation_flutter/app/modules/global_widgets/block_button_widget.dart';
import 'package:donation_flutter/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/app/modules/home/views/homepage_listing_profile_widget.dart';
import 'package:donation_flutter/app/modules/home/widgets/subtitle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:donation_flutter/app/services/facebook_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/custom_data.dart';
import 'package:donation_flutter/common/ui.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AddDonationForm extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: RechargeDrawer(),
      endDrawer: MainDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text("Add Donation"),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text("You are donating to:"),
                  Text(controller.datumBank.value.bankName!),
                  Text(controller.datumBank.value.accountName!),
                  Text(controller.datumBank.value.accountNum!.toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Add Donation ( provide your transaction details)",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                      width: kIsWeb ? Get.width * .6 : Get.width,
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      color: AppColors.textColorBlack,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: TextFormField(
                                onTapOutside: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                controller: controller.emailController.value,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Email for greeting message".tr,
                                  // hintStyle: TextStyle(
                                  //   fontSize: 24,
                                  //   color: Colors.grey,
                                  //   fontWeight: FontWeight.w500,
                                  //   fontFamily: "Unineue",
                                  // ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank/MFS Name",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      color: AppColors.textColorBlack,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: TextFormField(
                                onTapOutside: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                controller: controller.bankNameController.value,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: const InputDecoration(
                                  // hintText: "1XXXXXXXXX",
                                  // hintStyle: TextStyle(
                                  //   fontSize: 24,
                                  //   color: Colors.grey,
                                  //   fontWeight: FontWeight.w500,
                                  //   fontFamily: "Unineue",
                                  // ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account/MFS Number",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      color: AppColors.textColorBlack,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: TextFormField(
                                onTapOutside: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                controller:
                                    controller.accountNumController.value,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: const InputDecoration(
                                  // hintText: "1XXXXXXXXX",
                                  // hintStyle: TextStyle(
                                  //   fontSize: 24,
                                  //   color: Colors.grey,
                                  //   fontWeight: FontWeight.w500,
                                  //   fontFamily: "Unineue",
                                  // ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account Name",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      color: AppColors.textColorBlack,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: TextFormField(
                                onTapOutside: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                controller:
                                    controller.accountNameController.value,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Account Name",
                                  // hintStyle: TextStyle(
                                  //   fontSize: 24,
                                  //   color: Colors.grey,
                                  //   fontWeight: FontWeight.w500,
                                  //   fontFamily: "Unineue",
                                  // ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reference".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      color: AppColors.textColorBlack,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: TextFormField(
                                onTapOutside: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                controller:
                                    controller.refferanceController.value,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Referrance no/Transaction code",
                                  // hintStyle: TextStyle(
                                  //   fontSize: 24,
                                  //   color: Colors.grey,
                                  //   fontWeight: FontWeight.w500,
                                  //   fontFamily: "Unineue",
                                  // ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Donation Amount",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      color: AppColors.textColorBlack,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: TextFormField(
                                onTapOutside: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                controller: controller.amountController.value,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ])),
                  const SizedBox(
                    height: 16,
                  ),
                  HostSetupSubtitle(
                      subtitle:
                          "You can make a contact with respective person before donate, also please read the Terms and Condition Policy."
                              .tr),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Click on this Policy link.".tr,
                            style: TextStyle(color: Colors.blue, fontSize: 16)),
                      ],
                    ),
                  ),
                  Text(
                    "Please check the policy, Shahajjo App only connect Donator with Charity Authority"
                        .tr,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Respective Authority ",
                            style: TextStyle(color: Colors.grey)),
                        TextSpan(
                          text: controller.projectData.value.authority,
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Mobile no ",
                            style: TextStyle(color: Colors.grey)),
                        TextSpan(
                          text: controller.projectData.value.mobile,
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Email ",
                            style: TextStyle(color: Colors.grey)),
                        TextSpan(
                          text: controller.projectData.value.email,
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Read ",
                            style: TextStyle(color: Colors.grey)),
                        TextSpan(
                          text: "terms and condition ",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlockButtonWidget(
                    height: kIsWeb ? Get.height * .06 : Get.height * .06,
                    onPressed: () {
                      if (controller.bankNameController.value.text.isEmpty ||
                          controller.amountController.value.text.isEmpty) {
                      } else {
                        controller.addDonationByUser(
                            userID: Get.find<AuthService>()
                                .currentUser
                                .value
                                .user!
                                .id
                                .toString(),
                            username: Get.find<AuthService>()
                                .currentUser
                                .value
                                .user!
                                .name,
                            amount: controller.amountController.value.text);
                      }
                    },
                    color: AppColors.primaryColor,
                    text: Text(
                      "Add Donation".tr,
                      style: Get.textTheme.headline6!
                          .merge(const TextStyle(color: Colors.white)),
                    ),
                  ).paddingSymmetric(vertical: Get.width * .04, horizontal: 20),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
