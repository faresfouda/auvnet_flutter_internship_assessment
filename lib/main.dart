import 'package:auvnet_flutter_internship_assessment/features/home/presentation/pages/home_screen.dart';
import 'package:auvnet_flutter_internship_assessment/features/login/presentation/login_screen.dart';
import 'package:auvnet_flutter_internship_assessment/features/login/presentation/signup_screen.dart';
import 'package:auvnet_flutter_internship_assessment/features/onboarding/data/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NAUEL',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => OnboardingBloc(),
        child: OnboardingScreen(),
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) =>  HomeScreen(),
      },
    );
  }
}
