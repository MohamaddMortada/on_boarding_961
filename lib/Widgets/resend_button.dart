import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/verification_controller.dart';

class ResendButton extends StatelessWidget {
  final VerificationController controller = Get.find<VerificationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextButton(
          onPressed: controller.isResendEnabled.value ? controller.resendCode : null,
          child: const Text("Resend Code"),
        ));
  }
}
