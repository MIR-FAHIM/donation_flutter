import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/app/modules/billpay_report/controllers/billpay_report_controller.dart';
import 'package:latest_payplus_agent/app/modules/daily_report/views/widget/progress_line_widget.dart';
import 'package:latest_payplus_agent/app/modules/recharge_report/controllers/recharge_report_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/daily_report_controller.dart';
import 'package:flutter/cupertino.dart';

class DailyReportView extends GetView<DailyReportController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(65, 65),
          child: AppBar(
            backgroundColor: Color(0xFF652981),
            centerTitle: true,
            title: Text('Daily Report'.tr),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Get.back(),
            ),
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         CupertinoIcons.bell,
            //         color: Colors.white70,
            //       )),
            // ],
          ),
        ),
        body: Obx(() {
          if (controller.dailyReportLoaded.isTrue) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                // height: _size.height * 0.80,
                // width: _size.width,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // DefaultTabController(
                      //   initialIndex: controller.monthSelection.value - 1,
                      //   length: 12,
                      //   child: Container(
                      //     height: 30,
                      //     child: Row(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.only(left: 8),
                      //           child: Container(
                      //             width: 70,
                      //             child: DropdownButton<String>(
                      //               value: controller.dropdownValue.value,
                      //               isExpanded: true,
                      //               icon:
                      //               Icon(Icons.arrow_drop_down_outlined),
                      //               elevation: 16,
                      //               style: const TextStyle(
                      //                   color: Colors.deepPurple),
                      //               underline: Container(
                      //                 height: 2,
                      //                 color: Colors.transparent,
                      //               ),
                      //               onChanged: (String? value) {
                      //                 // This is called when the user selects an item.
                      //
                      //                 controller.dropdownValue.value = value!;
                      //                   controller.yearSelection.value =
                      //                       int.parse(controller.dropdownValue.value );
                      //                   controller.getDailyReport(date:DateTime.now());
                      //
                      //               },
                      //               items: controller.yearList
                      //                   .map<DropdownMenuItem<String>>(
                      //                       (String value) {
                      //                     return DropdownMenuItem<String>(
                      //                       value: value,
                      //                       child: Text(value),
                      //                     );
                      //                   }).toList(),
                      //             ),
                      //           ),
                      //         ),
                      //         Container(
                      //           width:
                      //           MediaQuery.of(context).size.width - 150,
                      //           child: DefaultTabController(
                      //             initialIndex: controller.monthSelection.value - 1,
                      //             length: 12,
                      //             child: TabBar(
                      //               indicator: BoxDecoration(
                      //                   borderRadius:
                      //                   BorderRadius.circular(10),
                      //                   color: Get.theme.primaryColorLight),
                      //               isScrollable: true,
                      //               indicatorColor: Colors.black,
                      //               labelColor: Colors.black,
                      //               onTap: (index) {
                      //
                      //                   controller.monthSelection.value = index + 1;
                      //
                      //               },
                      //               tabs: controller.tabs
                      //                   .map((tab) => Tab(
                      //                 icon: Padding(
                      //                   padding:
                      //                   const EdgeInsets.all(4.0),
                      //                   child: Text(
                      //                     tab,
                      //                     style:
                      //                     TextStyle(fontSize: 12),
                      //                   ),
                      //                 ),
                      //               ))
                      //                   .toList(),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      //   child: DefaultTabController(
                      //     initialIndex: controller.daySelection.value - 1,
                      //     length: 31,
                      //     child: Column(
                      //       children: [
                      //         TabBar(
                      //           isScrollable: true,
                      //           indicatorColor: Colors.black38,
                      //           labelColor: Colors.black,
                      //           onTap: (index) {
                      //
                      //             controller.daySelection.value = index + 1;
                      //
                      //           },
                      //           tabs: controller.dayTab
                      //               .map((tab) => Tab(
                      //             icon: Padding(
                      //               padding:
                      //               const EdgeInsets.all(8.0),
                      //               child: Text(
                      //                 tab.toString(),
                      //                 style: TextStyle(
                      //                   fontSize: 12,
                      //                 ),
                      //               ),
                      //             ),
                      //           ))
                      //               .toList(),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              DateFormat.yMMMd()
                                  .format(controller.selectedDate.value),
                              style: TextStyle(
                                  color: AppColors.homeTextColor3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectDate(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 3),
                              width: MediaQuery.of(context).size.width * 0.42,
                              decoration: BoxDecoration(
                                color: AppColors.primarydeepLightColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 20),
                                    Image.asset(
                                      'assets/icons/calender.png',
                                      height: 10,
                                      width: 10,
                                      color: AppColors.homeTextColor1,
                                    ),
                                    Text(
                                      "তারিখ",
                                      style: TextStyle(
                                          color: AppColors.homeTextColor1,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    ),
                                    SizedBox(width: 20),
                                    Image.asset(
                                      'assets/icons/down_arrow.png',
                                      height: 10,
                                      width: 10,
                                      color: AppColors.homeTextColor1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: Get.height * .2,
                            width: Get.width * .4,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/icons/amountof.png"),
                                        )),
                                    Icon(Icons.more_vert,
                                        color: Colors.deepPurple)
                                  ],
                                ),
                                Text(
                                  "Opening Balance".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                ProgressLine(
                                  color: Colors.green,
                                  percentage: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.dailyReportDetails.value
                                              .opening_balance!,
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Tk",
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    // Text(
                                    //   "77",
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(color: Colors.white),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: Get.height * .2,
                            width: Get.width * .4,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/icons/lastbalance.png"),
                                        )),
                                    Icon(Icons.more_vert,
                                        color: Colors.deepPurple)
                                  ],
                                ),
                                Text(
                                  "Last Balance".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                ProgressLine(
                                  color: Colors.green,
                                  percentage: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          double.parse(controller
                                                  .dailyReportDetails
                                                  .value
                                                  .closing_balance!)
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Tk",
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    // Text(
                                    //   "77",
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(color: Colors.white),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: Get.context!,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    content: Container(
                                      height: Get.size.height * .4,
                                      width: Get.size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Received Balance'.tr,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 25.0,
                                              vertical: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: Get.height * .3,
                                                  width: Get.width * .3,
                                                  padding: EdgeInsets.all(16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.purple
                                                        .withOpacity(.1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4),
                                                              height: 40,
                                                              width: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                              ),
                                                              child: Image(
                                                                image: AssetImage(
                                                                    "assets/images/online_recived_amount.png"),
                                                              )),
                                                          InkWell(
                                                              onTap: () {
                                                                //controller.getCollectionDetailsController();
                                                                Get.toNamed(Routes
                                                                    .COLLECTION);
                                                              },
                                                              child: Icon(
                                                                  Icons.history,
                                                                  color: Colors
                                                                      .deepPurple))
                                                        ],
                                                      ),
                                                      Text(
                                                        "Online Recieved Balance"
                                                            .tr,
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      ProgressLine(
                                                        color: Colors.green,
                                                        percentage: 11,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                controller
                                                                    .dailyReportDetails
                                                                    .value
                                                                    .online_receive_balance!,
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "Tk",
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                            ],
                                                          ),
                                                          // Text(
                                                          //   "77",
                                                          //   style: Theme.of(context)
                                                          //       .textTheme
                                                          //       .caption!
                                                          //       .copyWith(color: Colors.white),
                                                          // ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: Get.height * .3,
                                                  width: Get.width * .3,
                                                  padding: EdgeInsets.all(16),
                                                  decoration: BoxDecoration(
                                                    color: Colors
                                                        .deepPurpleAccent
                                                        .withOpacity(.1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4),
                                                              height: 40,
                                                              width: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                              ),
                                                              child: Image(
                                                                image: AssetImage(
                                                                    "assets/images/online_recived_amount.png"),
                                                              )),
                                                          Icon(Icons.history,
                                                              color: Colors
                                                                  .deepPurple)
                                                        ],
                                                      ),
                                                      Text(
                                                        "Offline Recieved Balance"
                                                            .tr,
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      ProgressLine(
                                                        color: Colors.green,
                                                        percentage: 11,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                controller
                                                                    .dailyReportDetails
                                                                    .value
                                                                    .receive_balance!,
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "Tk",
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                            ],
                                                          ),
                                                          // Text(
                                                          //   "77",
                                                          //   style: Theme.of(context)
                                                          //       .textTheme
                                                          //       .caption!
                                                          //       .copyWith(color: Colors.white),
                                                          // ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // actions: <Widget>[

                                    // ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: Get.height * .2,
                              width: Get.width * .4,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(.1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(4),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/hand.png"),
                                          )),
                                      InkWell(
                                          onTap: () {},
                                          child: Icon(Icons.more_vert,
                                              color: Colors.deepPurple))
                                    ],
                                  ),
                                  Text(
                                    "Recieved Balance".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ProgressLine(
                                    color: Colors.green,
                                    percentage: 11,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            controller.dailyReportDetails.value
                                                .receive_balance!,
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Tk",
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      // Text(
                                      //   "77",
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .caption!
                                      //       .copyWith(color: Colors.white),
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: Get.height * .2,
                            width: Get.width * .4,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.lightGreenAccent.withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/OTF.png"),
                                        )),
                                    Icon(Icons.more_vert,
                                        color: Colors.deepPurple)
                                  ],
                                ),
                                Text(
                                  "Cash Back".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                ProgressLine(
                                  color: Colors.green,
                                  percentage: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller
                                              .dailyReportDetails.value.otf!,
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Tk",
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    // Text(
                                    //   "77",
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(color: Colors.white),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.put(RechargeReportController());
                              Get.find<RechargeReportController>()
                                  .getRechargeReport(
                                      fromNotiFi: true,
                                      dateFil: DateFormat('yyyy-MM-dd').format(
                                          controller.selectedDate.value));

                                Get.toNamed(Routes.RECHARGE_REPORT);

                            },
                            child: Container(
                              height: Get.height * .2,
                              width: Get.width * .4,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(.1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(4),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/icons/totalrecharge.png"),
                                          )),
                                      InkWell(
                                          onTap: () {
                                            Get.toNamed(Routes.RECHARGE_REPORT);
                                          },
                                          child: Icon(Icons.more_vert,
                                              color: Colors.deepPurple))
                                    ],
                                  ),
                                  Text(
                                    "Total Recharge".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ProgressLine(
                                    color: Colors.green,
                                    percentage: 11,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            controller.dailyReportDetails.value
                                                .recharge_amount!,
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Tk",
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      // Text(
                                      //   "77",
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .caption!
                                      //       .copyWith(color: Colors.white),
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: Get.context!,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      content: Container(
                                        height: Get.size.height * .8,
                                        width: Get.size.width,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'All Commission'.tr,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 25.0,
                                                vertical: 10,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: Get.height * .3,
                                                        width: Get.width * .3,
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .deepPurpleAccent
                                                              .withOpacity(.1),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(
                                                                                4),
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              10)),
                                                                    ),
                                                                    child:
                                                                        Image(
                                                                      image: AssetImage(
                                                                          "assets/images/online_recived_amount.png"),
                                                                    )),
                                                                Icon(
                                                                    Icons
                                                                        .history,
                                                                    color: Colors
                                                                        .deepPurple)
                                                              ],
                                                            ),
                                                            Text(
                                                              "Recharge Commision"
                                                                  .tr,
                                                              maxLines: 3,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            ProgressLine(
                                                              color:
                                                                  Colors.green,
                                                              percentage: 11,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      controller
                                                                          .dailyReportDetails
                                                                          .value
                                                                          .recharge_commission!,
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      "Tk",
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal),
                                                                    ),
                                                                  ],
                                                                ),
                                                                // Text(
                                                                //   "77",
                                                                //   style: Theme.of(context)
                                                                //       .textTheme
                                                                //       .caption!
                                                                //       .copyWith(color: Colors.white),
                                                                // ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: Get.height * .3,
                                                        width: Get.width * .3,
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.purple
                                                              .withOpacity(.1),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(
                                                                                4),
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              10)),
                                                                    ),
                                                                    child:
                                                                        Image(
                                                                      image: AssetImage(
                                                                          "assets/images/online_recived_amount.png"),
                                                                    )),
                                                                InkWell(
                                                                    onTap: () {
                                                                      //controller.getCollectionDetailsController();
                                                                      Get.toNamed(
                                                                          Routes
                                                                              .COLLECTION);
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .history,
                                                                        color: Colors
                                                                            .deepPurple))
                                                              ],
                                                            ),
                                                            Text(
                                                              "Bill Pay Commision"
                                                                  .tr,
                                                              maxLines: 3,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            ProgressLine(
                                                              color:
                                                                  Colors.green,
                                                              percentage: 11,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      controller
                                                                          .dailyReportDetails
                                                                          .value
                                                                          .bill_pay_commission!,
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      "Tk",
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal),
                                                                    ),
                                                                  ],
                                                                ),
                                                                // Text(
                                                                //   "77",
                                                                //   style: Theme.of(context)
                                                                //       .textTheme
                                                                //       .caption!
                                                                //       .copyWith(color: Colors.white),
                                                                // ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: Get.height * .3,
                                                        width: Get.width * .3,
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .pinkAccent
                                                              .withOpacity(.1),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(
                                                                                4),
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              10)),
                                                                    ),
                                                                    child:
                                                                        Image(
                                                                      image: AssetImage(
                                                                          "assets/images/online_recived_amount.png"),
                                                                    )),
                                                                Icon(
                                                                    Icons
                                                                        .history,
                                                                    color: Colors
                                                                        .deepPurple)
                                                              ],
                                                            ),
                                                            Text(
                                                              "ETicket Commision"
                                                                  .tr,
                                                              maxLines: 3,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            ProgressLine(
                                                              color:
                                                                  Colors.green,
                                                              percentage: 11,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      controller
                                                                          .dailyReportDetails
                                                                          .value
                                                                          .ticket_commission!,
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      "Tk",
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal),
                                                                    ),
                                                                  ],
                                                                ),
                                                                // Text(
                                                                //   "77",
                                                                //   style: Theme.of(context)
                                                                //       .textTheme
                                                                //       .caption!
                                                                //       .copyWith(color: Colors.white),
                                                                // ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: Get.height * .3,
                                                        width: Get.width * .3,
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.cyan
                                                              .withOpacity(.1),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(
                                                                                4),
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              10)),
                                                                    ),
                                                                    child:
                                                                        Image(
                                                                      image: AssetImage(
                                                                          "assets/images/online_recived_amount.png"),
                                                                    )),
                                                                InkWell(
                                                                    onTap: () {
                                                                      //controller.getCollectionDetailsController();
                                                                      Get.toNamed(
                                                                          Routes
                                                                              .COLLECTION);
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .history,
                                                                        color: Colors
                                                                            .deepPurple))
                                                              ],
                                                            ),
                                                            Text(
                                                              "MBanking Commision"
                                                                  .tr,
                                                              maxLines: 3,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            ProgressLine(
                                                              color:
                                                                  Colors.green,
                                                              percentage: 11,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      controller
                                                                          .dailyReportDetails
                                                                          .value
                                                                          .mbanking_commission!,
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      "Tk",
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal),
                                                                    ),
                                                                  ],
                                                                ),
                                                                // Text(
                                                                //   "77",
                                                                //   style: Theme.of(context)
                                                                //       .textTheme
                                                                //       .caption!
                                                                //       .copyWith(color: Colors.white),
                                                                // ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      // actions: <Widget>[

                                      // ],
                                      );
                                },
                              );
                            },
                            child: Container(
                              height: Get.height * .2,
                              width: Get.width * .4,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(.1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(4),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/commission.png"),
                                          )),
                                      InkWell(
                                          onTap: () {},
                                          child: Icon(Icons.more_vert,
                                              color: Colors.deepPurple))
                                    ],
                                  ),
                                  Text(
                                    "Total Commision".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ProgressLine(
                                    color: Colors.green,
                                    percentage: 11,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            controller.dailyReportDetails.value
                                                .total_commision!,
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Tk",
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      // Text(
                                      //   "77",
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .caption!
                                      //       .copyWith(color: Colors.white),
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: Get.height * .2,
                            width: Get.width * .4,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/icons/mbanking.png"),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.PACKAGELIST);
                                      },
                                      child: Icon(Icons.more_vert,
                                          color: Colors.deepPurple),
                                    )
                                  ],
                                ),
                                Text(
                                  "Mobile Banking".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                ProgressLine(
                                  color: Colors.green,
                                  percentage: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.dailyReportDetails.value
                                              .packagePurchase!,
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Tk",
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    // Text(
                                    //   "77",
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(color: Colors.white),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.put(BillpayReportController());
                              Get.find<BillpayReportController>().getBillHistory(fromNoti: true, dateTo:DateFormat('yyyy-MM-dd').format(
                                  controller.selectedDate.value), dateFrom : DateFormat('yyyy-MM-dd').format(
                                  controller.selectedDate.value) );
                              Get.toNamed(Routes.BILLPAY_REPORT);
                            },
                            child: Container(
                              height: Get.height * .2,
                              width: Get.width * .4,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(.1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(4),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/icons/billpay.png"),
                                          )),
                                      Icon(Icons.more_vert,
                                          color: Colors.deepPurple)
                                    ],
                                  ),
                                  Text(
                                    "Bill Pay".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ProgressLine(
                                    color: Colors.green,
                                    percentage: 11,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            controller.dailyReportDetails.value
                                                .bill_pay_amount!,
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Tk",
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      // Text(
                                      //   "77",
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .caption!
                                      //       .copyWith(color: Colors.white),
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: Get.height * .2,
                            width: Get.width * .4,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/drawer/report.png"),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.PACKAGELIST);
                                      },
                                      child: Icon(Icons.more_vert,
                                          color: Colors.deepPurple),
                                    )
                                  ],
                                ),
                                Text(
                                  "Package Purchase".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                ProgressLine(
                                  color: Colors.green,
                                  percentage: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.dailyReportDetails.value
                                              .packagePurchase!,
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Tk",
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    // Text(
                                    //   "77",
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(color: Colors.white),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: Get.height * .2,
                            width: Get.width * .4,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/eticket/bus.png"),
                                        )),
                                    Icon(Icons.more_vert,
                                        color: Colors.deepPurple)
                                  ],
                                ),
                                Text(
                                  "Ticket Purchase".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                ProgressLine(
                                  color: Colors.green,
                                  percentage: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.dailyReportDetails.value
                                              .packagePurchase!,
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Tk",
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    // Text(
                                    //   "77",
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption!
                                    //       .copyWith(color: Colors.white),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),

                      // GridView.count(
                      //
                      //     // physics: NeverScrollableScrollPhysics(),
                      //     primary: false,
                      //     shrinkWrap: true,
                      //     crossAxisCount: 1,
                      //     crossAxisSpacing: 18.0,
                      //     mainAxisSpacing: 8.0,
                      //     childAspectRatio: 4.0,
                      //     children: List.generate(controller.dailyReport.length,
                      //         (index) {
                      //       //Color randomColor = controller.getRandomColor();
                      //       return GestureDetector(
                      //         child: AnimationConfiguration.staggeredGrid(
                      //           position: index,
                      //           duration: const Duration(milliseconds: 475),
                      //           columnCount: 1,
                      //           child: SlideAnimation(
                      //             horizontalOffset: 50.0,
                      //             child: FadeInAnimation(
                      //               child: Container(
                      //                 width: _size.width,
                      //                 decoration: Ui.getBoxDecoration(
                      //                   color: Colors.white,
                      //                   radius: 5,
                      //                 ),
                      //                 child: Center(
                      //                   child: Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.spaceBetween,
                      //                     children: [
                      //                       Container(
                      //                         child: Row(
                      //                           children: [
                      //                             SizedBox(
                      //                               width: 15,
                      //                             ),
                      //                             Image.asset(
                      //                               controller
                      //                                       .dailyReport[index]
                      //                                   ['image'],
                      //                               height: 45,
                      //                               width: 45,
                      //                               // color: Color(0xFF652981),
                      //                             ),
                      //                             SizedBox(
                      //                               width: 15,
                      //                             ),
                      //                             Text(
                      //                               controller
                      //                                       .dailyReport[index]
                      //                                   ['title'],
                      //                               style: TextStyle(
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                   color: AppColors
                      //                                       .primaryColor),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                       Padding(
                      //                           padding: const EdgeInsets.only(
                      //                               right: 10),
                      //                           child: Text(
                      //                             '৳ ${controller.dailyReport[index]['balance']}',
                      //                             style: TextStyle(
                      //                                 fontWeight:
                      //                                     FontWeight.bold),
                      //                           ))
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     })),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
                height: _size.height,
                width: _size.width,
                child: Center(child: Ui.customLoader()));
          }
        }));
  }
}

// Obx(() {
//   if (controller.dailyReportLoaded.isTrue) {
//     return

//   } else {
//     return Container(
//         height: _size.height,
//         width: _size.width,
//         child: Center(child: Ui.customLoader()));
//   }
// })
