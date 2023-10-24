import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/hotline_model.dart';
import 'package:latest_payplus_agent/app/repositories/hotline_repo.dart';

class HotlineController extends GetxController {
  //TODO: Implement HotlineController

  final hotline = HotLineModel().obs;
  final hotlineLoaded = false.obs;

  @override
  void onInit() {
    getHotlineDetails();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getHotlineDetails() async {
    HotLineRepo().getHotline().then((resp) {
      hotline.value = resp;
      hotlineLoaded.value = true;
    });
  }
}
