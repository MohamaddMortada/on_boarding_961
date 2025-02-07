import 'package:flutter/material.dart';

class ForgotPasswordText extends StatelessWidget {
  final VoidCallback onTap;

  const ForgotPasswordText({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Color.fromARGB(124, 0, 0, 0), fontSize: 14),
        ),
      ),
    );
  }
}
