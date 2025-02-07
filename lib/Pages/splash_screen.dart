import 'package:flutter/material.dart';
import 'package:on_boarding/Widgets/customed_text.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                color: const Color.fromARGB(255, 255, 0, 0),
                height: double.infinity,
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomedText(
                        text: '961',
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        textAlign: TextAlign.center),
                    CustomedText(
                        text: "Lebanon's Pulse",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        textAlign: TextAlign.center)
                  ],
                ))));
  }
}
