import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:on_boarding/Widgets/main_button.dart';
import '../controllers/verification_controller.dart';
import '../widgets/otp_input_field.dart';
import '../widgets/otp_timer.dart';
import '../widgets/resend_button.dart';

class VerificationPage extends StatelessWidget {
  final VerificationController _controller = Get.put(VerificationController());
  final box = GetStorage(); // Initialize GetStorage

  @override
  Widget build(BuildContext context) {
    String phoneNumber = box.read("user")?["phoneNumber"] ?? "No number found";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter the 4-digit code sent to",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Text(
              phoneNumber,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return OTPInputField(
                    controller: _controller.otpControllers[index],
                    focusNode: _controller.focusNodes[index],
                    onChanged: (value) => _controller.updateOtp(index, value),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            OTPTimer(),
            ResendButton(),

            const Spacer(),
            MainButton(
              text: 'Verify',
              onPressed: _controller.verifyOtp,
            ),
          ],
        ),
      ),
    );
  }
}
