import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/common/custom_data.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/bill_details_controller.dart';

class BillDetailsView extends GetView<BillDetailsController> {
  const BillDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF652981),
        title: Text('Bill Details'.tr),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.billDetailsLoaded.isTrue) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Image.network(
                    controller.billDetails.value.data!.logo!,
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Transaction ID:'),
                      Text(controller.billDetails.value.data!.transactionId!),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Bill Type:'),
                      Text(controller.billDetails.value.data!.billerType!),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Bill Name'),
                      Text(controller.billDetails.value.data!.billName!),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Bill No:'),
                      Text(controller.billDetails.value.data!.billNo!),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Biller Account:'),
                      Text(controller.billDetails.value.data!.billerAccNo!),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Biller Mobile:'),
                      Text(controller.billDetails.value.data!.billerMobile!),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Charge:'),
                      Text(controller.billDetails.value.data!.charge!),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Amount:'),
                      Text(controller.billDetails.value.data!.billTotalAmount!),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Payment Status:'),
                      Text(controller.billDetails.value.data!.paymentStatus!),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox(
            height: Get.size.height,
            child: Center(
              child: Ui.customLoader(),
            ),
          );
        }
      }),
    );
  }
}
