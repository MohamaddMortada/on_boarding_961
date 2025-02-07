import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/verification_controller.dart';

class OTPTimer extends StatelessWidget {
  final VerificationController controller = Get.find<VerificationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          "Resend code in ${controller.countdown.value}s",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ));
  }
}
