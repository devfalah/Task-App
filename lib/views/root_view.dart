import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/controllers/auth_controller.dart';
import '/views/home_view.dart';
import '/views/login_view.dart';

class RootView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<AuthController>().user != null ? HomeView() : LoginView(),
    );
  }
}
