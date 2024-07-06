import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String passwordConfirmation;

  const CustomerEntity( {
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object?> get props => [firstName, lastName, email];
}
