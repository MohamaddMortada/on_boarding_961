import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "© Username can't be changed. If it's not your legal name, please contact us.",
      style: TextStyle(fontSize: 14, color: Colors.grey),
      textAlign: TextAlign.center,
    );
  }
}
