import 'package:bring_me_bd/app/core/constents/colors.dart';
import 'package:bring_me_bd/app/core/constents/images.dart';
import 'package:bring_me_bd/app/core/widgets/app_button.dart';
import 'package:bring_me_bd/app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

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
                  height: 220,
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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  "Please provide all information.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  hint: 'Jhon',
                  label: 'First name',
                  controller: controller.firstNameController,
                  //errorMessage: "tes",
                ),
                AppTextField(
                  hint: 'Doe',
                  label: 'Last Name',
                  controller: controller.lastNameController,
                  //errorMessage: "tes",
                ),
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
                AppTextField(
                  label: "Confirm Password",
                  hint: "********",
                  controller: controller.confirmPasswordController,
                ),
                const SizedBox(height: 16),
                 AppButton(title: "Sign Up",onTap: controller.signUp,)
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: Get.back,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  Text(
                    "Log in",
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
