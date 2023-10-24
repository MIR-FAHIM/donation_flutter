import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/add_balance/controllers/add_balance_controller.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../../../../common/Color.dart';
import '../../../routes/app_pages.dart';

class ConfirmBankPayView extends GetView<AddbalanceController> {
  @override
  Widget build(BuildContext context) {
    // var _name = Get.arguments['name'];
    // var _images = Get.arguments['images'];
    // var _code = Get.arguments['code'];
    // var _name = controller.mfsName.value;
    // var _images = controller.mfsLogo.value;

    //controller.gateway.value = _code;
    final _size = Get.size;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: PreferredSize(
          preferredSize: Size(65, 65),
          child: AppBar(
            backgroundColor: Color(0xFF652981),
            centerTitle: true,
            title: Text("Add Balance".tr),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         CupertinoIcons.bell,
            //         color: Colors.white70,
            //       )),
            // ],
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Obx(
                  () {
                return Container(
                  // width: _size.width,
                  height: _size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 10,
                        ),

                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height *.3,
                              child: Column(
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
                                                          "Reference ID.",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w500,
                                                              color: Colors.white
                                                          ),
                                                        ),
                                                        Text(
                                                          "${controller.bankData["reference"]}",
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
                                                      mainAxisAlignment: MainAxisAlignment.end,

                                                      children: [

                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Charge",
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.normal,
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                            SizedBox(width: 10,),
                                                            Text(
                                                              "${controller.bankData["charge"]}" + " BDT",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
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

                                ],
                              ),
                            ),
                            Positioned(
                              left: 20,
                             top: 110,
                              child:  Container(
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54, width: 1),

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
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black54
                                        ),
                                      ),
                                      Text(
                                        "${controller.amount.value} BDT",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),


                        SizedBox(
                          height: 80,
                        ),


                        GestureDetector(
                          onTap: (){
                            controller.confirmBankPayController();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: _size.width,
                              height: _size.height* .07,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(child: Text("Confirm".tr,style: TextStyle(color: Colors.white),))
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.Add_Balance_Form_View);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: _size.width,
                                height: _size.height* .07,
                                padding: EdgeInsets.all(8),

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                color: Colors.black54, width: 1),
                                ),
                                child: Center(child: Text("Cancel".tr,))
                            ),
                          ),
                        ),

                        controller.grpValue.value == 3
                            ?Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(

                                  'Example of Deposit Slip',
                                  style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *.3,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color:  Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 1,
                                      color:AppColors.primaryColor,
                                    ),),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("ID: ",style: TextStyle(fontSize: 8, color: Colors.black),),
                                            Text("125464 ",style: TextStyle(fontSize: 8, color: Colors.green),),
                                            Text("(এপ্সে প্রদত্ত আইডি নম্বর এখানে লিখুন)", style: TextStyle(fontSize: 8, color: Colors.red),),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Bank",style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),),
                                            Text("DEPOSIT SLIP",style: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.bold),),
                                            Text("Slip Copy", style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Date",style: TextStyle(fontSize: 8, color: Colors.black),),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 1,
                                          width: 100,
                                          color: Colors.black54,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Account Number *",style: TextStyle(fontSize: 10, color: Colors.black),),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            width: _size.width*.5,
                                            decoration: BoxDecoration(
                                              color:  Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(
                                                width: 0.5,
                                                color:Colors.green.withOpacity(.5),
                                              ),),
                                            child: Text("  এপ্সে প্রদত্ত একাউন্ট নম্বর লিখুন -(${controller.bankData["reference"]})",style: TextStyle(fontSize: 10, color: Colors.green),)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text("Account Name *    ",style: TextStyle(fontSize: 10, color: Colors.black),),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("এপ্সে প্রদত্ত কোম্পানীর নাম লিখুন  ",style: TextStyle(fontSize: 8, color: Colors.green),),
                                                    Text("(Service Hub Limited) ",style: TextStyle(fontSize: 8, color: Colors.red),),

                                                  ],
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 200,
                                                  color: Colors.black54,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: _size.width *.95,
                                          height: _size.height *.1,
                                          child: Row(
                                            children: [
                                              Card(
                                                child: Container(
                                                  color: Colors.white,
                                                  width: MediaQuery.of(context).size.width*.43,
                                                  height: _size.height *.09,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Table(
                                                      border: TableBorder.all(),
                                                      children: [
                                                        TableRow(
                                                          decoration: BoxDecoration(color: Colors.white),
                                                          children: [
                                                            TableCell(
                                                              child: Center(
                                                                child: Text(
                                                                  'Bank name & branch',
                                                                  style: TextStyle(color: Colors.black, fontSize: 8),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                child: Text(
                                                                  'Cheque',
                                                                  style: TextStyle(color: Colors.black, fontSize: 8),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                child: Text(
                                                                  'Tk',
                                                                  style: TextStyle(color: Colors.black, fontSize: 8),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                child: Text(
                                                                  'Ps',
                                                                  style: TextStyle(color: Colors.black, fontSize: 8),
                                                                ),
                                                              ),
                                                            ),


                                                          ],
                                                        ),

                                                        TableRow(
                                                          children: [
                                                            TableCell(
                                                              child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      ' ',
                                                                      style: TextStyle(color: Colors.black, fontSize: 12),
                                                                    ),
                                                                  )),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      ' ',
                                                                      style: TextStyle(color: Colors.black, fontSize: 12),
                                                                    ),
                                                                  )),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      ' ',
                                                                      style: TextStyle(color: Colors.black, fontSize: 12),
                                                                    ),
                                                                  )),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      '',
                                                                      style: TextStyle(color: Colors.black, fontSize: 12),
                                                                    ),
                                                                  )),
                                                            ),

                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                child: Container(
                                                  color: Colors.white,
                                                  width: MediaQuery.of(context).size.width*.43,
                                                  height: _size.height *.09,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Table(
                                                      border: TableBorder.all(),
                                                      children: [
                                                        TableRow(
                                                          decoration: BoxDecoration(color: Colors.white),
                                                          children: [
                                                            TableCell(
                                                              child: Center(
                                                                child: Text(
                                                                  'Cash Denomination',
                                                                  style: TextStyle(color: Colors.black, fontSize: 8),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                child: Text(
                                                                  'Cheque',
                                                                  style: TextStyle(color: Colors.black, fontSize: 8),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                child: Text(
                                                                  'Tk',
                                                                  style: TextStyle(color: Colors.black, fontSize: 8),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                child: Text(
                                                                  'Ps',
                                                                  style: TextStyle(color: Colors.black, fontSize: 8),
                                                                ),
                                                              ),
                                                            ),


                                                          ],
                                                        ),

                                                        TableRow(
                                                          children: [
                                                            TableCell(
                                                              child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      ' ',
                                                                      style: TextStyle(color: Colors.black, fontSize: 12),
                                                                    ),
                                                                  )),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      ' ',
                                                                      style: TextStyle(color: Colors.black, fontSize: 12),
                                                                    ),
                                                                  )),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      ' ',
                                                                      style: TextStyle(color: Colors.black, fontSize: 12),
                                                                    ),
                                                                  )),
                                                            ),
                                                            TableCell(
                                                              child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      '',
                                                                      style: TextStyle(color: Colors.black, fontSize: 12),
                                                                    ),
                                                                  )),
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
                                        Row(
                                          children: [
                                            Text("Total Amounts (In Word)_____________________   ",style: TextStyle(fontSize: 8, color: Colors.black),),
                                            Text("Mobile Number______________ ",style: TextStyle(fontSize: 8, color: Colors.black),),],
                                        ),
                                        Row(
                                          children: [
                                            Text("Name of Depositor__________________________   ",style: TextStyle(fontSize: 8, color: Colors.black),),
                                            Text("Sign of Depositor______________ ",style: TextStyle(fontSize: 8, color: Colors.black),),],
                                        ),
                                      ],
                                    ),
                                  ),

                                ),
                              )
                            ],
                          ),
                        ) : Container(),



                      ],
                    ),
                  ),
                );
              }
          ),
        ));
  }
}
