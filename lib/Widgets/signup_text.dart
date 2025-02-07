import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SignupText extends StatelessWidget {
  final VoidCallback onTap;

  const SignupText({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  Text(
        "Not registered yet? Sign up",
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
      ),
    );
  }
}
