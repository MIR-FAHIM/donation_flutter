import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/icon_model.dart';
import 'package:latest_payplus_agent/app/modules/bank_information/controllers/bank_information_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class MobileBankingWidget extends GetWidget<BankInformationController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
          child: Row(
        children: [
          GestureDetector(
            onTap: () {
              controller.mobileBank.value = mobileBank[0].title!;
              controller.selectedBankId.value = '62';
            },
            child: AnimationConfiguration.staggeredGrid(
              position: 0,
              duration: const Duration(milliseconds: 475),
              columnCount: 1,
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 10, top: 10),
                    child: Container(
                      width: _size.width * .4,
                      height: 150,
                      decoration:
                          Ui.getBoxDecoration(radius: 10, color: Colors.white),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Center(
                                child: Image(
                                  image: AssetImage(mobileBank[0].image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              controller.mobileBank.value == mobileBank[0].title
                                  ? Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFF652981),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Wrap()
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.mobileBank.value = mobileBank[1].title!;
              controller.selectedBankId.value = '63';
            },
            child: AnimationConfiguration.staggeredGrid(
              position: 1,
              duration: const Duration(milliseconds: 475),
              columnCount: 2,
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 10, top: 10),
                    child: Container(
                      width: _size.width * .4,
                      height: 150,
                      decoration:
                          Ui.getBoxDecoration(radius: 10, color: Colors.white),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Center(
                                child: Image(
                                  image: AssetImage(mobileBank[1].image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              controller.mobileBank.value == mobileBank[1].title
                                  ? Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFF652981),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Wrap()
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
    });
  }
}
