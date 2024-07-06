import 'package:bring_me_bd/app/data/dto_models/auth_response.dart';
import 'package:bring_me_bd/app/data/repository/customer_repository_impl.dart';
import 'package:bring_me_bd/app/domain/entity/customer_entity.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class CustomerController extends GetxController {
  final CustomerRepositoryImpl _customerRepository =
      Get.find<CustomerRepositoryImpl>();
  final AuthController _tokenController = Get.find<AuthController>();

  Future<void> registerCustomer(CustomerEntity customer) async {
    AuthResponse? authResponse =
        await _customerRepository.register(customer: customer);

    if (authResponse.errors != null) {
      throw (authResponse.message ?? "Registration failed");
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
}
