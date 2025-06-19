import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/promo_code.png',
      width: double.infinity,
    );
  }
}
