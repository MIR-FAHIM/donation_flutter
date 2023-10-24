import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latest_payplus_agent/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class AddNumberWidget extends GetWidget<RechargeController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: _size.width * .45,
            //  height: 50,
            decoration: Ui.getBoxDecoration(radius: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: TextFormField(
                cursorColor: Color(0xFF652981),

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: '017xxxxxxxx'.tr,
                  hintStyle:
                      TextStyle(color: Get.theme.hintColor, fontSize: 15),
                  prefixIcon: Image.asset(
                    'assets/images/phone1.png',
                  ).marginOnly(
                    right: 10,
                    left: 8,
                    top: 2,
                  ),
                  prefixIconConstraints:
                      BoxConstraints.expand(width: 30, height: 30),
                  // floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusColor: Color(0xFF652981),
                ),
                keyboardType: TextInputType.phone,
                // validator: (String? value) {
                //
                // },
                onChanged: (String value) {},
              ),
            )),
        Container(
          width: _size.width * .15,
          height: 50,
          decoration: Ui.getBoxDecoration(color: Colors.white, radius: 5.0),
          child: DropdownButton(
            // Initial Value
            value: 'assets/images/gp.png',
            alignment: AlignmentDirectional.centerEnd,
            // Down Arrow Icon
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF652981),
            ),
            borderRadius: BorderRadius.circular(5),

            underline: SizedBox(),
            items: ['assets/images/gp.png'].map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Image.asset(
                    items,
                    height: 20,
                    width: 20,
                  ),
                ),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (newValue) {},
          ),
        ),
        Container(
            width: _size.width * .25,
            //  height: 50,
            decoration: Ui.getBoxDecoration(radius: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: TextFormField(
                cursorColor: Color(0xFF652981),

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: 'Amount'.tr,
                  hintStyle:
                      TextStyle(color: Get.theme.hintColor, fontSize: 15),
                  focusColor: Color(0xFF652981),
                ),
                keyboardType: TextInputType.phone,
                // validator: (String? value) {
                //
                // },
                onChanged: (String value) {},
              ),
            )),
      ],
    );
  }
}
