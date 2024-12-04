// import 'dart:html';

import 'dart:io';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_flutter/app/modules/admin/controllers/admin_controller.dart';
import 'package:donation_flutter/app/modules/global_widgets/block_button_widget.dart';
import 'package:donation_flutter/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:donation_flutter/app/modules/home/views/homepage_listing_profile_widget.dart';
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

class AddBank extends GetView<AdminController> {

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
          title: Text("Add Bank"),
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
                  Text(
                    "Add Bank for",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Bank Name".tr,
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    maxLines: 1,
                    controller: controller.bankNameController.value,
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      focusColor: Colors.white,

                      // suffixIcon: Icon(
                      //   Icons.email_outlined,
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.textColorBlack, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.textColorBlack, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account Name".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                          controller: controller.accountNameController.value,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: "",
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
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account Number".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                          controller: controller.accountNumController.value,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: "",
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
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Branch".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                          controller: controller.branchController.value,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: "",
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
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Route No".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                          controller: controller.routingController.value,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: "",
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


                  const SizedBox(
                    height: 40,
                  ),
                  BlockButtonWidget(
                    onPressed: () {
                      controller.addBank();
                    },
                    color: AppColors.primaryColor,
                    text: Text(
                      "Add Bank".tr,
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

