import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latest_payplus_agent/app/modules/Auth/signup/controllers/signup_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class TradeSelectPage extends GetWidget<SignupController> {
  RangeValues _currentRangeValues = const RangeValues(0, 12);

  TradeSelectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          GestureDetector(
            onTap: (){
              controller.skipTrade.value = true;
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * .15,
              decoration: controller.skipTrade.value == true ? Ui.getBoxDecoration(color: Colors.blue, radius: 10): Ui.getBoxDecoration(color: Colors.white, radius: 10),

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Skip Trade License for now'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF652981),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              controller.skipTrade.value = false;
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * .15,
              decoration: controller.skipTrade.value == false ? Ui.getBoxDecoration(color: Colors.blue, radius: 10): Ui.getBoxDecoration(color: Colors.white, radius: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Sign up with trade license'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF652981),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      );
    });
  }

  void showPicker(context, String type) {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Wrap(
          children: <Widget>[
            InkWell(
              onTap: () {
                Get.back();
              } /* Navigator.pop(context)*/,
              child: Center(
                child: Image.asset(
                  'assets/bottom/rectline.png',
                  height: 20,
                  width: 40,
                  color: Get.theme.disabledColor.withOpacity(0.2),
                ),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text('Photo Library'.tr),
                onTap: () {
                  controller.getImage(ImageSource.gallery, type);
                  Get.back();
                }),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: Text('Camera'.tr),
              onTap: () {
                controller.getImage(ImageSource.camera, type);
                Get.back();
              },
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
    // showModalBottomSheet(
    //     context: context,
    //     builder: (BuildContext bc) {
    //       return Container(
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //           color: Get.theme.scaffoldBackgroundColor,
    //           borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    //         ),
    //         child: Wrap(
    //           children: <Widget>[
    //             ListTile(
    //                 leading: const Icon(Icons.photo_library),
    //                 title: Text('Photo Library'.tr),
    //                 onTap: () {
    //                   controller.getImage(ImageSource.gallery);
    //                   Get.back();
    //                 }),
    //             ListTile(
    //               leading: const Icon(Icons.photo_camera),
    //               title: Text('Camera'.tr),
    //               onTap: () {
    //                 controller.getImage(ImageSource.camera);
    //                 Get.back();
    //               },
    //             ),
    //           ],
    //         ),
    //       );
    //     });
  }

  showPopup(context, String type) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            //title: Text('Select '),
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: Text('Photo Library'.tr),
                      onTap: () {
                        controller.getImage(ImageSource.gallery, type);
                        Get.back();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Camera'.tr),
                    onTap: () {
                      controller.getImage(ImageSource.camera, type);
                      Get.back();
                    },
                  ),
                ],
              ),
            )
          // actions: <Widget>[

          // ],
        );
      },
    );
  }
}
