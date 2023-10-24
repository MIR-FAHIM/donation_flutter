import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/icon_model.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/e_ticket_controller.dart';
import 'package:flutter/cupertino.dart';

class ETicketView extends GetView<ETicketController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          centerTitle: true,
          title: Text('E-ticketing'.tr),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Get.toNamed(Routes.Notification_View);
          //       },
          //       icon: Icon(
          //         CupertinoIcons.bell,
          //         color: Colors.white70,
          //       )),
          // ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: _size.width,
                decoration: Ui.getBoxDecoration(
                  color: Colors.white,
                  radius: 8,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Make extra money by selling tickets'.tr),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(eticket.length, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
                  child: Container(
                    width: _size.width,
                    decoration: Ui.getBoxDecoration(
                      color: Colors.white,
                      radius: 8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            eticket[index].image!,
                            height: 50,
                            width: 50,
                            color: Color(0xFF652981),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            eticket[index].title!.tr,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
