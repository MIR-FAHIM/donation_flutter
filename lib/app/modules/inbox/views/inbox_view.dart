import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/inbox_controller.dart';

class InboxView extends GetView<InboxController> {
  InboxController controller = Get.put(InboxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MainDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: const Color(0xFF652981),
          centerTitle: true,
          title: Text('Inbox'.tr),
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.Notification_View);
                },
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: Colors.white70,
                )),
            IconButton(
                onPressed: () => {Scaffold.of(context).openEndDrawer()},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white70,
                )),
          ],
        ),
      ),
      body: Obx(() {
        return RefreshIndicator(
          color: const Color(0xFF652981),
          onRefresh: () async {
            await controller.getNotifications();
            await controller.getTransactionTypes();
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       IconButton(
                //           onPressed: () {},
                //           icon: const Icon(
                //             Icons.arrow_back_ios,
                //             color: const Color(0xFF652981),
                //           )),
                //       const Text(
                //         'January-2022',
                //         style: const TextStyle(
                //           color: const Color(0xFF652981),
                //         ),
                //       ),
                //       IconButton(
                //           onPressed: () {},
                //           icon: const Icon(
                //             Icons.arrow_forward_ios,
                //             color: Color(0xFF652981),
                //           )),
                //     ],
                //   ),
                // ),
                Padding(
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
                                ? const Color(0xFF652981)
                                : Colors.white,
                            radius: 10,
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Notification',
                              style: TextStyle(
                                color: controller.selectedIndex.value == 0
                                    ? Colors.white
                                    : const Color(0xFF652981),
                              ),
                            ),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          controller.selectedIndex.value = 1;
                          controller.getTransactionReport();
                        },
                        child: Container(
                          width: Get.size.width * .45,
                          decoration: Ui.getBoxDecoration(
                            color: controller.selectedIndex.value == 1
                                ? const Color(0xFF652981)
                                : Colors.white,
                            radius: 10,
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Transactions'.tr,
                              style: TextStyle(
                                color: controller.selectedIndex.value == 1
                                    ? Colors.white
                                    : const Color(0xFF652981),
                              ),
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                controller.pages[controller.selectedIndex.value]
              ],
            ),
          ),
        );
      }),
    );
  }
}
