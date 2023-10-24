import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/add_balance/controllers/add_balance_controller.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';



class AddBalanceSuccessView extends GetView<AddbalanceController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF652981),
          centerTitle: true,
          title: Text('Add Balance'.tr),
          elevation: 0,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () => Get.back(),
          // ),
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
      body: Stack(
        children: [
          Container(
            height: Get.size.height,
            width: Get.size.width,
          ),
          Positioned(
            top: Get.size.width / 3,
            bottom: Get.size.width / 3,
            left: 20,
            right: 20,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: _size.width,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.8),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Container(
                              height: _size.height *.17,
                              width: _size.width ,
                              //  color: Colors.blue.withOpacity(.5),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Bank",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                        Text(
                                          "${controller.bankName.value}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        Text(
                                          "Mobile Number",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                        Text(
                                          "${controller.bankData["mobile"]}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        Text(
                                          "Invoice No.",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                        Text(
                                          "${controller.bankData["invoice_id"]}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(

                                                  "Amount",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black54
                                                  ),
                                                ),
                                                Text(
                                                  "${controller.amount.value} BDT",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Charge",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                              "${controller.bankData["charge"]}" + " BDT",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ),






                        ],
                      ),
                    ),
                  ),

                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Your Request has been accepted.'.tr,
                          style: TextStyle(fontSize: 20, color: Color(0xFF652981)),
                        ),
                        Text(
                          'Complete your payment through bank'.tr,
                          style: TextStyle(fontSize: 20, color: Color(0xFF652981)),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),


                       BlockButtonWidget(
                        onPressed: () {
                          Get.back();
                          Get.back();

                          controller.amount.value = "";

                          // Get.offAndToNamed(Routes.RECHARGE);
                          // Get.offAllNamed(Routes.RECHARGE);

                          Get.toNamed(Routes.Add_Balance_Form_View);

                          // controller.amountFocusFocus.requestFocus();
                        },
                        color: Color(0xFF652981),
                        text: Text(
                          "BACK TO ADD BALANCE".tr,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 40, horizontal: 30),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
