import 'package:flutter/material.dart';

abstract class AppColors{
  static const primary=Color(0xff3894F2);

  static var white=Colors.white;

  static Color gray(double amount)=>Color.lerp(Colors.white, Colors.black, amount.toDouble())!;
}