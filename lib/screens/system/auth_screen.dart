import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _codeController = TextEditingController();
  String? _userEmail = FirebaseAuth.instance.currentUser?.email;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> verifyCode() async {
    // Add the logic for verifying the code here (e.g., send the code to Firebase)
    final code = _codeController.text;
    // Assuming you have a method to verify the code:
    // bool success = await someVerificationMethod(code);
    // if (success) {
    //   Navigator.pushNamed(context, '/home');
    // }
  }

  Future<void> resendCode() async {
    // Logic to resend the verification code
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification code resent to $_userEmail')),
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
              'Verify Yourself',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Almost there - check your inbox",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter the code we just sent to $_userEmail',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    labelText: 'Code',
                    hintText: 'Enter the code',
                    controller: _codeController,
                  ),
                  const SizedBox(height: 15),
                  CustomElevatedButton(
                    label: 'Continue',
                    onPressed: verifyCode,
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: InkWell(
                      onTap: resendCode,
                      child: const Text(
                        "Didn't receive the code? Resend the code.",
                        style: TextStyle(
                          fontSize: 11,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
