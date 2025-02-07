import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? prefixText;
  final bool isPassword;
  final Function(String) onChanged;

  CustomTextField({
    required this.label,
    this.prefixText,
    this.isPassword = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefixText,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
