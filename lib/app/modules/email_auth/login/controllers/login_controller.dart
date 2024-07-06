import 'package:bring_me_bd/app/core/controllers/auth_controller.dart';
import 'package:bring_me_bd/app/core/controllers/customer_controller.dart';
import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:bring_me_bd/app/data/repository/customer_repository_impl.dart';
import 'package:bring_me_bd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final CustomerRepositoryImpl _customerRepository =
      Get.find<CustomerRepositoryImpl>();
  final AuthController _tokenController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      await Get.find<CustomerController>().loginCustomer(
        email: email,
        password: password,
      );

      Get.offNamed(Routes.HOME);
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
      Get.snackbar('Error', 'Login failed');
    }
  }

  void signUp() {
    Get.toNamed(Routes.SIGN_UP)?.then((e) {
      if (e != null) {
        emailController.text = e;
      }
    });
  }
}
