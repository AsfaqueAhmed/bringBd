import 'package:bring_me_bd/app/core/controllers/auth_controller.dart';
import 'package:bring_me_bd/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthController _tokenController = Get.find<AuthController>();

  final RxBool showPhoneInput = false.obs;

  TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _checkUserAuthorization();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  void _checkUserAuthorization() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Simulate a delay for splash screen
    if ((await _tokenController.token()) != null) {
      Get.offNamed(Routes.HOME);
    } else {
      showPhoneInput.value = true;
      //Get.offNamed(Routes.LOGIN);
    }
  }

  verifyNumber() {

  }
}
