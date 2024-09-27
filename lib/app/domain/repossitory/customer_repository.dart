import 'package:bring_me_bd/app/data/dto_models/check_phone_status_response.dart';
import 'package:bring_me_bd/app/domain/entity/customer_entity.dart';

abstract class CustomerRepository {
  Future<void> register({required CustomerEntity customer});

  Future<void> login({required String email, required String password});

  Future<CheckPhoneStatusResponse> checkCustomerStatus(String number);

  verifyOtp({required String phone, required String otp});
}
