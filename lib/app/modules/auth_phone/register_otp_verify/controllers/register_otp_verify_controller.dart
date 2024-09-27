import 'package:bring_me_bd/app/core/controllers/customer_controller.dart';
import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:bring_me_bd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterOtpVerifyController extends GetxController {
  RxString otp = "".obs;
  String number = Get.arguments;

  void verify() async {
    try {
      await Get.find<CustomerController>()
          .verifyOtp(otp: otp.value, phone: number);
      Get.offAllNamed(Routes.PHONE_LOGIN,arguments: number);
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);

      Get.snackbar('Error', e.toString());
    }
  }

  onOtpChange(String otp) {
    this.otp.value = otp;
    if (otp.length == 6) {
      FocusScope.of(Get.context!).requestFocus(FocusNode());
    }
  }
}
