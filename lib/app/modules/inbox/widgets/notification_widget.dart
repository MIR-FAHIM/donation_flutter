import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/app/modules/inbox/controllers/inbox_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class NotificationWidget extends GetWidget<InboxController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.notificationLoaded.isTrue) {
        if (controller.notifications.value.data!.isNotEmpty) {
          return Column(
            children: List.generate(controller.notifications.value.data!.length, (index) {
              return InkWell(
                onTap: (){

                    if(controller.notifications.value
                        .data![index].title! == "Robi Recharge Request from PayPos" || controller.notifications.value
                        .data![index].title! == "Airtel Recharge Request from PayPos" ){
                      List<String?> numbers = controller.extractNumbersFromString(controller.notifications.value.data![index].message!);
                      if(numbers.isNotEmpty){
                        Get.find<RechargeController>().rechargeNumber.value = numbers[1]!;
                        Get.find<RechargeController>().amount.value = numbers[0]!;
                        Get.find<RechargeController>().commission.value = numbers[2]!;
                        Get.toNamed(Routes.RECHARGEPINNOTIFICATION, arguments: [controller.notifications.value.data![index].message!, "mir", ],  );
                      } else {
                        print("message num list is empty bhai >>>>>>");
                      }


                      controller.changeNotiStatus(controller.notifications.value.data![index].notiId);


                    }


                },
                child: AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: Get.size.width,
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
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: _size.width * .15,
                                            width: _size.width * .15,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.notifications,
                                                color:  controller.notifications.value.data![index].activityStatus == 1 && controller.notifications.value
                                                    .data![index].title! == "Robi Recharge Request from PayPos"  ? Colors.redAccent : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.notifications.value
                                                      .data![index].title!,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      color: Get.theme.textTheme.bodyText2!
                                                          .color),
                                                ),
                                                Text(
                                                  controller.notifications.value
                                                      .data![index].message!,
                                                  maxLines: 3,
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: _size.width * .15 + 10,
                                      ),
                                      child: Text(
                                        controller
                                            .notifications.value.data![index].dateTime!,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
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
