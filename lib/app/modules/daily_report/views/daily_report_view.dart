import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
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
                    children: [
                      DefaultTabController(
                        initialIndex: controller.monthSelection.value - 1,
                        length: 12,
                        child: Container(
                          height: 30,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Container(
                                  width: 70,
                                  child: DropdownButton<String>(
                                    value: controller.dropdownValue.value,
                                    isExpanded: true,
                                    icon:
                                    Icon(Icons.arrow_drop_down_outlined),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.transparent,
                                    ),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.

                                      controller.dropdownValue.value = value!;
                                        controller.yearSelection.value =
                                            int.parse(controller.dropdownValue.value );
                                        controller.getDailyReport(date:DateTime.now());

                                    },
                                    items: controller.yearList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                MediaQuery.of(context).size.width - 150,
                                child: DefaultTabController(
                                  initialIndex: controller.monthSelection.value - 1,
                                  length: 12,
                                  child: TabBar(
                                    indicator: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: Get.theme.primaryColorLight),
                                    isScrollable: true,
                                    indicatorColor: Colors.black,
                                    labelColor: Colors.black,
                                    onTap: (index) {

                                        controller.monthSelection.value = index + 1;

                                    },
                                    tabs: controller.tabs
                                        .map((tab) => Tab(
                                      icon: Padding(
                                        padding:
                                        const EdgeInsets.all(4.0),
                                        child: Text(
                                          tab,
                                          style:
                                          TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: DefaultTabController(
                          initialIndex: controller.daySelection.value - 1,
                          length: 31,
                          child: Column(
                            children: [
                              TabBar(
                                isScrollable: true,
                                indicatorColor: Colors.black38,
                                labelColor: Colors.black,
                                onTap: (index) {

                                  controller.daySelection.value = index + 1;

                                },
                                tabs: controller.dayTab
                                    .map((tab) => Tab(
                                  icon: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Text(
                                      tab.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GridView.count(

                          // physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                          crossAxisCount: 1,
                          crossAxisSpacing: 18.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 4.0,
                          children: List.generate(controller.dailyReport.length,
                              (index) {
                            return GestureDetector(
                              child: AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 475),
                                columnCount: 1,
                                child: SlideAnimation(
                                  horizontalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: Container(
                                      width: _size.width,
                                      decoration: Ui.getBoxDecoration(
                                        color: Colors.white,
                                        radius: 5,
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Image.asset(
                                                    controller
                                                            .dailyReport[index]
                                                        ['image'],
                                                    height: 45,
                                                    width: 45,
                                                    // color: Color(0xFF652981),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    controller
                                                            .dailyReport[index]
                                                        ['title'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Text(
                                                  '৳ ${controller.dailyReport[index]['balance']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
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
