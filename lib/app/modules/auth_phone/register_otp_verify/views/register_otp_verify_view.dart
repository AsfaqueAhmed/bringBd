import 'package:bring_me_bd/app/core/widgets/app_button.dart';
import 'package:bring_me_bd/app/core/widgets/app_pin_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_otp_verify_controller.dart';

class RegisterOtpVerifyView extends GetView<RegisterOtpVerifyController> {
  const RegisterOtpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                "assets/images/otp.png",
                height: 64,
              ),
            ),
            const Text(
              "Account Verification",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "An account message with a verification code was sent to you, Please verify.",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            AppPinInput(
              onChange: controller.onOtpChange,
            ),
            const SizedBox(height: 48),
            AppButton(
              title: "Complete",
              onTap: controller.verify,
            ),
          ],
        ),
      ),
    );
  }
}
