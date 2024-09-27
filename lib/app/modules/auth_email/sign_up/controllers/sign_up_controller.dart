import 'package:bring_me_bd/app/core/controllers/customer_controller.dart';
import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:bring_me_bd/app/data/model/customer__model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  signUp() async {
    try {
      await Get.find<CustomerController>().registerCustomer(CustomerModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          phone: "",
          passwordConfirmation: confirmPasswordController.text));

      Get.back(result: emailController.text);
      Get.snackbar('Success', "Registration success. Log in now.");
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);

      Get.snackbar('Error', e.toString());
    }
  }
}
