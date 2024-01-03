import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/app/modules/inbox/controllers/inbox_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class NotificationDetailsWidget extends GetWidget<InboxController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.notificationLoaded.isTrue) {
        if (controller.notifications.value.data!.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Details"),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: Get.width,
                      height: Get.height*.4,
                      decoration: Ui.getBoxDecoration(
                        color: Colors.white,
                        radius: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            width: _size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: Get.arguments[0] != null ? 3 : 1,
                                    child: Container(
                                      width: Get.width,
                                      height: Get.height*.4,
                                      child: CachedNetworkImage(
                                        imageUrl: Get.arguments[0].image!,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Image(
                                            image: AssetImage("assets/Logo.png"),
                                          ),
                                        ),
                                        errorWidget:
                                            (context, url, error) =>
                                                const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child:  Image(
                                            image: AssetImage("assets/Logo.png"),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(Get.arguments[0].title, style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(Get.arguments[0].message, style: TextStyle(color: Colors.black54),),
                    ),
              ]),
            ),
          );
        } else {
          return Container(
              height: Get.size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Notification found for you'.tr,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        // Get.offAndToNamed(Routes.ROOT);
                      },
                      child: Text(
                        'Back To Home'.tr,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF652981),
                        ),
                      )),
                ],
              ));
        }
      } else {
        return Container(
          height: Get.size.width,
          child: Center(
            child: Ui.customLoader(),
          ),
        );
      }
    });
  }
}
