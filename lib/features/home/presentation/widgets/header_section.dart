import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/home_background.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          top: 35,
          left: 34,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivering to',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Al Satwa, 81A Street',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Hi hepa!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          top: 60,
          right: 20,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/avatar.png'),
          ),
        ),
      ],
    );
  }
}
