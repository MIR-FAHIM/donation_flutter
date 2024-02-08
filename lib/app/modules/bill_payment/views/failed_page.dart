import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/bill_payment/controllers/bill_payment_controller.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';

class ErrorViewBill extends GetView<BillPaymentController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          // await Get.toNamed(Routes.TESTCAT);
          return true;
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,


            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Error!!'
                                .tr,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            ''
                                .tr,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * .5,
                width: size.width * .8,
                child: Image.asset("images/Icons/success.png"),
              ),
              SizedBox(
                height: 15,
              ),
              BlockButtonWidget(
                onPressed: () {},
                color: AppColors.redTextColor,
                text: Text(
                  "Pay Now".tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ).paddingSymmetric(vertical: 10, horizontal: 30),
              BlockButtonWidget(
                onPressed: () {},
                color: AppColors.redTextColor,
                text: Text(
                  "Pay After Service".tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ).paddingSymmetric(vertical: 40, horizontal: 30),
            ],
          ),
        ),
      ),
    );
  }
}
