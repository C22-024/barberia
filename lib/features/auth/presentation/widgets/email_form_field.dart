import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    this.controller,
    this.validator,
    this.autovalidateMode,
    this.textInputAction,
    required this.onChanged,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChanged;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return BTextFormField(
      autovalidateMode: autovalidateMode,
      hintText: 'Email',
      prefixIcon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
