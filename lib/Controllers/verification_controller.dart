import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  var otpCode = ''.obs;
  var countdown = 60.obs;
  var isResendEnabled = false.obs;
  var isOtpComplete = false.obs;

  final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  VerificationController() {
    _startCountdown();
  }

  void updateOtp(int index, String value) {
    if (value.isNotEmpty) {
      if (index < 3) {
        FocusScope.of(Get.context!).requestFocus(focusNodes[index + 1]); 
      } else {
        FocusScope.of(Get.context!).unfocus(); 
      }
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(Get.context!).requestFocus(focusNodes[index - 1]); 
    }

    otpCode.value = otpControllers.map((controller) => controller.text).join();
    isOtpComplete.value = otpCode.value.length == 4;
  }

  void verifyOtp() {
  if (otpCode.value.length == 4) {
    bool isOtpValid = otpCode.value == "1234"; 

    if (isOtpValid) {
      Get.toNamed('welcome');
      Get.snackbar(
        "Success", 
        "OTP verified successfully!", 
        snackPosition: SnackPosition.BOTTOM, 
        backgroundColor: Colors.green, 
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Error",
        "Invalid OTP. Please try again.",
        snackPosition: SnackPosition.BOTTOM, 
        backgroundColor: Colors.red, 
        colorText: Colors.white,
      );
    }
  } else {
    Get.snackbar(
      "Error", 
      "Please enter a 4-digit OTP.", 
      snackPosition: SnackPosition.BOTTOM, 
      backgroundColor: Colors.red,
      colorText: Colors.white, 
    );
  }
}

  void resendCode() {
    isResendEnabled.value = false;
    countdown.value = 60;
    _startCountdown();
    print("Resending OTP...");
  }

  void _startCountdown() {
    if (countdown.value > 0) {
      Future.delayed(Duration(seconds: 1), () {
        countdown.value--;
        if (countdown.value == 0) {
          isResendEnabled.value = true;
        } else {
          _startCountdown();
        }
      });
    }
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}