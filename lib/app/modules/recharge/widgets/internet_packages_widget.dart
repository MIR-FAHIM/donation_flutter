import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class InternetPackageWidget extends GetWidget<RechargeController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.internetLoaded.isTrue) {
        return SingleChildScrollView(
            child: Column(


          children: List.generate(controller.internetPackage.length, (index) {

            return GestureDetector(
              onTap: () {
                controller.cashBackAmount.value = '';
                controller.cashBackPackageName.value = '';
                controller.amountController.value.text =
                    controller.internetPackage[index].offerAmount!.toString();
                controller.amountOffer.value = controller.internetPackage[index];
                controller.amount.value = controller.amountController.value.text;
                controller.updateAmountAtIndex(controller.selectedIndex.value, controller.amountController.value.text);

                print("my recharge number list is amount is ${controller.rechargeNumberList[0].amount}");


                // controller.getCommission(true);
                // if (controller.rechargeNumber.value.length == 11) {
                //   Get.toNamed(Routes.RECHARGEPIN);
                // } else {
                //   Get.showSnackbar(Ui.ErrorSnackBar(
                //       message: 'Please provide valid phone number'.tr,
                //       title: 'Error'.tr));
                // }
              },
              child:  controller.internetPackage[index]
                  .commision! == 0 ?
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    width: _size.width,
                    decoration:
                    Ui.getBoxDecoration(color: Colors.white, radius: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, bottom: 6, left: 0, right: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: _size.width,
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/recharge/world.png',
                                            height: 20,
                                            width: 20,
                                            color: Get.theme.primaryColor.withOpacity(.9),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                              child: Text(
                                                controller.internetPackage[index]
                                                    .package!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.homeTextColor1,
                                                    fontSize: 15),
                                                maxLines: 2,
                                              )),
                                          Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Get.theme.primaryColor,
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(4.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '৳${controller.internetPackage[index].offerAmount!}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2, left: 0),
                                                child: Icon(
                                                  Icons.punch_clock_rounded,
                                                  color: Get
                                                      .theme.primaryColor.withOpacity(0.9),
                                                )),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              controller.internetPackage[index]
                                                  .offerValidity!,
                                              style: TextStyle(
                                                  color:
                                                  AppColors.homeTextColor1,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),


                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  )):
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    width: _size.width,
                    decoration:
                    Ui.getBoxDecoration(color: Colors.white, radius: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, bottom: 6, left: 0, right: 10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            height: 25,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Get.theme.primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text(
                                  'CashBack'.tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: _size.width,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/recharge/world.png',
                                          height: 15,
                                          width: 15,
                                          color: Get.theme.primaryColor.withOpacity(.9),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                            child: Text(
                                              controller.internetPackage[index]
                                                  .package!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.homeTextColor1,
                                                  fontSize: 15),
                                              maxLines: 2,
                                            )),
                                        Container(
                                          height: 30,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: Get.theme.primaryColor,
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(4.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '৳${controller.internetPackage[index].offerAmount!}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, left: 0),
                                              child: Icon(
                                                Icons.punch_clock_rounded,
                                                color: Get.theme.primaryColor.withOpacity(.9),
                                              )),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            controller.internetPackage[index]
                                                .offerValidity!,
                                            style: TextStyle(
                                                color:
                                                AppColors.homeTextColor1,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, left: 22),
                                              child: Icon(
                                                Icons
                                                    .star_border_purple500_sharp,
                                                color: Get.theme.primaryColor.withOpacity(.9),
                                              )),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            controller.internetPackage[index]
                                                .commision!
                                                .toString() + "Tk ${'CashBack'.tr}",
                                            style: TextStyle(
                                                color:
                                                AppColors.homeTextColor1,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )),
            );
          }),
        ));
      } else {
        return Container(
          height: _size.width,
          child: Center(
            child: Ui.customLoader(),
          ),
        );
      }
    });
  }
}
