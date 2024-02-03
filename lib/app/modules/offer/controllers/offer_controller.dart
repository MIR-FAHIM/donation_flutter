import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/ad_banner_model.dart';
import 'package:latest_payplus_agent/app/repositories/balance_check_repository.dart';

class OfferController extends GetxController {
  //TODO: Implement OfferController

  final offerBanner = <AdBannerModel>[].obs;
  final offerBannerLoaded = false.obs;
  final isCollector = false.obs;
  //card color list
  List<Color> cardColorList = [
    Colors.purpleAccent.withOpacity(0.7),
    Colors.deepPurpleAccent.withOpacity(0.7),
    Colors.lightBlueAccent.withOpacity(0.7),
    Colors.purple.withOpacity(0.7),
  ];

  //off percent box color list
  List<Color> offColorList = [
    Colors.deepPurpleAccent,
    Colors.orange,
    Colors.pinkAccent,
    Colors.lightBlueAccent,
  ];

  ///ICons list
  List<IconData> iconList = [
    CupertinoIcons.gift,
    CupertinoIcons.gift_alt_fill,
    CupertinoIcons.gift_fill,
    CupertinoIcons.gift_alt
  ];

  //off string list
  List offString = ["5%", "6%", "3%", "8%"];

  //shop Name List

  List shopName = ["Fahim Rahman", "Abdur Rahim", "Dolor Shop", "Shafiq"];

  //coupon String list
  List couponString = ["700 tk", "1500  tk", "400 tk", "300 tk"];
  @override
  void onInit() {
    super.onInit();
    getAdBanner();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAdBanner() async {
    BalanceCheckRepository().getBanner().then((resp) {
      offerBanner.value = resp;
      offerBannerLoaded.value = true;
    });
  }
}
