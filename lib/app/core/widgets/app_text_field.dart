import 'package:bring_me_bd/app/core/constents/decorations.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final String label;
  final bool hide;
  final String? errorMessage;
  final TextEditingController? controller;
  final Function(String)? onInputChange;

  const AppTextField({
    super.key,
    required this.hint,
    required this.label,
    this.hide = false,
    this.errorMessage,
    this.controller,
    this.onInputChange,
  }) : assert(controller != null || onInputChange != null);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool hide = true;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          decoration: AppInputDecoration.textFieldDecoration.copyWith(
            labelText: widget.label,
            hintText: widget.hint,
            errorText: widget.errorMessage,
            errorStyle: const TextStyle(fontSize: 12,height: 1)

          ),
          onChanged: widget.onInputChange,
        ),
        if(widget.errorMessage==null)
          const SizedBox(height: 20)
      ],
    );
  }
}
