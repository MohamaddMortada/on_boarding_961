import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/Widgets/customed_text.dart';
import 'package:on_boarding/Widgets/main_button.dart';
import '../controllers/welcome_controller.dart';
import '../widgets/welcome_text.dart';

class WelcomePage extends StatelessWidget {
  final WelcomeController _controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => WelcomeText(_controller.username.value)),

              const CustomedText(
                text: 'Don’t forget your username - you’ll use it everywhere.',
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),

              Spacer(),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 231, 230),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: 70,
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: Color.fromARGB(117, 0, 0, 0)), 
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Username can't be changed. If it's not your legal name, please contact us.",
                        style: TextStyle(fontSize: 14, color: Color.fromARGB(172, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              MainButton(
                text: 'Get Started',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
