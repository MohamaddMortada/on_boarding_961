import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Widgets/custom_textfield.dart';
import 'package:on_boarding/Widgets/customed_text.dart';
import '../controllers/login_controller.dart';
import '../widgets/password_field.dart';
import '../widgets/main_button.dart';
import '../widgets/signup_text.dart';
import '../widgets/forgot_password_text.dart';
import '../controllers/password_visibility_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final PasswordVisibilityController _passwordVisibilityController =
      Get.put(PasswordVisibilityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: CustomedText(
                    text: 'Welcome back, we missed you!',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textAlign: TextAlign.center)),
            SignupText(onTap: () {}),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Username, number, or email address",
              onChanged: (value) => _usernameController.text = value,
            ),
            const SizedBox(height: 10),
            Obx(() => PasswordField(
                  onChanged: (value) => _passwordController.text = value,
                  isPasswordVisible:
                      _passwordVisibilityController.isPasswordVisible.value,
                  onVisibilityToggle:
                      _passwordVisibilityController.togglePasswordVisibility,
                )),
            ForgotPasswordText(onTap: () {Get.toNamed('forgot_password');}),
            const Spacer(),
            MainButton(
              text: "Login",
              onPressed: _controller.login,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
