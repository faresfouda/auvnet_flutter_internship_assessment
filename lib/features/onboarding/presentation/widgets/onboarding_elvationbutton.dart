import 'package:flutter/material.dart';

class OnboardingElvationbutton extends StatelessWidget {
  final VoidCallback? onpressed;
  final String title;
  const OnboardingElvationbutton({super.key, this.onpressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8900FE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );
  }
}
