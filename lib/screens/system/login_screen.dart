import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Form(
              child: Column(
                children: [
                  CustomTextField(
                    labelText: 'E-mail address',
                    hintText: 'Enter your e-mail address',
                    controller: _emailController,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    isPassword: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomElevatedButton(
                    label: 'Sign In',
                    onPressed: signIn,
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      'Not a member? Register now!',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
