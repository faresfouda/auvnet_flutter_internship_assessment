import 'package:flutter/material.dart';

class OnboardingTextbutton extends StatelessWidget {
  final VoidCallback? onpressed;
  const OnboardingTextbutton({super.key, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onpressed, child:Text(
      'next',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF677294),
        fontWeight: FontWeight.w500,
      ),
    ));
  }
}
