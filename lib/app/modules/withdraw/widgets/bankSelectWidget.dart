import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/controllers/withdraw_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class BankSelectWidget extends GetWidget<WithdrawController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.selectedIndex.value = 0;
                  },
                  child: Container(
                    width: _size.width * .45,
                    height: _size.width * .2,
                    decoration: Ui.getBoxDecoration(
                      radius: 5,
                      color: controller.selectedIndex.value == 0
                          ? Color(0xFF652981)
                          : Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bank',
                          style: TextStyle(
                              color: controller.selectedIndex.value == 0
                                  ? Colors.white
                                  : Color(0xFF652981)),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.selectedIndex.value = 1;
                  },
                  child: Container(
                    width: _size.width * .45,
                    height: _size.width * .2,
                    decoration: Ui.getBoxDecoration(
                      radius: 5,
                      color: controller.selectedIndex.value == 1
                          ? Color(0xFF652981)
                          : Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Mobile Banking',
                          style: TextStyle(
                            color: controller.selectedIndex.value == 1
                                ? Colors.white
                                : Color(0xFF652981),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          controller.page[controller.selectedIndex.value],
          SizedBox(
            height: 15,
          ),
        ],
      );
    });
  }
}
