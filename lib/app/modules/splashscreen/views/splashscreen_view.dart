import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    Get.find<SplashscreenController>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Stack(
          children: [
            Center(
              child: Image(
                height: 200,
                width: 200,
                color: Colors.white,
                image: AssetImage(
                  'assets/icons/logo_charity.png',
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Ui.customLoaderSplash(),
            )
          ],
        ),
      ),
    );
  }
}
