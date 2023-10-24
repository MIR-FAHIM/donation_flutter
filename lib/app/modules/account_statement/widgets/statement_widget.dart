import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/account_statement/controllers/statement_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class StatementWidget extends GetWidget<AccountStatementController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.accountStatementLoaded.isTrue) {
        if (controller.accountStatement.value.data!.length > 0) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                  controller.accountStatement.value.data!.length, (index) {
                var name_color = controller.accountStatement.value.data![index]
                    .transaction_name_color!;

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
                                        // color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:  CachedNetworkImage(
                                          height: 60,
                                          width: 60,
                                          imageUrl:  controller.accountStatement.value
                                              .data![index].icon!,
                                          imageBuilder: (context, imageProvider) => Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Image(
                                              image: AssetImage('assets/Logo.png'),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Image(
                                              image: AssetImage('assets/Logo.png'),
                                            ),
                                          ),
                                        ),


                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              controller
                                                  .accountStatement
                                                  .value
                                                  .data![index]
                                                  .transaction_name!,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          controller.accountStatement.value
                                                      .data![index].trx_id !=
                                                  null
                                              ? FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    controller
                                                        .accountStatement
                                                        .value
                                                        .data![index]
                                                        .trx_id!,
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: AppColors
                                                            .homeTextColor3),
                                                  ),
                                                )
                                              : Container(),
                                          SizedBox(height: 3),
                                          Text(
                                            controller.accountStatement.value
                                                .data![index].transaction_time!,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color:
                                                    AppColors.homeTextColor3),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, right: 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              "৳ " +
                                                  controller
                                                      .accountStatement
                                                      .value
                                                      .data![index]
                                                      .amount!,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              "৳ " +
                                                  controller
                                                      .accountStatement
                                                      .value
                                                      .data![index]
                                                      .new_balance!,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold
                                                  // color:
                                                  //     AppColors.greenTextColor
                                                  ),
                                            ),
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
                    'No Transaction found for you'.tr,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.offAndToNamed(Routes.ROOT);
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
