import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/app/modules/account_statement/widgets/transactions_widget.dart';
import 'package:latest_payplus_agent/app/modules/inbox/widgets/notification_widget.dart';
import 'package:latest_payplus_agent/app/modules/inbox/widgets/transactions_widget.dart';
import 'package:latest_payplus_agent/app/modules/notifications/widgets/notification_tab_bar.dart';
import 'package:latest_payplus_agent/app/modules/recharge_report_number_check/controllers/number_check_controller.dart';
import 'package:latest_payplus_agent/app/modules/transaction_history/views/transaction_history_view.dart';
import 'package:latest_payplus_agent/common/Color.dart';
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
    tabController = TabController(length: 3, vsync: this);

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

                      //Recharge Notifications
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

                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           // NotificationWidget(),
                            TransactionsWidget()
                          ],
                        ),
                      ),

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
