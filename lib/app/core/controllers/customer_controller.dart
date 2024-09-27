import 'package:bring_me_bd/app/data/dto_models/auth_response.dart';
import 'package:bring_me_bd/app/data/dto_models/otp_message_response.dart';
import 'package:bring_me_bd/app/data/repository/customer_repository_impl.dart';
import 'package:bring_me_bd/app/domain/entity/customer_entity.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class CustomerController extends GetxController {
  final CustomerRepositoryImpl _customerRepository =
      Get.find<CustomerRepositoryImpl>();
  final AuthController _tokenController = Get.find<AuthController>();

  Future<OtpMessageResponse?> registerCustomer(CustomerEntity customer) async {
    OtpMessageResponse? otpMessageResponse =
        await _customerRepository.register(customer: customer);

    if (otpMessageResponse.errors != null) {
      throw (otpMessageResponse.message ?? "Registration failed");
    } else {
      return otpMessageResponse;
    }
  }

  Future<void> loginCustomer({
    required String email,
    required String password,
  }) async {
    AuthResponse? authResponse =
        await _customerRepository.login(email: email, password: password);

    if (authResponse?.token != null) {
      _tokenController.setToken(authResponse!.token!);
    } else {
      throw (authResponse?.message ?? "Authorization failed");
    }
  }

  Future<void> loginCustomerPhone({
    required String phone,
    required String password,
  }) async {
    AuthResponse? authResponse =
        await _customerRepository.loginPhone(phone: phone, password: password);

    if (authResponse?.token != null) {
      _tokenController.setToken(authResponse!.token!);
    } else {
      throw (authResponse?.message ?? "Authorization failed");
    }
  }

  Future<AuthResponse> verifyOtp(
      {required String otp, required String phone}) async {
    AuthResponse? authResponse =
        await _customerRepository.verifyOtp(otp: otp, phone: phone);

    if (authResponse?.errors != null) {
      throw (authResponse?.message ?? "Registration failed");
    } else {
      return authResponse!;
    }
  }
}
