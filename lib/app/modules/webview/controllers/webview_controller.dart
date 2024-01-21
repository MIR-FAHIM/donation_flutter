import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../phoneVerificationWtihOTP/controllers/phone_verification_wtih_o_t_p_controller.dart';

class WebviewController extends GetxController {
  //TODO: Implement WebviewController
  late Completer<WebViewController> webcontroller;
  final paymentUrl = ''.obs;
  final title = ''.obs;
  final progress = 0.0.obs;

  final isLoaded = false.obs;

  @override
  void onInit() {
    paymentUrl.value = Get.arguments['paymentURL'];
    title.value = Get.arguments['title'];

    webcontroller = Completer<WebViewController>();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
