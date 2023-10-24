import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';

class DescoPrepaidFormView extends GetView {
  @override
  Widget build(BuildContext context) {
    var _title = Get.arguments['title'];
    var _images = Get.arguments['images'];
    final _size = Get.size;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: PreferredSize(
          preferredSize: Size(65, 65),
          child: AppBar(
            backgroundColor: Color(0xFF652981),
            centerTitle: true,
            title: Text(_title),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.bell,
                    color: Colors.white70,
                  )),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: _size.width,
            height: _size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF652981),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            height: 40,
                            width: 50,
                            image: NetworkImage(_images == null
                                ? "https://shl.com.bd/uploads/billers/dwasa.png"
                                : _images),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(_title),
                        ],
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "Account Number".tr,
                    hintText: "Enter Account Number".tr,
                    // onSaved: (input) =>
                    // controller.currentUser.value.email = input,
                    // validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
                    iconData: null,
                    imageData: 'assets/bill/account.png',
                  ),
                  TextFieldWidget(
                    labelText: "Recharge Amount".tr,
                    hintText: "Enter Recharge Amount".tr,
                    // onSaved: (input) =>
                    // controller.currentUser.value.email = input,
                    // validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
                    iconData: null,
                    imageData: 'assets/collection/2.png',
                  ),
                  TextFieldWidget(
                    labelText: "Mobile No".tr,
                    hintText: "Enter Mobile No.".tr,

                    // onSaved: (input) =>
                    // controller.currentUser.value.email = input,
                    // validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
                    iconData: CupertinoIcons.device_phone_portrait,
                  ),
                  // Container(
                  //   child: CheckBoxWidget(
                  //     title: 'Save the account'.tr,
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  BlockButtonWidget(
                    onPressed: () {},
                    color: Color(0xFF652981),
                    text: Text(
                      "SHOW BILL".tr,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ).paddingSymmetric(vertical: 10, horizontal: 20),
                ],
              ),
            ),
          ),
        ));
  }
}
