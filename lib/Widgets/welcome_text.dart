import 'package:flutter/material.dart';
import 'package:on_boarding/Widgets/customed_text.dart';

class WelcomeText extends StatelessWidget {
  final String username;

  const WelcomeText(this.username, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,      children: [

      CustomedText(text: 'Welcome to your new favorite app', fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black, textAlign: TextAlign.center),
      SizedBox(height: 10,),
CustomedText(text:  username, fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, textAlign: TextAlign.center),    ],);
    
  }
}
