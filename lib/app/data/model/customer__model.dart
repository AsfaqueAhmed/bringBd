import 'package:bring_me_bd/app/domain/entity/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  const CustomerModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.passwordConfirmation,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
