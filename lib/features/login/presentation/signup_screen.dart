import 'package:auvnet_flutter_internship_assessment/features/login/presentation/data/sigup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auvnet_flutter_internship_assessment/features/login/presentation/widgets/CreateAccountButton.dart';
import 'package:auvnet_flutter_internship_assessment/features/login/presentation/widgets/LoginButton.dart';
import 'package:auvnet_flutter_internship_assessment/features/login/presentation/widgets/LoginImage.dart';
import 'package:auvnet_flutter_internship_assessment/features/login/presentation/widgets/signin_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupBloc(FirebaseAuth.instance),
      child: const _SignupForm(),
    );
  }
}

class _SignupForm extends StatefulWidget {
  const _SignupForm();

  @override
  State<_SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<_SignupForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _onSignupPressed() {
    if (formKey.currentState?.validate() ?? false) {
      context.read<SignupBloc>().add(SignupSubmitted(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.pushReplacementNamed(context, 'home');
          } else if (state is SignupFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LoginImage(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 37),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          LoginTextField(
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined,
                            obscureText: false,
                            controller: emailController,
                            validator: (value) =>
                            value == null || value.isEmpty ? 'Enter email' : null,
                          ),
                          const SizedBox(height: 18),
                          LoginTextField(
                            hintText: 'Password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: true,
                            controller: passwordController,
                            validator: (value) =>
                            value == null || value.length < 6
                                ? 'Enter at least 6 characters'
                                : null,
                          ),
                          const SizedBox(height: 18),
                          LoginTextField(
                            hintText: 'Confirm Password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: true,
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm your password';
                              } else if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      if (state is SignupLoading) {
                        return const CircularProgressIndicator();
                      }
                      return LoginButton(
                        title: 'Sign Up',
                        onpressed: _onSignupPressed,
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  const CreateAccountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
