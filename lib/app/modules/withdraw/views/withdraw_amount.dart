import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/home/controllers/home_controller.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/controllers/withdraw_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';


class WithdrawAmount extends GetView<WithdrawController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: const Color(0xFF652981),
          centerTitle: true,
          title: Text('Withdraw'.tr),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TextFieldWidget(
              //   labelText: "Mobile Number".tr,
              //
              //   initialValue: '+880',
              //   // onSaved: (input) =>
              //   // controller.currentUser.value.email = input,
              //   // validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
              //   iconData: Icons.phone,
              //   imageData: null,
              // ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Obx(() {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Card(
                              elevation: 2,
                              child: SizedBox(
                                height: _size.width * .36,
                                width: _size.width,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Account Number'.tr,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection:
                                          Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 18.0,
                                                    top: 5),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(
                                                          top: 25),
                                                      child: SizedBox(
                                                        // color: Colors.blue,
                                                        width:
                                                        _size.width *
                                                            .5,
                                                        height: 70,
                                                        child:
                                                        TextFormField(
                                                          keyboardType:
                                                          TextInputType
                                                              .phone,

                                                          onTap: () {
                                                            controller
                                                                .keyboardText
                                                                .value =
                                                            'phone';
                                                          },
                                                          readOnly:true,


                                                          initialValue: controller.selectedBankInfo.value.accNo,



                                                          obscureText:
                                                          false,

                                                          textAlign:
                                                          TextAlign
                                                              .start,
                                                          cursorColor:
                                                          const Color(
                                                              0xFF652981),
                                                          decoration:
                                                          const InputDecoration(



                                                            focusColor: Color(
                                                                0xFF652981),
                                                            border: OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide
                                                                    .none),
                                                            focusedBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide.none),
                                                            enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide.none),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            30),
                                                      ),
                                                      child:
                                                      ClipRRect(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            30),
                                                        child:
                                                        Container(
                                                          height: Get.height*.02,
                                                          width: Get.width*.05,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(30),
                                                            child: CachedNetworkImage(
                                                              imageUrl: 'https://shl.com.bd/public/uploads/bank-logo/${controller.selectedBankInfo.value.logo_name}',

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
                                                                  image: AssetImage('assets/images/transaction.png'),
                                                                ),
                                                              ),
                                                              errorWidget: (context, url, error) => const Padding(
                                                                padding: EdgeInsets.all(5.0),
                                                                child: Image(
                                                                  image: AssetImage('assets/images/transaction.png'),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          Stack(
                            children: [
                              Container(
                                height: _size.width * .5,
                                width: _size.width,
                                decoration: Ui.getBoxDecoration(
                                    color: Colors.white, radius: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          controller.amountOfferFound.isTrue
                                              ? GestureDetector(
                                            onTap: () {
                                              // buildOfferDialog(controller.amountOffer.value);
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(8.0),
                                              child: Container(
                                                height: 25,
                                                width: 60,
                                                decoration:
                                                BoxDecoration(
                                                    border: Border
                                                        .all(
                                                      width: 1,
                                                      color: const Color(
                                                          0xFF652981),
                                                    ),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        10)),
                                                child: const Center(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.all(
                                                          3.0),
                                                      child: Text(
                                                        'Offer',
                                                        style: TextStyle(
                                                          color: Color(
                                                              0xFF652981),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          )
                                              : Wrap(),
                                          GestureDetector(
                                            onTap: () {
                                              controller.withdrawController.value.text = '500';
                                              //controller.amountCheck();
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 25,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: const Color(
                                                          0xFF652981),
                                                    ),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(10)),
                                                child: const Center(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.all(3.0),
                                                      child: Text(
                                                        '৳ 500',
                                                        style: TextStyle(
                                                          color:
                                                          Color(0xFF652981),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.withdrawController.value.text = '1000';
                                              // controller.amountCheck();
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 25,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: const Color(
                                                          0xFF652981),
                                                    ),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(10)),
                                                child: const Center(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.all(3.0),
                                                      child: Text(
                                                        '৳ 1000',
                                                        style: TextStyle(
                                                          color:
                                                          Color(0xFF652981),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.withdrawController.value.text = '2000';
                                              // controller.amountCheck();
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 25,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: const Color(
                                                          0xFF652981),
                                                    ),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(10)),
                                                child: const Center(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.all(3.0),
                                                      child: Text(
                                                        '৳ 2000',
                                                        style: TextStyle(
                                                          color:
                                                          Color(0xFF652981),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Obx(() {
                                        return Container(
                                          //  height: _size.width * .4,
                                          width: _size.width * .4,
                                          child: TextField(
                                            keyboardType:
                                            TextInputType.phone,
                                            controller: controller
                                                .withdrawController.value,
                                            onTap: () {
                                              controller.keyboardText
                                                  .value = 'amount';
                                            },
                                            autofocus: controller
                                                .mobileNumber
                                                .value
                                                .length ==
                                                11
                                                ? true
                                                : false,
                                            onChanged: (input) {
                                              // controller.amount.value = input;
                                              // controller.amountCheck();
                                              // controller.getCommission();
                                            },
                                            // validator: (input) => double.parse(input!.toString()) < 2 ? 'Minimum recharge amount is TK 2'.tr : null,
                                            style: const TextStyle(
                                              fontSize: 35.0,
                                              color: Color(0xFF652981),
                                            ),
                                            obscureText: false,

                                            textAlign: TextAlign.center,
                                            cursorColor:
                                            const Color(0xFF652981),
                                            decoration:
                                            const InputDecoration(
                                              labelStyle:
                                              TextStyle(fontSize: 35),
                                              hintText: '৳ 0',
                                              hintStyle:
                                              TextStyle(fontSize: 35),
                                              focusColor:
                                              const Color(0xFF652981),
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide.none),
                                              focusedBorder:
                                              OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide.none),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide.none),
                                            ),
                                          ),
                                        );
                                      }),
                                      SizedBox(width: 50,),

                                      // GestureDetector(
                                      //   onTap: () {
                                      //     if(controller.amountController.value.text.isNotEmpty && controller.numberController.value.text.length == 11){
                                      //       Get.toNamed(Routes.MBANKINGPIN);
                                      //     }else{
                                      //       Get.showSnackbar(Ui.ErrorSnackBar(message: "Please provide valid amount and phone number", title: 'Error'.tr));
                                      //
                                      //     }
                                      //
                                      //   },
                                      //   child: const Padding(
                                      //     padding: EdgeInsets.only(
                                      //         left: 8.0, right: 15),
                                      //     child: Image(
                                      //       height: 35,
                                      //       width: 35,
                                      //       image: AssetImage(
                                      //           'assets/images/arrow_for.png'),
                                      //       color: Color(0xFF652981),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child:
                                    //  Text(
                                    //   'Your Balance: ৳ ${Get.find<HomeController>().balance.value}',
                                    //   style: TextStyle(color: Color(0xFF652981)),
                                    // ),
                                    Text(
                                      'Your Balance: ৳ ${Get.find<HomeController>().balance}',
                                      style: const TextStyle(
                                          color: Color(0xFF652981)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // GestureDetector(
                          //   onTap: () {
                          //     controller.increment();
                          //   },
                          //   child: Row(
                          //     children: [
                          //       Icon(
                          //         Icons.add_circle_outline,
                          //         color: Color(0xFF652981),
                          //         size: 30,
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Text(
                          //         'Add Another Number'.tr,
                          //         style: TextStyle(color: Color(0xFF652981), fontSize: 16),
                          //       )
                          //     ],
                          //   ),
                          // ),

                          // controller.currentPage
                        ],
                      );
                    }),
                  ),
                  // Custom Number Pad
                ],
              ),
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
                        cursorColor: const Color(0xFF652981),
                        textAlign: TextAlign.center,
                        maxLength: 6,

                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: 'Enter PIN here'.tr,
                          hintStyle: const TextStyle(color: Color(0xFF652981), fontSize: 15),
                          prefixIcon: const Icon(
                            CupertinoIcons.lock,
                            color: Color(0xFF652981),
                          ).marginOnly(right: 14),

                          suffixIcon: IconButton(
                            onPressed: () {
                              if (controller.withdrawController.value.text.isNotEmpty) {
                                if (double.parse(controller.withdrawController.value.text) >= 10) {

                                  if (controller.pinController.value.text.isNotEmpty) {
                                    if(controller.selectedBankInfo.value.bankType == 1){
                                      controller.withdrawMoney();
                                    }else{
                                      // controller.moneyTransferController(accountNo:  controller.selectedBankInfo.value.accNo,
                                      //     gatewayID: controller.selectedBankInfo.value.bankName);
                                    }

                                    //
                                  } else {
                                    Get.showSnackbar(Ui.ErrorSnackBar(message: 'Please Enter Your PIN No'.tr, title: 'Error'.tr));
                                  }

                                } else {
                                  Get.showSnackbar(Ui.ErrorSnackBar(message: 'Minimum withdraw amount is 10'.tr, title: 'Error'.tr));
                                }
                              } else {
                                Get.showSnackbar(Ui.ErrorSnackBar(message: 'Please enter valid withdraw amount'.tr, title: 'Error'.tr));
                              }
                            },
                            icon: const Icon(
                              CupertinoIcons.arrow_right,
                              color: Color(0xFF652981),
                              size: 35,
                            ).marginOnly(right: 14),
                          ),
                          // floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusColor: const Color(0xFF652981),
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

            ],
          ),
        ),
      ),
    );
  }
}
