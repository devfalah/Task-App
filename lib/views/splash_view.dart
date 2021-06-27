import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/helper/constance.dart';
import 'package:tasks/views/login_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        Get.off(LoginView());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withOpacity(0.7),
      body: Center(
        child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
      ),
    );
  }
}
