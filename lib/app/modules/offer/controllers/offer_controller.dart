import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/ad_banner_model.dart';
import 'package:latest_payplus_agent/app/repositories/balance_check_repository.dart';

class OfferController extends GetxController {
  //TODO: Implement OfferController

  final offerBanner = <AdBannerModel>[].obs;
  final offerBannerLoaded = false.obs;
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
