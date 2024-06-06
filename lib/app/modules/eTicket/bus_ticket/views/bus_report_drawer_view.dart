import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/drawer_link_widget.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';

class BusReportDrawer extends StatelessWidget {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
                child: Text(
                  'Pay Plus'.tr,
                  style: TextStyle(
                    fontSize: 35,
                    color: Color(0xFF652981),
                  ),
                ),
              )),
          DrawerLinkWidget(
            icon: 'assets/drawer/search.png',
            text: "Ticket Purchase Report".tr,
            onTap: (e) {
              Get.toNamed(Routes.BUSREPORT);
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
