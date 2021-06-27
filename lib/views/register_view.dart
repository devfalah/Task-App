import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '/core/controllers/auth_controller.dart';
import '/helper/constance.dart';
import '/views/widgets/custom_text_field.dart';

import 'widgets/custom_button.dart';

class RegisterView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withOpacity(0.7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", fit: BoxFit.cover),
              SizedBox(height: 60.0),
              RegisterForm(controller: controller),
              SizedBox(height: 30.0),
              Column(
                children: [
                  GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        text: "Do you have an account?",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: " Login now",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFD8C00),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.regFormKey,
      child: Column(
        children: [
          CustomTextFiled(
            hintText: "Name",
            iconData: Icons.person,
            onSaved: (value) {
              controller.name.value = value!;
            },
          ),
          SizedBox(height: 20.0),
          CustomTextFiled(
            hintText: "Email Address",
            iconData: FontAwesomeIcons.at,
            onSaved: (value) {
              controller.email.value = value!;
            },
          ),
          SizedBox(height: 20.0),
          CustomTextFiled(
            hintText: "Password",
            iconData: FontAwesomeIcons.lock,
            onSaved: (value) {
              controller.password.value = value!;
            },
          ),
          SizedBox(height: 20.0),
          CustomButton(
            text: 'REGISTER',
            onTap: () {
              controller.register();
            },
          ),
        ],
      ),
    );
  }
}
