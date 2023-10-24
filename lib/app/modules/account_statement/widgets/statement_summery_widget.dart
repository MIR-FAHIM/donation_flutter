import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/account_statement/controllers/statement_controller.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class StatementSummeryWidget extends GetWidget<AccountStatementController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: Get.size.width,
              height: Get.size.height * 0.15,
              decoration: Ui.getBoxDecoration(
                color: Colors.white,
                radius: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "শুরুর ব্যালেন্স",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.homeTextColor3),
                      ),
                      Text(
                        "৳ 100.00",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: AppColors.SectionHighLightCardBg,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "শেষ ব্যালেন্স",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.homeTextColor3),
                      ),
                      Text(
                        "৳ 100.00",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            if (controller.notificationLoaded.isTrue) {
              if (controller.accountStatement.value.data!.length > 0) {
                return SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        controller.accountStatement.value.data!.length,
                        (index) {
                      var name_color = controller.accountStatement.value
                          .data![index].transaction_name_color!;

                      var amount_color = controller
                          .accountStatement.value.data![index].amount_color!;
                      return Padding(
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
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                controller.accountStatement
                                                    .value.data![index].icon!,
                                                height: 30,
                                                width: 30,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .accountStatement
                                                      .value
                                                      .data![index]
                                                      .transaction_name!,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(int.parse(
                                                          name_color))),
                                                ),
                                                Text(
                                                  controller
                                                      .accountStatement
                                                      .value
                                                      .data![index]
                                                      .amount!,
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0, right: 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .accountStatement
                                                      .value
                                                      .data![index]
                                                      .amount!,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(int.parse(
                                                          amount_color))),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  controller
                                                      .accountStatement
                                                      .value
                                                      .data![index]
                                                      .new_balance!,
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors
                                                          .greenTextColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(
                                    //     left: _size.width * .15,
                                    //   ),
                                    //   child: Text(
                                    //     controller.accountStatement.value.data![index]
                                    //         .transaction_time!,
                                    //     style: TextStyle(fontSize: 12),
                                    //   ),
                                    // ),
                                  ],
                                )),
                          ),
                        ),
                      );
                    }),
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
          }),
        ],
      ),
    );
  }
}
