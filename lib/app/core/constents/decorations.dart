import 'package:bring_me_bd/app/core/constents/colors.dart';
import 'package:flutter/material.dart';

abstract class AppInputDecoration {
  static  InputDecoration textFieldDecoration = InputDecoration(
    filled: true,
    fillColor: AppColors.gray(0.1),//Color(0xffeeeeee),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    hintStyle: TextStyle(color: AppColors.gray(0.3)),

  );
}
