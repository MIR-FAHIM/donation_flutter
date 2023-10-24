import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/square_card_widget.dart';
import 'package:latest_payplus_agent/app/modules/mobile_banking/widgets/mobile_bank_drawer.dart';

import '../controllers/mobile_banking_controller.dart';

class MobileBankingView extends GetView<MobileBankingController> {
  const MobileBankingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: MobileBankDrawer(),
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        elevation: 0,
        title: Text('Mobile Banking'.tr),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
          height: _size.height,
          width: _size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.5,
                children: List.generate(controller.banks.length, (index) {
                  return InkWell(
                    onTap: index == 0
                        ? () {
                            controller.showCashinCashoutOption();
                          }
                        : () {
                            controller.showComingsoonPopup();
                          },
                    child: AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 475),
                      columnCount: 3,
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: SquareCardWidget(
                            width: _size.width * .22,
                            aspectRetio: 1.2,
                            image: controller.banks[index].image,
                            allpadding: 0.0,
                            name: '',
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          )),
    );
  }
}
