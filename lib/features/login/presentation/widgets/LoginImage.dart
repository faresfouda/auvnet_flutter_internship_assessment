import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/splash_screen.png',
      fit: BoxFit.fill,
    );
  }
}
