import 'package:bring_me_bd/app/core/constents/images.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(AppImages.empty),
        const Text("Empty list")
      ],
    );
  }
}
