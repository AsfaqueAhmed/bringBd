import 'package:bring_me_bd/app/core/constents/images.dart';
import 'package:bring_me_bd/app/core/utility/validator.dart';
import 'package:bring_me_bd/app/core/widgets/app_button.dart';
import 'package:bring_me_bd/app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phone_login_controller.dart';

class PhoneLoginView extends GetView<PhoneLoginController> {
  const PhoneLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const Text(
                            "Please provide your password to login.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          const SizedBox(height: 24),
                          AppTextField(
                            hint: 'Email Ex(01XXXXXXXXX)',
                            label: 'Phone Number',
                            enable: false,
                            //onInputChange: controller.email.call,
                            controller: controller.phoneController,
                          ),
                          const SizedBox(height: 16),
                          AppTextField(
                            label: "Password",
                            hint: "********",
                            onInputChange: controller.password.call,
                            controller: controller.passwordController,
                            errorMessage: controller.autoValidate.value == false
                                ? null
                                : Validator.validatePassword(controller.password.value),
                          ),
                          const SizedBox(height: 24),
                          AppButton(
                            title: "Login",
                            onTap: controller.logIn,
                          )
                        ],
                      ),
                ),
              )
            ],
          ),
        ));
  }
}
