import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/number_check_controller.dart';

class NumberCheckView extends GetView<NumberCheckController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF652981),
        title: Text('Recharge Report'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: _size.width * .3,
                    width: _size.width,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mobile Number'.tr,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 35.0, top: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/user.png',
                                          height: 50,
                                          width: 50,
                                          color: Color(0xFF652981),
                                        ),
                                        Container(
                                          width: _size.width * .5,
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            initialValue:
                                                controller.number.value,
                                            onChanged: (input) {
                                              controller.number.value = input;
                                            },
                                            validator: (input) => input!
                                                        .length <
                                                    11
                                                ? 'Please provide valid phone number'
                                                : null,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xFF652981),
                                            ),
                                            obscureText: false,
                                            textAlign: TextAlign.start,
                                            cursorColor: Color(0xFF652981),
                                            decoration: InputDecoration(
                                              hintText: '01xxxxxxxxx',
                                              hintStyle: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey,
                                              ),
                                              focusColor: Color(0xFF652981),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: IconButton(
                                      onPressed: () {
                                        controller.getRechargeReport(
                                            controller.number.value);
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        size: 30,
                                        color: Color(0xFF652981),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
              Obx(() {
                if (controller.rechargeReportLoaded.isTrue) {
                  return Column(
                    children: List.generate(
                        controller.rechargeReport.value.data!.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: _size.width * 0.22,
                            width: _size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Logo(index),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Recharge'.tr,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                controller
                                                    .rechargeReport
                                                    .value
                                                    .data![index]
                                                    .rechargeMobileNumber!,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                controller
                                                    .rechargeReport
                                                    .value
                                                    .data![index]
                                                    .transactionId!,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            DateFormat.yMMMd().format(
                                                    DateTime.parse(controller
                                                        .rechargeReport
                                                        .value
                                                        .data![index]
                                                        .rechargeTime!)) +
                                                ' ' +
                                                DateFormat.jm().format(
                                                    DateTime.parse(controller
                                                        .rechargeReport
                                                        .value
                                                        .data![index]
                                                        .rechargeTime!)),
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            controller.rechargeReport.value
                                                        .data![index].status!
                                                        .toLowerCase() ==
                                                    'failed'
                                                ? '+ ৳ ${controller.rechargeReport.value.data![index].rechargeAmount!}'
                                                : '- ৳ ${controller.rechargeReport.value.data![index].rechargeAmount!}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF652981),
                                            ),
                                          ),
                                          Text(
                                            '${controller.rechargeReport.value.data![index].status!}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: controller
                                                          .rechargeReport
                                                          .value
                                                          .data![index]
                                                          .status!
                                                          .toLowerCase() ==
                                                      'failed'
                                                  ? Colors.red
                                                  : controller
                                                              .rechargeReport
                                                              .value
                                                              .data![index]
                                                              .status!
                                                              .toLowerCase() ==
                                                          'success'
                                                      ? Colors.green
                                                      : Colors.yellow,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
                    child: Center(
                      child: Ui.customLoader(),
                    ),
                  );
                }
              }),
            ],
          )),
    );
  }

  Container Logo(int index) {
    var gp = "assets/sim/gp.png";
    var airtel = "assets/sim/art.png";
    var banglalink = "assets/sim/bl.png";
    var robi = "assets/sim/robi.png";
    var teletalk = "assets/sim/teletalk.png";

    var operator = controller.rechargeReport.value.data![index].operator!;

    dynamic Operator() {
      if (operator == "Grameen phone") {
        return gp;
      } else if (operator == "Airtel") {
        return airtel;
      } else if (operator == "Banglalink") {
        return banglalink;
      } else if (operator == "Robi") {
        return robi;
      } else if (operator == "Teletalk") {
        return teletalk;
      } else
        return gp;
    }

    var _operatorImage = Operator();

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          _operatorImage,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
