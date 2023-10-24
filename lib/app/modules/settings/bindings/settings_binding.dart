import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/settings/controllers/language_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );

    Get.lazyPut<LanguageController>(
      () => LanguageController(),
    );
  }
}
