import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';


import '../controllers/withdraw_controller.dart';

class ChangeAccountView extends GetView<WithdrawController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: const Color(0xFF652981),
          centerTitle: true,
          title: Text('Change Account'.tr),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
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
              children: List.generate(controller.userBankInformation.length, (index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Container(
                        height: Get.height*.15,
                        width: Get.width*.2,
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
                      title: Text(controller.userBankInformation[index].bankName!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('A/C: ${controller.userBankInformation[index].accNo!}'),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  controller.selectedBankInfo.value = controller.userBankInformation[index];
                                  if(controller.selectedBankInfo.value.bankType == 2){
                                    //Get.toNamed(Routes.CHANGE_MOBILE_BANK_INFORMATION, arguments: [controller.selectedBankInfo.value] );
                                  } else {
                                    Get.toNamed(Routes.CHANGE_BANK_INFORMATION,arguments: [controller.selectedBankInfo.value]);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  height: Get.height*.06,
                                  width: Get.width*.2,

                                  child: Center(child: Text("Update", style: TextStyle(color: Colors.white),)),
                                ),
                              ),
                              InkWell(
                                onTap: (){

                                  controller.showPopup(controller.userBankInformation[index].id.toString());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent.withOpacity(.6),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  height: Get.height*.06,
                                  width: Get.width*.2,

                                  child: Center(child: Text("Remove", style: TextStyle(color: Colors.white),)),
                                ),
                              ),
                              Container(width: 100,)
                            ],
                          )
                        ],
                      ),

                      // trailing: Image(
                      //   image: AssetImage('assets/city.jpeg'),
                      // ),
                    ),

                  ],
                );
              }),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
