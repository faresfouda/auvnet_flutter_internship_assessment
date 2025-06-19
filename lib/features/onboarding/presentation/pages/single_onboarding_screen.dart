import 'package:auvnet_flutter_internship_assessment/features/onboarding/data/onboarding_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/onboarding/data/onboarding_event.dart';
import 'package:auvnet_flutter_internship_assessment/features/onboarding/presentation/onboarding_page.dart';
import 'package:auvnet_flutter_internship_assessment/features/onboarding/presentation/widgets/onboarding_elvationbutton.dart';
import 'package:auvnet_flutter_internship_assessment/features/onboarding/presentation/widgets/onboarding_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleOnboardingScreen extends StatelessWidget {
  final OnboardingPage page;
  final int pageLength ;
  const SingleOnboardingScreen({super.key, required this.page, required this.pageLength});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/onboarding1.png',
              fit: BoxFit.cover,
              height: 447,
              width: double.infinity,
            ),
            const SizedBox(height: 85),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    page.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 11),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: Text(
                      page.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF677294),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 82),
                  Container(
                    height: 54,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: OnboardingElvationbutton(
                      onpressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      title: 'Get Started',
                    ),
                  ),
                  const SizedBox(height: 14),
                  OnboardingTextbutton(
                    onpressed: () {
                      context.read<OnboardingBloc>().add(NextPageEvent(pageLength));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        ]
      ),
    );
  }
}
