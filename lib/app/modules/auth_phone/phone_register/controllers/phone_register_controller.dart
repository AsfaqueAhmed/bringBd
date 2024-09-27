import 'package:bring_me_bd/app/core/controllers/customer_controller.dart';
import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:bring_me_bd/app/core/utility/validator.dart';
import 'package:bring_me_bd/app/data/dto_models/otp_message_response.dart';
import 'package:bring_me_bd/app/data/model/customer__model.dart';
import 'package:bring_me_bd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneRegisterController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxString confirmPassword = "".obs;
  RxString password = "".obs;
  RxString email = "".obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;

  RxBool autoValidate = false.obs;

  @override
  void onInit() {
    phoneController.text = Get.arguments;
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  signUp() async {
    autoValidate.value = true;
    if (Validator.validateConfirmPassword(
                confirmPassword.value, passwordController.text) ==
            null &&
        Validator.validatePassword(password.value) == null &&
        Validator.validateEmail(email.value, optional: true) == null &&
        Validator.validateName(lastName.value) == null &&
        Validator.validateName(firstName.value) == null) {
      try {
        OtpMessageResponse? response = await Get.find<CustomerController>()
            .registerCustomer(CustomerModel(
                firstName: firstName.value,
                lastName: lastName.value,
                email: emailController.text,
                phone: phoneController.text,
                password: passwordController.text,
                passwordConfirmation: confirmPasswordController.text));

        if (response?.otp == 1) {
          Get.toNamed(Routes.REGISTER_OTP_VERIFY,arguments: phoneController.text);
          Get.snackbar("Otp send", response!.message);
        }
      } catch (e, s) {
        Logger.printLog(e);
        Logger.printLog(s);

        Get.snackbar('Error', e.toString());
      }
    }
  }
}
