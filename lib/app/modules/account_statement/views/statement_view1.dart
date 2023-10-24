import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/common/ui.dart';
import '../controllers/statement_controller.dart';

class AccountStatementView extends GetView<AccountStatementController> {
  // InboxController controller = Get.put(InboxController());
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
          title: Text('Account Statement'.tr),

          elevation: 0,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Get.back();
          //       },
          //       icon: Icon(
          //         CupertinoIcons.bell,
          //         color: Colors.white70,
          //       )),
          //   IconButton(
          //       onPressed: () => {Scaffold.of(context).openEndDrawer()},
          //       icon: Icon(
          //         Icons.menu,
          //         color: Colors.white70,
          //       )),
          // ],
        ),
      ),
      body: Obx(() {
        return RefreshIndicator(
          color: Color(0xFF652981),
          onRefresh: () async {
            // await controller.getNotifications();
            // await controller.getTransactionTypes();
          },
          child: Container(
            width: _size.width,
            // height: _size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: _size.height * 0.1,
                  width: _size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.selectedIndex.value = 0;
                          },
                          child: Container(
                            width: Get.size.width * .45,
                            decoration: Ui.getBoxDecoration(
                              color: controller.selectedIndex.value == 0
                                  ? Color(0xFF652981)
                                  : Colors.white,
                              radius: 10,
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Transaction Details'.tr,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: controller.selectedIndex.value == 0
                                        ? Colors.white
                                        : Color(0xFF652981),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            controller.selectedIndex.value = 1;
                            // await controller.getTransactionTypes();
                          },
                          child: Container(
                            width: Get.size.width * .45,
                            decoration: Ui.getBoxDecoration(
                              color: controller.selectedIndex.value == 1
                                  ? Color(0xFF652981)
                                  : Colors.white,
                              radius: 10,
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Transactions Summary'.tr,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: controller.selectedIndex.value == 1
                                        ? Colors.white
                                        : Color(0xFF652981),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: _size.height * 0.75,
                    width: _size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          controller.pages[controller.selectedIndex.value],
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
