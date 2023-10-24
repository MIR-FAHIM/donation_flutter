import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/package/controller/package_list_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';


class RechargePINView extends GetView<PackageController> {

  final _size = Get.size;
  @override
  Widget build(BuildContext context) {


    // print('cashback amount : ${controller.amountController.clear}');

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(65, 65),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF652981),
            centerTitle: true,
            title: Text('Mobile Recharge'.tr),
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
        body: Obx(() {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: _size.width,
              height: _size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [


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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mobile Number'.tr,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),

                                ],
                              )),
                        ),
                      ),
                    ),











                    // controller.currentPage
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
