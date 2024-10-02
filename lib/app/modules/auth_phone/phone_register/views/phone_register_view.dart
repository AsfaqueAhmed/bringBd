import 'package:bring_me_bd/app/core/constents/colors.dart';
import 'package:bring_me_bd/app/core/constents/images.dart';
import 'package:bring_me_bd/app/core/utility/validator.dart';
import 'package:bring_me_bd/app/core/widgets/app_button.dart';
import 'package:bring_me_bd/app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/phone_register_controller.dart';

class PhoneRegisterView extends GetView<PhoneRegisterController> {
  const PhoneRegisterView({super.key});

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
                Obx(
                  () => AppTextField(
                    hint: 'Jhon',
                    label: 'First name',
                    controller: controller.firstNameController,
                    onInputChange: controller.firstName.call,
                    errorMessage: controller.autoValidate.value == false
                        ? null
                        : Validator.validateName(controller.firstName.value),
                  ),
                ),
                Obx(
                  () => AppTextField(
                    hint: 'Doe',
                    label: 'Last Name',
                    onInputChange: controller.lastName.call,
                    controller: controller.lastNameController,
                    errorMessage: controller.autoValidate.value == false
                        ? null
                        : Validator.validateName(controller.lastName.value),
                    //errorMessage: "tes",
                  ),
                ),
                Obx(
                  () => AppTextField(
                    hint: 'Email Ex(jhon@bringme.bd)',
                    label: 'Email',
                    onInputChange: controller.email.call,
                    controller: controller.emailController,
                    errorMessage: controller.autoValidate.value == false
                        ? null
                        : Validator.validateEmail(controller.email.value,
                            optional: true),
                  ),
                ),
                AppTextField(
                  hint: 'Phone Ex(01XXXXXXXXX)',
                  label: 'Phone Number',
                  enable: false,
                  //onInputChange: controller.email.call,
                  controller: controller.phoneController,
                ),
                Obx(
                  () => AppTextField(
                    label: "Password",
                    hint: "********",
                    onInputChange: controller.password.call,
                    controller: controller.passwordController,
                    errorMessage: controller.autoValidate.value == false
                        ? null
                        : Validator.validatePassword(controller.password.value),
                  ),
                ),
                Obx(
                  () => AppTextField(
                    label: "Confirm Password",
                    hint: "********",
                    onInputChange: controller.confirmPassword.call,
                    controller: controller.confirmPasswordController,
                    errorMessage: controller.autoValidate.value == false
                        ? null
                        : Validator.validateConfirmPassword(
                            controller.confirmPassword.value,
                            controller.passwordController.text),
                  ),
                ),
                const SizedBox(height: 16),
                AppButton(
                  title: "Sign Up",
                  onTap: controller.signUp,
                )
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
                  Text("Have another account? "),
                  Text(
                    "Log in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
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
