import 'package:bring_me_bd/app/core/controllers/auth_controller.dart';
import 'package:bring_me_bd/app/core/utility/logger.dart';
import 'package:bring_me_bd/app/data/dto_models/check_phone_status_response.dart';
import 'package:bring_me_bd/app/data/repository/customer_repository_impl.dart';
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
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
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

  verifyNumber() async {
    try {
      var number = "88${phoneNumberController.text}";
      CheckPhoneStatusResponse response =
          await Get.find<CustomerRepositoryImpl>().checkCustomerStatus(number);

      if (response.message == "New User") {
        Get.toNamed(Routes.PHONE_REGISTER,arguments: number);
      } else {
        Get.toNamed(Routes.PHONE_LOGIN, arguments: number);
      }
    } catch (e, s) {
      Logger.printLog(e);
      Logger.printLog(s);
      Get.snackbar('Error', 'Login failed');
    }
  }
}
