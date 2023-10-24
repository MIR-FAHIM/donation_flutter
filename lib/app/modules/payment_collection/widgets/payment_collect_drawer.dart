import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/drawer_link_widget.dart';
import 'package:latest_payplus_agent/app/modules/payment_collection/views/payment_history_view.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';

class PaymentCollectionDrawer extends StatelessWidget {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
            child: Text(
              'Pay Station'.tr,
              style: TextStyle(
                fontSize: 35,
                color: Color(0xFF652981),
              ),
            ),
          )),
          DrawerLinkWidget(
            icon: 'assets/images/list.png',
            text: "Make the bill".tr,
            onTap: (e) {
              Get.toNamed(Routes.MAKE_BILL_FOR_PAYMENT_COLLECTION);
            },
          ),
          DrawerLinkWidget(
            icon: 'assets/images/transaction.png',
            text: "Transaction History".tr,
            onTap: (e) {
              // Get.toNamed(Routes.TRANSACTION_HISTORY);
              Get.to(PaymentHistoryView());
            },
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
