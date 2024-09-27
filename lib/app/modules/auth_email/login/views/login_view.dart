import 'package:bring_me_bd/app/core/constents/colors.dart';
import 'package:bring_me_bd/app/core/constents/images.dart';
import 'package:bring_me_bd/app/core/widgets/app_button.dart';
import 'package:bring_me_bd/app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(32.0),
              children: [
                SizedBox(
                  height: 320,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logo, height: 140),
                      const Text(
                        'bringme.bd',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  "Please login to your account.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 48),
                AppTextField(
                  hint: 'user@bringme.bd',
                  label: 'Email',
                  controller: controller.emailController,
                  //errorMessage: "tes",
                ),
                AppTextField(
                  label: "Password",
                  hint: "********",
                  controller: controller.passwordController,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 16),
                 AppButton(title: "Login",onTap:controller.login)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: controller.signUp,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have a account? "),
                  Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
