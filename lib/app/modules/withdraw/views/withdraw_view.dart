import 'package:cached_network_image/cached_network_image.dart';
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
                    leading: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: 'https://shl.com.bd/public/uploads/bank-logo/${controller.userBankInformation[index].logo_name!}',
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
                              image: AssetImage('assets/images/bank.png'),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image(
                              image: AssetImage('assets/images/bank.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title:
                        Text(controller.userBankInformation[index].bankName!),
                    subtitle: Text(
                        'A/C: ${controller.userBankInformation[index].accNo!}'),

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
