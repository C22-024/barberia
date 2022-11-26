import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.validator,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return BTextFormField(
      controller: controller,
      hintText: hintText,
      prefixIcon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Icon(Icons.lock_outline),
      ),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
