import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';

import '../controllers/withdraw_controller.dart';

class WithdrawView extends GetView<WithdrawController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MainDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          centerTitle: true,
          title: Text('Withdraw'.tr),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.white70,
                )),
            IconButton(
                onPressed: () => {Scaffold.of(context).openEndDrawer()},
                icon: Icon(
                  Icons.menu,
                  color: Colors.white70,
                )),
          ],
        ),
      ),
      // body: Obx(() {
      //   return SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         controller.bodyWidget[controller.bodyPageIndex.value],
      //         controller.bodyPageIndex.value < 2
      //             ? BlockButtonWidget(
      //                 onPressed: () {
      //                   if (controller.bodyPageIndex.value < 2) {
      //                     controller.bodyPageIndex.value++;
      //                   }
      //                 },
      //                 color: Color(0xFF652981),
      //                 text: Text(
      //                   "Next".tr,
      //                   style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
      //                 ),
      //               ).paddingSymmetric(vertical: 10, horizontal: 10)
      //             : Wrap(),
      //       ],
      //     ),
      //   );
      // })

      body: Obx(() {
        if (controller.userBankInfoLoaded.isTrue) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children:
                  List.generate(controller.userBankInformation.length, (index) {
                return GestureDetector(
                  onTap: () {
                    controller.selectedBankInfo.value =
                        controller.userBankInformation[index];
                    Get.toNamed(Routes.BANK_FOR_WITHDRAW);
                  },
                  child: ListTile(
                    leading: Image(
                      image: AssetImage('assets/images/user.png'),
                      color: Color(0xFF652981),
                    ),
                    title:
                        Text(controller.userBankInformation[index].bankName!),
                    subtitle: Text(
                        'A/C: ${controller.userBankInformation[index].accNo!}'),
                    trailing: Image(
                      image: AssetImage('assets/city.jpeg'),
                    ),
                  ),
                );
              }),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
