import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/admin_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(
      () => AdminController(),
    );
  }
}
