import 'dart:ui';

import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/app/modules/home/widgets/donation_table.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';

class AllDonationListByUserId extends GetView<HomeController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text('My Donations'.tr),
          elevation: 0,

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Obx(() {
              if (controller.donationByUserList
                  .value.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(

                    width: _size.width,
                    color: Colors.white,
                    child:DataTableWidget(),
                  ),
                );
              } else {
                return SizedBox(
                    height: _size.width,
                    width: _size.width,
                    child: Center(
                      child: Text("No Data Found"),
                    ));
              }
            })
          ],
        ),
      ),
    );
  }
}
