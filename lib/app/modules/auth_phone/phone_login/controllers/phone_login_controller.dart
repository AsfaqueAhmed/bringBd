import 'package:bring_me_bd/app/core/controllers/customer_controller.dart';
import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:bring_me_bd/app/core/utility/validator.dart';
import 'package:bring_me_bd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneLoginController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxString password = "".obs;

  RxBool autoValidate = false.obs;

  @override
  void onInit() {
    phoneController.text = Get.arguments;
    super.onInit();
  }

  logIn() async {
    autoValidate.value = true;
    if (Validator.validatePassword(password.value) == null) {
      try {
        await Get.find<CustomerController>().loginCustomerPhone(
            phone: phoneController.text, password: passwordController.text);

        Get.offNamed(Routes.HOME);
      } catch (e, s) {
        Logger.printLog(e);
        Logger.printLog(s);
        Get.snackbar('Error', 'Login failed');
      }
    }
  }
}
