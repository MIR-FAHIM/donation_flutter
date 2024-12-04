// import 'dart:html';

import 'dart:io';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_flutter/app/modules/admin/controllers/admin_controller.dart';
import 'package:donation_flutter/app/modules/admin/widget/home_option_widget.dart';
import 'package:donation_flutter/app/modules/home/widgets/AmountWidget.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/custom_data.dart';
import 'package:donation_flutter/common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProjectDashboard extends GetView<AdminController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // drawer: RechargeDrawer(),
        // // endDrawer: RechargeDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size(65, 65),
          child: AppBar(
            backgroundColor: AppColors.primaryColor,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Text(controller.projectData.value.projectName!),
            elevation: 0,
          ),
        ),
        body:
            // print(controller.balance.value);+
            ListView(
          scrollDirection: Axis.vertical,
          children: [
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: Container(
                    //height: 180,
                    width: _size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 20, right: 20, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // controller.changeState();
                                },
                                child: Container(
                                  height: 145,
                                  width: 145,
                                  decoration: Ui.getBoxDecoration(
                                    color: AppColors.primaryColor,
                                    radius: 100,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                        height: 145,
                                        width: 145,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: AppColors.primaryColor,
                                            border: Border.all(
                                                width: 2, color: Colors.white)),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        // const Image(
                                                        //   height: 15,
                                                        //   width: 15,
                                                        //   image: AssetImage('assets/images/taka.png'),
                                                        //   color: Colors.white,
                                                        // ),
                                                        Obx(() {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 2.0,
                                                                    right: 5),
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                              child: Text(
                                                                '$uniCodeTk ${controller.projectAmount.value}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Balance'.tr,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 12,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.ALLUSER);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Add Donation'.tr,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.primaryColor,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          //Right Side 3 Item
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AmountWidget(
                                  image: 'assets/icons/user.png',
                                  amount: controller.userListDatum.value.length
                                      .toString(),
                                  title: 'Users'.tr,
                                  colors: AppColors.primaryColor,
                                  padding: "10"
                                  // colors: Colors.white,
                                  ),
                              const SizedBox(
                                height: 30,
                              ),
                              AmountWidget(
                                  image: 'assets/icons/eye.png',
                                  amount: '',
                                  colors: AppColors.primaryColor,
                                  title: 'Viewed'.tr,
                                  padding: "3"),
                              const SizedBox(
                                height: 30,
                              ),
                              AmountWidget(
                                  image: 'assets/icons/logo_charity.png',
                                  amount: controller.allDonationListByProject
                                      .where((d) =>
                                          d.id ==
                                          controller.projectData.value.id)
                                      .toList()
                                      .length
                                      .toString(),
                                  colors: AppColors.primaryColor,
                                  title: 'Pending'.tr,
                                  padding: "10"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //Card Option Widget
            AnimationConfiguration.staggeredList(
                position: 2,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(child: HomeTopOptionWidget()),
                )),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           Row(
            //             children: [
            //               Text(
            //                 "Server Fee",
            //                 style: TextStyle(
            //                   color: AppColors.textColorBlack,
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
            //               const Spacer(),
            //               Text(
            //                 "1%",
            //                 style: TextStyle(
            //                   color: AppColors.textColorBlack,
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
            //             ],
            //           ),
            //
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           Row(
            //             children: [
            //               Text(
            //                 "Service fee",
            //                 style: TextStyle(
            //                   color: AppColors.textColorBlack,
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
            //               const Spacer(),
            //               Text(
            //                 "1%",
            //                 style: TextStyle(
            //                   color: AppColors.textColorBlack,
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           Row(
            //             children: [
            //               Text(
            //                 "Developer fee",
            //                 style: TextStyle(
            //                   color: AppColors.textColorBlack,
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
            //               const Spacer(),
            //               Text(
            //                 "3%",
            //                 style: TextStyle(
            //                   color: AppColors.textColorBlack,
            //                   fontWeight: FontWeight.w400,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           Row(
            //             children: [
            //               Text(
            //                 "Total Fee",
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontWeight: FontWeight.w600,
            //                 ),
            //               ),
            //               const Spacer(),
            //               Text(
            //                 (((int.parse(controller.projectAmount.value))*5)/100).roundToDouble().toString(),
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontWeight: FontWeight.w600,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // )

            // SizedBox(
            //   height: 120,
            // ),
          ],
        ));
  }
}
