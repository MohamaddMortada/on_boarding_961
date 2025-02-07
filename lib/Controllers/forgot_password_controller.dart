import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var userInput = "".obs;

  void updateUserInput(String value) {
    userInput.value = value;
    Get.toNamed('welcome');
  }

  void resetPassword() {
    if (userInput.value.isNotEmpty) {
      Get.snackbar(
        "Success",
        "Reset instructions sent to ${userInput.value}",
        backgroundColor: const Color.fromARGB(146, 0, 0, 0),
        colorText: const Color.fromARGB(255, 255, 255, 255),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    } else {
      Get.snackbar(
        "Error",
        "Please enter a valid input",
        backgroundColor: const Color.fromARGB(146, 0, 0, 0),
        colorText: const Color.fromARGB(255, 255, 255, 255),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
