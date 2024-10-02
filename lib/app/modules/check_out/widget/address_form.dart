import 'package:bring_me_bd/app/core/controllers/auth_controller.dart';
import 'package:bring_me_bd/app/core/controllers/customer_controller.dart';
import 'package:bring_me_bd/app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    streetController.dispose();
    zipCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: [
        AppTextField(
          hint: 'Jhon',
          label: 'First name',
          controller: firstNameController,
          //errorMessage: "tes",
        ),
        AppTextField(
          hint: 'Doe',
          label: 'Last Name',
          controller: lastNameController,
          //errorMessage: "tes",
        ),
        AppTextField(
          hint: 'user@bringme.bd',
          label: 'Email',
          controller: emailController,
          //errorMessage: "tes",
        ),
        AppTextField(
          hint: 'Phone Ex(01XXXXXXXXX)',
          label: 'Phone Number',
          //onInputChange: email.call,
          controller: phoneController,
        ),
        AppTextField(
          hint: 'Bangladesh',
          label: 'Country',
          //onInputChange: email.call,
          controller: countryController,
        ),
        AppTextField(
          hint: 'Dhaka',
          label: 'State',
          //onInputChange: email.call,
          controller: stateController,
        ),
        AppTextField(
          hint: 'Dhaka',
          label: 'City',
          //onInputChange: email.call,
          controller: cityController,
        ),
        AppTextField(
          hint: 'Dhanmondi 32',
          label: 'Street',
          //onInputChange: email.call,
          controller: streetController,
        ),
        AppTextField(
          hint: '1218',
          label: 'Zip Code',
          //onInputChange: email.call,
          controller: zipCodeController,
        ),
      ],
    );
  }
}
