import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/icon_model.dart';
import 'package:latest_payplus_agent/app/modules/payment_collection/controllers/payment_collection_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class CardForPayment extends GetWidget<PaymentCollectionController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(mobileBank.length, (index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 475),
                  columnCount: 3,
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Container(
                          width: 60,
                          height: 50,
                          decoration: Ui.getBoxDecoration(
                              radius: 10, color: Colors.white),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage(mobileBank[index].image!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
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
                  cursorColor: Color(0xFF652981),
                  textAlign: TextAlign.start,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: 'Enter Card Number'.tr,
                    hintStyle:
                        TextStyle(color: Color(0xFF652981), fontSize: 15),

                    // floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusColor: Color(0xFF652981),
                  ),
                  keyboardType: TextInputType.phone,
                  // validator: (String? value) {
                  //
                  // },
                  onChanged: (input) {},
                ),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  width: _size.width * .4,
                  //  height: 50,
                  decoration: Ui.getBoxDecoration(radius: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: TextFormField(
                      cursorColor: Color(0xFF652981),
                      textAlign: TextAlign.center,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'MM/YY'.tr,
                        hintStyle:
                            TextStyle(color: Color(0xFF652981), fontSize: 15),

                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusColor: Color(0xFF652981),
                      ),
                      keyboardType: TextInputType.phone,
                      // validator: (String? value) {
                      //
                      // },
                      onChanged: (input) {},
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  width: _size.width * .4,
                  //  height: 50,
                  decoration: Ui.getBoxDecoration(radius: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: TextFormField(
                      cursorColor: Color(0xFF652981),
                      textAlign: TextAlign.start,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'CVC/CVV'.tr,
                        hintStyle:
                            TextStyle(color: Color(0xFF652981), fontSize: 15),

                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusColor: Color(0xFF652981),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.creditcard,
                            color: Color(0xFF652981),
                            size: 35,
                          ).marginOnly(right: 14),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      // validator: (String? value) {
                      //
                      // },
                      onChanged: (input) {},
                    ),
                  )),
            ),
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
                  cursorColor: Color(0xFF652981),
                  textAlign: TextAlign.start,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: 'Card Holder Name'.tr,
                    hintStyle:
                        TextStyle(color: Color(0xFF652981), fontSize: 15),

                    // floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusColor: Color(0xFF652981),
                  ),
                  keyboardType: TextInputType.phone,
                  // validator: (String? value) {
                  //
                  // },
                  onChanged: (input) {},
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Row(
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 2,
                  color: Color(0xFF652981),
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Save Card'.tr,
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        Text(
          'By Clicking the remember me, you agree to our Terms & Conditions.'
              .tr,
          style: TextStyle(
            color: Colors.black,
          ),
        ).paddingSymmetric(vertical: 5, horizontal: 20),
      ],
    );
  }
}
