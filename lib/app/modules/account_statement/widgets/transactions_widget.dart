import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/app/modules/inbox/controllers/inbox_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class TransactionWidget extends GetWidget<InboxController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.transactionLoaded.isTrue) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.selectedType.value = 0;
                        },
                        child: Container(
                          width: Get.size.width * .18,
                          decoration: Ui.getBoxDecoration(
                            color: controller.selectedType.value == 0
                                ? const Color(0xFF652981)
                                : Colors.white,
                            radius: 10,
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'All'.tr,
                              style: TextStyle(
                                color: controller.selectedType.value == 0
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          )),
                        ),
                      ),
                      Row(
                        children:
                            List.generate(controller.transactionType.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectedType.value =
                                  controller.transactionType[index].id!;
                              controller.getTransactionReport(
                                  type: controller.selectedType.value.toString());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: Get.size.width * .45,
                                decoration: Ui.getBoxDecoration(
                                  color: controller.selectedType.value ==
                                          controller.transactionType[index].id!
                                      ? const Color(0xFF652981)
                                      : Colors.white,
                                  radius: 10,
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.transactionType[index].type!,
                                    style: TextStyle(
                                      color: controller.selectedType.value ==
                                              controller.transactionType[index].id!
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                )),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(controller.transactionReport.value.data!.length,
                    (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: Get.size.width,
                      // height: Get.width * .15,
                      decoration: Ui.getBoxDecoration(
                        color: Colors.white,
                        radius: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: Get.size.width * .6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.transactionReport.value.data![index]
                                              .trxName ??
                                          '',
                                      style: const TextStyle(
                                        color: const Color(0xFF652981),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // Text(
                                    //   controller.transactionReport[index].description!,
                                    //   style: TextStyle(
                                    //     fontSize: 13,
                                    //   ),
                                    //   maxLines: 5,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '৳ ${controller.transactionReport.value.data![index].amount}',
                                    style: const TextStyle(
                                      color: Color(0xFF652981),
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    DateFormat.yMMMd().format(DateTime.parse(controller
                                            .transactionReport.value.data![index].trxTime
                                            .toString())) +
                                        ' ' +
                                        DateFormat.jm().format(DateTime.parse(controller
                                            .transactionReport.value.data![index].trxTime
                                            .toString())),
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        );
      } else {
        return Center(child: Ui.customLoader());
      }
    });
  }
}
