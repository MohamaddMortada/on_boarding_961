import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Widgets/customed_text.dart';
import 'package:on_boarding/widgets/main_button.dart';
import '../controllers/forgot_password_controller.dart';
import '../widgets/custom_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  final ForgotPasswordController _controller =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomedText(
                text: 'Forgot Password?',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Username, email, or phone number",
              onChanged: _controller.updateUserInput,
            ),
            const SizedBox(height: 10),
            const CustomedText(
                text: "We’ll send you instructions to reset your password.",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(135, 0, 0, 0),
                textAlign: TextAlign.center),
            const Spacer(),
            MainButton(
              onPressed: _controller.resetPassword,
              text: 'Reset Password',
            ),
          ],
        ),
      ),
    );
  }
}
