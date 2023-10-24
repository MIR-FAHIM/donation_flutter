import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/icon_model.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/square_card_widget.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/controllers/withdraw_controller.dart';

class MobileBanksWidget extends GetWidget<WithdrawController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: _size.width,
      color: Colors.white,
      child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 10.0,
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
                      padding: const EdgeInsets.all(8.0),
                      child: SquareCardWidget(
                        width: 85,
                        aspectRetio: 1.2,
                        image: mobileBank[index].image,
                        allpadding: 0.0,
                        name: null,
                      ),
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
