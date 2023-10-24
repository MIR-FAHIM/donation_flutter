import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/repositories/buysell_repository.dart';

class SalesController extends GetxController {
  //TODO: Implement SalesController

  final buysellReport = {}.obs;
  final buysellLoaded = false.obs;
  @override
  void onInit() {
    super.onInit();
    getBuySellReport();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getBuySellReport() async {
    BuySellRepository().getBuySellReport().then((response) {
      buysellReport.value = response;
      buysellLoaded.value = true;
    });
  }
}
