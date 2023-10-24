import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/icon_model.dart';
import 'package:latest_payplus_agent/app/modules/payment_collection/controllers/payment_collection_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class MobileBankForPayment extends GetWidget<PaymentCollectionController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: _size.width * .65,
        width: _size.width,
        child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.3,
            children: List.generate(mobileBank.length, (index) {
              return GestureDetector(
                onTap: mobileBank[index].press,
                child: AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 475),
                  columnCount: 3,
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: Ui.getBoxDecoration(
                              radius: 10, color: Colors.white),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage(mobileBank[index].image!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}
