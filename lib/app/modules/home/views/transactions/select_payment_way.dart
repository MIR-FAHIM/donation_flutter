import 'dart:ui';

import 'package:donation_flutter/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/app/modules/home/widgets/donation_table.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';

class PaymentWay extends GetView<HomeController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: RechargeDrawer(),
      endDrawer: MainDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text("Payment Way"),

          elevation: 0,

        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        child: ListView.builder(
          shrinkWrap: true,
          //  physics: const NeverScrollableScrollPhysics(),
          // new
          scrollDirection: Axis.vertical,
          itemCount: controller.bankList.value.length,

          itemBuilder: (BuildContext context, index) {
            var data = controller.bankList.value[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: (){
                  controller.datumBank.value = data;
                  controller.selectPayWay.value = data.id.toString();
                  Get.toNamed(Routes.ADDDONATIONFORM, arguments: [data]);
                },
                child:Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.bankName!, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                          Text(data.accountName!,style: TextStyle(fontSize: 16, color: Colors.green),),
                          Text(data.accountNum.toString(), style: TextStyle(fontSize: 16, color: Colors.blue),),

                          Text("Branch: ${data.branch}"),
                          Text("Route No: ${data.routeNo}"),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
