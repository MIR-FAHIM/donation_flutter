import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/recharge_controller.dart';

class RechargePINView extends GetView<RechargeController> {
  RechargeController controller = Get.put(RechargeController());
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    print('Recharge number : ${controller.rechargeNumber.value}');

    print('cashback amount : ${controller.cashBackAmount.value}');

    // print('cashback amount : ${controller.amountController.clear}');

    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size(65, 65),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFF652981),
              centerTitle: true,
              title: Text(
                'Mobile Recharge'.tr,
                style: TextStyle(fontSize: 15),
              ),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Get.back(),
              ),
              // actions: [
              //   IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         CupertinoIcons.bell,
              //         color: Colors.white70,
              //       )),
              // ]
            ),
          ),
          body:  GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    width: _size.width,
                    height: _size.height,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          // Container(
                          //   padding: EdgeInsets.only(top: 10, bottom: 14, left: 20, right: 0),
                          //   margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(5),
                          //     boxShadow: [
                          //       BoxShadow(color: AppColors.primaryColor.withOpacity(0.2), blurRadius: 2, offset: Offset(0, 2)),
                          //     ],
                          //     //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                          //   ),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.stretch,
                          //     children: [
                          //       Text(
                          //         "Mobile No".tr,
                          //         style: Get.textTheme.bodyText1,
                          //         textAlign: TextAlign.start,
                          //       ),
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             width: Get.size.width * .6,
                          //             child: TextFormField(
                          //               keyboardType: TextInputType.phone,
                          //               readOnly: true,
                          //               initialValue: controller.rechargeNumber.value,
                          //               onChanged: (input) {
                          //                 controller.rechargeNumber.value = input.replaceAll('+88', '');
                          //                 print(controller.rechargeNumber.value);
                          //                 for (var item in operators) {
                          //                   print(item.name);
                          //                   if (controller.rechargeNumber.value.length > 3) {
                          //                     if (controller.rechargeNumber.value.substring(0, 3) == item.name) {
                          //                       print(controller.rechargeNumber.value.substring(0, 3) == item.name);
                          //                       controller.simOperatorLogo.value = item.logo!;
                          //                       controller.simOperator.value = item.id!.toString();
                          //                     }
                          //                   }
                          //                 }
                          //               },
                          //               validator: (input) => input!.length < 11 ? 'Please provide valid phone number' : null,
                          //               style: Get.textTheme.bodyText2,
                          //               obscureText: false,
                          //               textAlign: TextAlign.center,
                          //               cursorColor: AppColors.primaryColor,
                          //               decoration: Ui.getInputDecoration(
                          //                 hintText: 'Mobile Number'.tr,
                          //                 iconData: CupertinoIcons.device_phone_portrait,
                          //               ),
                          //             ),
                          //           ),
                          //           Padding(
                          //               padding: const EdgeInsets.only(right: 15.0),
                          //               child: controller.simOperatorLogo.value != ''
                          //                   ? Container(
                          //                       decoration: BoxDecoration(
                          //                         color: Colors.grey.shade100,
                          //                         borderRadius: BorderRadius.circular(50),
                          //                       ),
                          //                       child: Padding(
                          //                         padding: const EdgeInsets.all(8.0),
                          //                         child: Image.asset(
                          //                           controller.simOperatorLogo.value,
                          //                           height: 35,
                          //                           width: 35,
                          //                         ),
                          //                       ),
                          //                     )
                          //                   : Text('')),
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),

                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Card(
                              elevation: 2,
                              child: Container(
                                height: _size.width * .3,
                                width: _size.width,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mobile Number'.tr,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25.0, top: 5),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/icons/phnbk.png',
                                                      height: 40,
                                                      width: 40,
                                                      // color: Colors.grey,
                                                    ),
                                                    Container(
                                                      width: _size.width * .5,
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType.phone,
                                                        initialValue: controller
                                                            .rechargeNumber
                                                            .value,
                                                        validator: (input) =>
                                                            input!.length < 11
                                                                ? 'Please provide valid phone number'
                                                                : null,
                                                        style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                        obscureText: false,
                                                        textAlign:
                                                            TextAlign.start,
                                                        readOnly: true,
                                                        cursorColor: AppColors
                                                            .primaryColor,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              '01xxxxxxxxx',
                                                          hintStyle: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.grey,
                                                          ),
                                                          focusColor: AppColors
                                                              .primaryColor,
                                                          border:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15.0),
                                                  child:
                                                      controller.simOperatorLogo
                                                                  .value !=
                                                              ''
                                                          ? Stack(
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade100,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      controller
                                                                          .simOperatorLogo
                                                                          .value,
                                                                      height:
                                                                          35,
                                                                      width: 35,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : const Text('')),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: _size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: Ui.getBoxDecoration(
                                          color: Colors.white, radius: 5),
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  'Amount'.tr,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Center(
                                                child: Text(
                                                  '৳ ${controller.amountController.value.text}',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: Ui.getBoxDecoration(
                                          color: Colors.white, radius: 5),
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  'Commission'.tr,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Center(
                                                child: Text(
                                                  '৳ ${controller.commission.value}',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                  controller.cashBackAmount.value != ''
                                      ? Expanded(
                                          child: Container(
                                            decoration: Ui.getBoxDecoration(
                                                color: Colors.white, radius: 5),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        'CashBack'.tr,
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        '৳ ${controller.cashBackAmount.value}',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),

                          //Package Name and Offer

                          // controller.amountOffer.value.package != null
                          //     ? Padding(
                          //         padding: const EdgeInsets.all(15.0),
                          //         child: Container(
                          //           width: _size.width,
                          //           decoration: Ui.getBoxDecoration(
                          //               color: Colors.white, radius: 5),
                          //           child: Padding(
                          //               padding: const EdgeInsets.all(10.0),
                          //               child: SingleChildScrollView(
                          //                 scrollDirection: Axis.horizontal,
                          //                 child: Row(
                          //                   children: [
                          //                     Row(
                          //                       children: [
                          //                         Image.asset(
                          //                           'assets/recharge/gb.png',
                          //                           height: 20,
                          //                           width: 20,
                          //                         ),
                          //                         SizedBox(
                          //                           width: 4,
                          //                         ),
                          //                         Text(controller.amountOffer.value
                          //                                 .package ??
                          //                             ''),
                          //                       ],
                          //                     ),
                          //                     SizedBox(
                          //                       width: 5,
                          //                     ),
                          //                     Row(
                          //                       children: [
                          //                         Icon(
                          //                           Icons.access_time_sharp,
                          //                           color: AppColors.primaryColor,
                          //                         ),
                          //                         SizedBox(
                          //                           width: 4,
                          //                         ),
                          //                         Text(controller.amountOffer.value
                          //                                 .offerValidity ??
                          //                             ''),
                          //                       ],
                          //                     ),
                          //                   ],
                          //                 ),
                          //               )),
                          //         ),
                          //       )
                          //     : controller.cashBackPackageName.value != ''
                          //         ? Padding(
                          //             padding: const EdgeInsets.all(15.0),
                          //             child: Container(
                          //               width: _size.width,
                          //               decoration: Ui.getBoxDecoration(
                          //                   color: Colors.white, radius: 5),
                          //               child: Padding(
                          //                   padding: const EdgeInsets.all(10.0),
                          //                   child: SingleChildScrollView(
                          //                     scrollDirection: Axis.horizontal,
                          //                     child: Row(
                          //                       children: [
                          //                         Row(
                          //                           children: [
                          //                             Image.asset(
                          //                               'assets/recharge/gb.png',
                          //                               height: 20,
                          //                               width: 20,
                          //                             ),
                          //                             SizedBox(
                          //                               width: 4,
                          //                             ),
                          //                             Text(controller
                          //                                 .cashBackPackageName.value),
                          //                           ],
                          //                         ),
                          //                         SizedBox(
                          //                           width: 5,
                          //                         ),
                          //                         Row(
                          //                           children: [
                          //                             Icon(
                          //                               Icons.access_time_sharp,
                          //                               color: AppColors.primaryColor,
                          //                             ),
                          //                             SizedBox(
                          //                               width: 4,
                          //                             ),
                          //                             Text(controller
                          //                                 .cashBackValidaity.value),
                          //                           ],
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   )),
                          //             ),
                          //           )
                          //         : Container(),

                          controller.cashBackPackageName.value != ''
                              ? Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: _size.width,
                                    decoration: Ui.getBoxDecoration(
                                        color: Colors.white, radius: 5),
                                    child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/recharge/gb.png',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(controller
                                                      .cashBackPackageName
                                                      .value),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time_sharp,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(controller
                                                      .cashBackValidaity.value),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                )
                              : controller.amountOffer.value.package != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: _size.width,
                                        decoration: Ui.getBoxDecoration(
                                            color: Colors.white, radius: 5),
                                        child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/recharge/offer.png',
                                                        height: 18,
                                                        width: 18,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        controller
                                                                .amountOffer
                                                                .value
                                                                .package ??
                                                            '',
                                                        style: const TextStyle(
                                                            fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.access_time_sharp,
                                                      color: AppColors
                                                          .primaryColor,
                                                      size: 18,
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      controller
                                                              .amountOffer
                                                              .value
                                                              .offerValidity ??
                                                          '',
                                                      style: const TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ),
                                    )
                                  : Container(),

                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: _size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Expanded(
                                  //   child: Text(
                                  //     'Select Type'.tr,
                                  //     style: TextStyle(
                                  //       color: AppColors.primaryColor,
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.number_type.value =
                                            'Prepaid';
                                      },
                                      child: Container(
                                        decoration: Ui.getBoxDecoration(
                                            color:
                                                controller.number_type.value ==
                                                        'Prepaid'
                                                    ? AppColors.primaryColor
                                                    : Colors.white,
                                            radius: 5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              'Prepaid'.tr,
                                              style: TextStyle(
                                                color: controller.number_type
                                                            .value !=
                                                        'Prepaid'
                                                    ? AppColors.primaryColor
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.number_type.value =
                                            'Postpaid';
                                      },
                                      child: Container(
                                        decoration: Ui.getBoxDecoration(
                                            color:
                                                controller.number_type.value ==
                                                        'Postpaid'
                                                    ? AppColors.primaryColor
                                                    : Colors.white,
                                            radius: 5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              'Postpaid'.tr,
                                              style: TextStyle(
                                                color: controller.number_type
                                                            .value !=
                                                        'Postpaid'
                                                    ? AppColors.primaryColor
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  controller.simOperator.value == '1'
                                      ? Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.number_type.value =
                                                  'Skitto';
                                            },
                                            child: Container(
                                              decoration: Ui.getBoxDecoration(
                                                  color: controller.number_type
                                                              .value ==
                                                          'Skitto'
                                                      ? AppColors.primaryColor
                                                      : Colors.white,
                                                  radius: 5),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    'Skitto'.tr,
                                                    style: TextStyle(
                                                      color: controller
                                                                  .number_type
                                                                  .value !=
                                                              'Skitto'
                                                          ? AppColors
                                                              .primaryColor
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Wrap(),
                                ],
                              ),
                            ),
                          ),

                          //pin
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                                width: _size.width,
                                //  height: 50,
                                decoration: Ui.getBoxDecoration(radius: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: controller.pinController.value,
                                    cursorColor: AppColors.primaryColor,
                                    textAlign: TextAlign.center,
                                    maxLength: 6,

                                    decoration: InputDecoration(
                                      counterText: "",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none,
                                      hintText: 'Enter PIN here'.tr,
                                      hintStyle: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 15),
                                      prefixIcon: Icon(
                                        CupertinoIcons.lock,
                                        color: AppColors.primaryColor,
                                      ).marginOnly(right: 14),

                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.recharge();

                                          print("sahed");
                                          controller.pinController.value
                                              .clear();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.arrow_right,
                                          color: AppColors.primaryColor,
                                          size: 35,
                                        ).marginOnly(right: 14),
                                      ),
                                      // floatingLabelBehavior: FloatingLabelBehavior.never,
                                      focusColor: AppColors.primaryColor,
                                    ),
                                    focusNode: controller.pinFocusFocus.value,
                                    keyboardType: TextInputType.phone,
                                    // validator: (String? value) {
                                    //
                                    // },
                                    onChanged: (input) {
                                      controller.pinNumber.value = input;
                                    },
                                  ),
                                )),
                          ),
                          // controller.currentPage
                        ],
                      ),
                    ),
                  ),
                )

      );
    });
  }
}
