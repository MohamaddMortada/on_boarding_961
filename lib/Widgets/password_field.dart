import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordField extends StatelessWidget {
  final Function(String) onChanged;
  final bool isPasswordVisible;
  final VoidCallback onVisibilityToggle;

  const PasswordField({
    Key? key,
    required this.onChanged,
    required this.isPasswordVisible,
    required this.onVisibilityToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onVisibilityToggle,
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
