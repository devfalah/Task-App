import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '/core/controllers/auth_controller.dart';
import '/helper/constance.dart';
import '/views/register_view.dart';
import '/views/widgets/custom_button.dart';
import '/views/widgets/social_button.dart';

import 'widgets/custom_text_field.dart';

class LoginView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withOpacity(0.7),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", fit: BoxFit.cover),
              SizedBox(height: 60.0),
              CustomLoginForm(
                controller: controller,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFD8C00),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Column(
                children: [
                  Text(
                    "or login with",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialIconButton(
                          onTap: () {
                            controller.signInWithGoogle();
                          },
                          iconData: FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        text: "Don’t have an account?",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: " Register now",
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
                      Get.to(
                        () => RegisterView(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 600),
                      );
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

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
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
            text: "LOGIN",
            onTap: () {
              controller.login();
            },
          ),
        ],
      ),
    );
  }
}
