import 'package:get/get.dart';

import '../controllers/register_otp_verify_controller.dart';

class RegisterOtpVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterOtpVerifyController>(
      () => RegisterOtpVerifyController(),
    );
  }
}
