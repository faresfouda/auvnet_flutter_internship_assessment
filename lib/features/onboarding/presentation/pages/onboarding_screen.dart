import 'package:auvnet_flutter_internship_assessment/features/onboarding/data/onboarding_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/onboarding/data/onboarding_event.dart';
import 'package:auvnet_flutter_internship_assessment/features/onboarding/data/onboarding_state.dart';
import 'package:auvnet_flutter_internship_assessment/features/onboarding/presentation/onboarding_page.dart';
import 'package:auvnet_flutter_internship_assessment/features/onboarding/presentation/pages/single_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final pages = [
    OnboardingPage(title: "All-in-One Delivery", description: "Order groceries, medicines, and meals delivered straight to your door"),
    OnboardingPage(title: "User-to-User Delivery", description: "Send or receive items from other users quickly and easily"),
    OnboardingPage(title: "Sales & Discounts", description: "Discover exclusive sales and deals every day"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state.isFinished) {
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          _pageController.animateToPage(
            state.currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<OnboardingBloc>().add(UpdatePageEvent(index));
                },
                itemCount: pages.length,
                itemBuilder: (context, index) => SingleOnboardingScreen(page: pages[index], pageLength: pages.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
