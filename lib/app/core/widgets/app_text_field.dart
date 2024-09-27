import 'package:bring_me_bd/app/core/constents/decorations.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final String label;
  final bool hide;
  final String? errorMessage;
  final TextEditingController? controller;
  final Function(String)? onInputChange;

  final Widget? prefix;

  final bool enable;

  const AppTextField({
    super.key,
    required this.hint,
    required this.label,
    this.hide = false,
    this.errorMessage,
    this.controller,
    this.onInputChange,
    this.prefix,
    this.enable = true,
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
          enabled: widget.enable,
          controller: widget.controller,
          decoration: AppInputDecoration.textFieldDecoration.copyWith(
            labelText: widget.label,
            hintText: widget.hint,
            //errorText: widget.errorMessage,
            prefix: widget.prefix,
            error: widget.errorMessage == null ? null : const SizedBox(),
          ),
          onChanged: widget.onInputChange,
        ),
        Container(
            alignment: Alignment.topLeft,
            height: 24,
            child: (widget.errorMessage != null)
                ? Text(
                    widget.errorMessage!,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        height: 1.25,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  )
                : const SizedBox())
      ],
    );
  }
}
