import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/signup');
      },
      child: const Text(
        'Create an account',
        style: TextStyle(
          color: Color(0xFF1877F2),
          fontSize: 14,
        ),
      ),
    );
  }
}
