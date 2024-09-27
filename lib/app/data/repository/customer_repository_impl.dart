import 'dart:io';

import 'package:bring_me_bd/app/core/constents/endpoints.dart';
import 'package:bring_me_bd/app/data/dto_models/auth_response.dart';
import 'package:bring_me_bd/app/data/dto_models/check_phone_status_response.dart';
import 'package:bring_me_bd/app/data/dto_models/otp_message_response.dart';
import 'package:bring_me_bd/app/data/model/customer__model.dart';
import 'package:bring_me_bd/app/domain/entity/customer_entity.dart';
import 'package:bring_me_bd/app/domain/repossitory/customer_repository.dart';
import 'package:dio/dio.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final Dio _dio;

  CustomerRepositoryImpl(this._dio);

  @override
  Future<CheckPhoneStatusResponse> checkCustomerStatus(String number) async {
    final response = await _dio.get(
      ApiEndPoints.checkNumberStatus(number),
    );

    return CheckPhoneStatusResponse.fromJson(response.data);
  }

  @override
  Future<OtpMessageResponse> register(
      {required CustomerEntity customer}) async {
    final customerModel = CustomerModel(
      firstName: customer.firstName,
      lastName: customer.lastName,
      email: customer.email,
      phone: customer.phone,
      password: customer.password,
      passwordConfirmation: customer.passwordConfirmation,
    );

    final response = await _dio.post(
      ApiEndPoints.customerRegister,
      data: customerModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register customer');
    } else {
      return OtpMessageResponse.fromJson(response.data);
    }
  }

  @override
  Future<AuthResponse?> login({
    required String email,
    required String password,
  }) async {
    final data = {
      'email': email,
      'password': password,
      'device_name': (Platform.isAndroid ? "android" : "iOS"),
    };

    final response = await _dio.post(
      ApiEndPoints.customerLogin,
      data: data,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to login customer');
    } else {
      return AuthResponse.fromJson(response.data);
    }
  }

  @override
  Future<AuthResponse?> verifyOtp({
    required String otp,
    required String phone,
  }) async {
    final data = {
      "phone": phone,
      "otp": otp,
    };

    final response = await _dio.post(
      ApiEndPoints.otpCheck,
      data: data,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to login customer');
    } else {
      return AuthResponse.fromJson(response.data);
    }
  }

  loginPhone({required String phone, required String password}) async {
    final data = {
      'phone': phone,
      'password': password,
      'device_name': (Platform.isAndroid ? "android" : "iOS"),
    };

    final response = await _dio.post(
      ApiEndPoints.customerLogin,
      data: data,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to login customer');
    } else {
      return AuthResponse.fromJson(response.data);
    }
  }
}
