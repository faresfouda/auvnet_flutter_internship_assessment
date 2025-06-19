import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ServiceItem(title: 'Food', time: 'Up to 50%', ),
        _ServiceItem( title: 'Health & wellness', time: '20mins'),
        _ServiceItem(title: 'Groceries', time: '15 mins'),
      ],
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final String title;
  final String time;

  const _ServiceItem({ required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFF5F5F5),
          ),
          child: Image.asset(
            'assets/$title.png',
            width: 50,
            height: 57,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 8),
        Text(title, textAlign: TextAlign.center),
        Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
