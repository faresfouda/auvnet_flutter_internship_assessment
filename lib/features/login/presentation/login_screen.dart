import 'package:auvnet_flutter_internship_assessment/features/login/presentation/data/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:auvnet_flutter_internship_assessment/features/login/presentation/widgets/CreateAccountButton.dart';
import 'package:auvnet_flutter_internship_assessment/features/login/presentation/widgets/LoginButton.dart';
import 'package:auvnet_flutter_internship_assessment/features/login/presentation/widgets/LoginImage.dart';
import 'package:auvnet_flutter_internship_assessment/features/login/presentation/widgets/signin_textfield.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(FirebaseAuth.instance),
      child: const _LoginForm(),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onLoginButtonPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(LoginSubmitted(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is LoginFailure) {
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
                      key: _formKey,
                      child: Column(
                        children: [
                          LoginTextField(
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined,
                            obscureText: false,
                            controller: _emailController,
                            validator: (value) =>
                            value == null || value.isEmpty ? 'Enter email' : null,
                          ),
                          const SizedBox(height: 18),
                          LoginTextField(
                            hintText: 'Password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value) =>
                            value == null || value.isEmpty ? 'Enter password' : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator();
                      }
                      return LoginButton(
                        title: 'Login',
                        onpressed: _onLoginButtonPressed,
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
