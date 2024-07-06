import 'package:bring_me_bd/app/core/constents/images.dart';
import 'package:bring_me_bd/app/core/widgets/app_button.dart';
import 'package:bring_me_bd/app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () => ClipRect(
                child: AnimatedAlign(
                  alignment: Alignment.topCenter,
                  heightFactor: controller.showPhoneInput.value ? 1 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        "Please provide your phone number to continue.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const SizedBox(height: 24),
                      AppTextField(
                        hint: '01XXXXXXXXX',
                        label: 'Phone Number',
                        controller: controller.phoneNumberController,
                        //errorMessage: "tes",
                      ),
                      const SizedBox(height: 16),
                      AppButton(
                        title: "Continue",
                        onTap: controller.verifyNumber,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
