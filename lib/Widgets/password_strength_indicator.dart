import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignUpController _controller = Get.find();

    return Obx(() {
      final password = _controller.user.value.password ?? '';
      final strength = _calculatePasswordStrength(password);

      String strengthText;
      Color strengthColor;
      double lineWidth;

      if (password.length < 8) {
        strengthText = 'Very Weak (min 8 characters)';
        strengthColor = Colors.red;
        lineWidth = 50.0; 
      } else {
        switch (strength) {
          case 0:
            strengthText = 'Very Weak';
            strengthColor = Colors.red;
            lineWidth = 50.0; 
            break;
          case 1:
            strengthText = 'Weak';
            strengthColor = Colors.orange;
            lineWidth = 100.0; 
            break;
          case 2:
            strengthText = 'Strong';
            strengthColor = Colors.lightGreen;
            lineWidth = 150.0; 
            break;
          case 3:
            strengthText = 'Very Strong';
            strengthColor = Colors.green;
            lineWidth = 200.0; 
            break;
          default:
            strengthText = '';
            strengthColor = Colors.transparent;
            lineWidth = 0.0;
        }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strengthText,
            style: TextStyle(color: strengthColor),
          ),
          SizedBox(height: 5),
          Container(
            height: 5, 
            width: lineWidth,
            decoration: BoxDecoration(
              color: strengthColor,
              borderRadius: BorderRadius.circular(2.5), 
            ),
          ),
        ],
      );
    });
  }

  int _calculatePasswordStrength(String password) {
    int strength = 0;

    if (password.contains(RegExp(r'[A-Z]'))) strength++;

    if (password.contains(RegExp(r'[0-9]'))) strength++;

    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;

    return strength.clamp(0, 3);
  }
}