import 'package:flutter/material.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isChecked = false;

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
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Let's create an account for you!",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Form(
              child: Column(
                children: [
                  const CustomTextField(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    labelText: 'E-mail address',
                    hintText: 'Enter your e-mail address',
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    labelText: 'Re-enter password',
                    hintText: 'Re-enter your password',
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                      ),
                      const Text(
                        'Agree to terms and conditions',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  CustomElevatedButton(
                    label: 'Sign Up',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Already a member? Sign In.',
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