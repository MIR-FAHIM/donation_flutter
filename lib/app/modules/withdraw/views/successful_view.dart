import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/controllers/withdraw_controller.dart';

class WithdrawSuccessView extends GetView<WithdrawController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          centerTitle: true,
          title: Text('Withdraw'.tr),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () => Get.back(),
          // ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.white70,
                )),
            IconButton(
                onPressed: () => {Scaffold.of(context).openEndDrawer()},
                icon: Icon(
                  Icons.menu,
                  color: Colors.white70,
                )),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: Get.size.height,
            width: Get.size.width,
          ),
          Positioned(
            top: Get.size.width / 2,
            bottom: Get.size.width / 2,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        'Withdraw Successful'.tr,
                        style:
                            TextStyle(fontSize: 24, color: Color(0xFF652981)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Thanks for being with PayStation'.tr,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  BlockButtonWidget(
                    onPressed: () {
                      Get.back();
                      Get.back();
                      Get.back();
                      controller.refresh();
                    },
                    color: Color(0xFF652981),
                    text: Text(
                      "BACK".tr,
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
