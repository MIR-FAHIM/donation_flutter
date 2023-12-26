import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/recharge_report_controller.dart';

class RechargeReportView extends GetView<RechargeReportController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF652981),
        title: Text('Recharge Report'.tr),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.rechargeReportLoaded.isTrue) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(controller.rechargeReport.value.data!.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: SizedBox(
                      height: _size.width * .2,
                      width: _size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.grey.shade100,
                                  //     borderRadius: BorderRadius.circular(50),
                                  //   ),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: Image.asset(
                                  //       Helper().operatorCheck(controller.rechargeReport.value.data![index].rechargeMobileNumber!),
                                  //       height: 35,
                                  //       width: 35,
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Recharge'.tr,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.rechargeReport.value.data![index].rechargeMobileNumber!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.rechargeReport.value.data![index].transactionId!,
                                          style: const TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat.yMMMd().format(DateTime.parse(controller.rechargeReport.value.data![index].rechargeTime!)) +
                                        ' ' +
                                        DateFormat.jm().format(DateTime.parse(controller.rechargeReport.value.data![index].rechargeTime!)),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.rechargeReport.value.data![index].status!.toLowerCase() == 'failed'
                                        ? '+ ৳ ${controller.rechargeReport.value.data![index].rechargeAmount!}'
                                        : '-৳ ${controller.rechargeReport.value.data![index].rechargeAmount!}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF652981),
                                    ),
                                  ),
                                  Text(
                                    controller.rechargeReport.value.data![index].status!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: controller.rechargeReport.value.data![index].status!.toLowerCase() == 'failed'
                                          ? Colors.red
                                          : controller.rechargeReport.value.data![index].status!.toLowerCase() == 'success'
                                              ? Colors.green
                                              : Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        } else {
          return SizedBox(
            height: Get.size.height,
            child: Center(
              child: Ui.customLoader(),
            ),
          );
        }
      }),
    );
  }
}
