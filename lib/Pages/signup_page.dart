import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Widgets/custom_textfield.dart';
import 'package:on_boarding/Widgets/customed_text.dart';
import 'package:on_boarding/Widgets/main_button.dart';
import 'package:on_boarding/Widgets/password_field.dart';
import 'package:on_boarding/Widgets/password_strength_indicator.dart';
import 'package:on_boarding/Widgets/terms_and_conditions.dart';
import '../controllers/signup_controller.dart';
import '../controllers/country_controller.dart';
import '../widgets/country_dropdown.dart';
import '../controllers/password_visibility_controller.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());
  final CountryController _countryController = Get.put(CountryController());
  final PasswordVisibilityController _passwordVisibilityController =
      Get.put(PasswordVisibilityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.centerLeft,
              child: CustomedText(
                text: 'SignUp',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              children: [
                const Text('Already have an account?'),
                TextButton(
                    onPressed: () { Get.toNamed('login'); }, child: Text('Log in'),
                  ),
              ],
            ),
            const Text(
              'Your real info is required to use the app, win prizes, and prevent bots and abuse.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'First Name',
              onChanged: _signUpController.updateFirstName,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: 'Last Name',
              onChanged: _signUpController.updateLastName,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CountryDropdown(),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    label: 'Phone Number',
                    onChanged: _signUpController.updatePhoneNumber,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: 'Email Address',
              onChanged: _signUpController.updateEmail,
            ),
            const SizedBox(height: 10),
            Obx(() {
              return PasswordField(
                onChanged: _signUpController.updatePassword,
                isPasswordVisible:
                    _passwordVisibilityController.isPasswordVisible.value,
                onVisibilityToggle:
                    _passwordVisibilityController.togglePasswordVisibility,
              );
            }),
            PasswordStrengthIndicator(),
            const SizedBox(height: 20),
            MainButton(
              onPressed: _signUpController.signUp,
              text: 'SignUp',
            ),
            const SizedBox(height: 10),
            TermsAndConditions(),
          ],
        ),
      ),
    );
  }
}
