import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/app/modules/inbox/widgets/notification_widget.dart';
import 'package:latest_payplus_agent/app/modules/notifications/widgets/notification_tab_bar.dart';
import 'package:latest_payplus_agent/app/modules/recharge_report_number_check/controllers/number_check_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView>
    with TickerProviderStateMixin {
  TabController? tabController;
  int currentTabIndex = 0;
  void onTabChange() {
    setState(() {
      currentTabIndex = tabController!.index;
      print(currentTabIndex);
    });
  }

  late NumberCheckController controller;

  @override
  void initState() {
    controller = Get.put(NumberCheckController());
    tabController = TabController(length: 2, vsync: this);

    // tabController.addListener(() {
    //   onTabChange();
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = Get.size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(65, 65),
          child: AppBar(
            backgroundColor: Color(0xFF652981),
            centerTitle: true,
            title: Text('Notification'.tr),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        body: Container(
          width: _size.width,
          // margin: EdgeInsets.all(20),
          margin: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 10),
          // decoration: Ui.getBoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(),
              NotificationsTabBar(tabController: tabController!),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      //General Notifications
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            NotificationWidget(),
                          ],
                        ),
                      ),

                      //Rechrage Notifications
                      Obx(() {
                        if (controller.rechargeReportLoaded.isTrue) {
                          return SingleChildScrollView(
                            child: Column(
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
                                                        // Text(
                                                        //   'Recharge'.tr,
                                                        //   style: TextStyle(
                                                        //     fontSize: 16,
                                                        //   ),
                                                        // ),
                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        Text(
                                                          controller
                                                              .rechargeReport
                                                              .value
                                                              .data![index]
                                                              .rechargeMobileNumber!,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.bold),
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
                                                          ? '- ৳ ${controller.rechargeReport.value.data![index].rechargeAmount!}'
                                                          : '৳ ${controller.rechargeReport.value.data![index].rechargeAmount!}',
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
                            ),
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

                      //Transactions Notifications
                      // Container(
                      //   height: _size.height,
                      //   width: _size.width,
                      //   child: Column(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(
                      //             top: 10, left: 2, right: 2),
                      //         child: Container(
                      //           decoration: Ui.getBoxDecoration(
                      //               color: Colors.white, radius: 10),
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(
                      //                 top: 12, left: 8, bottom: 12, right: 8),
                      //             child: Row(
                      //               children: [
                      //                 SizedBox(
                      //                   width: 8,
                      //                 ),
                      //                 Image.asset(
                      //                   "assets/collection/1.png",
                      //                   height: 35,
                      //                   width: 35,
                      //                   color: Color(0xFF652981),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 8,
                      //                 ),
                      //                 Container(
                      //                   width: 240,
                      //                   child: Column(
                      //                     // mainAxisAlignment:
                      //                     //     MainAxisAlignment.spaceEvenly,
                      //                     // crossAxisAlignment:
                      //                     //     CrossAxisAlignment.start,
                      //                     children: [
                      //                       Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           Text(
                      //                             'Manik Mia',
                      //                             style: TextStyle(
                      //                                 color: AppColors
                      //                                     .homeTextColor1,
                      //                                 fontWeight:
                      //                                     FontWeight.bold,
                      //                                 fontSize: 14),
                      //                           ),
                      //                           Text(
                      //                             '20-Apr-2022 01:52',
                      //                             style: TextStyle(
                      //                                 color: AppColors
                      //                                     .homeTextColor3,
                      //                                 fontSize: 10),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       SizedBox(height: 5),
                      //                       Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           Text(
                      //                             'Ph : 01683293709',
                      //                             style: TextStyle(
                      //                                 color: AppColors
                      //                                     .homeTextColor3,
                      //                                 fontSize: 11),
                      //                           ),
                      //                           Text(
                      //                             '৳ 00.00',
                      //                             style: TextStyle(
                      //                                 color: AppColors
                      //                                     .homeTextColor1,
                      //                                 fontWeight:
                      //                                     FontWeight.bold,
                      //                                 fontSize: 14),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       SizedBox(height: 5),
                      //                       Row(
                      //                         children: [
                      //                           Container(
                      //                             height: 20,
                      //                             width: 50,
                      //                             decoration: BoxDecoration(
                      //                               border: Border.all(
                      //                                   color: AppColors
                      //                                       .homeTextColor3,
                      //                                   width: 1),
                      //                               borderRadius:
                      //                                   BorderRadius.circular(
                      //                                       10),
                      //                             ),
                      //                             child: Padding(
                      //                               padding:
                      //                                   const EdgeInsets.only(
                      //                                       left: 6, right: 6),
                      //                               child: Center(
                      //                                 child: Text(
                      //                                   'Nagad',
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight.bold,
                      //                                       color: AppColors
                      //                                           .homeTextColor3,
                      //                                       fontSize: 10),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           SizedBox(width: 10),
                      //                           Container(
                      //                             height: 20,
                      //                             width: 50,
                      //                             decoration: BoxDecoration(
                      //                               color:
                      //                                   AppColors.redTextColor,
                      //                               borderRadius:
                      //                                   BorderRadius.circular(
                      //                                       10),
                      //                             ),
                      //                             child: Padding(
                      //                               padding:
                      //                                   const EdgeInsets.only(
                      //                                       left: 6, right: 6),
                      //                               child: Center(
                      //                                 child: Text(
                      //                                   'ক্রয়',
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight.bold,
                      //                                       color: AppColors
                      //                                           .homeCardBg,
                      //                                       fontSize: 10),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       )
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
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
