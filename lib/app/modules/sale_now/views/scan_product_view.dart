import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/sale_now/controllers/sale_now_controller.dart';

class ScanProductView extends GetView<SaleNowController> {
  // Barcode? result;
  // QRViewController? qcontroller;

  String qrcode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        title: Text('Scan Product'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: Get.size.width, // custom wrap size
          height: Get.size.height,
          child: controller.buildQrView(context),
        ),
      ),
    );
  }
}
