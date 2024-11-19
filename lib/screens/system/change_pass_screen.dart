import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/text_field.dart';
import '../../widgets/elevated_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> changePassword() async {
    
    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New passwords do not match!')),
      );
      return;
    }

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: _oldPasswordController.text,
        );

        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(_newPasswordController.text);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password updated successfully')),
        );
        Navigator.pushReplacementNamed(context, '/settings');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change Password',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Form(
              child: Column(
                children: [
                  CustomTextField(
                    controller: _oldPasswordController,
                    labelText: 'Old password',
                    hintText: 'Enter your old password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: _newPasswordController,
                    labelText: 'New password',
                    hintText: 'Enter your new password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: _confirmPasswordController,
                    labelText: 'Re-enter new password',
                    hintText: 'Re-enter your new password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Note: You can change your password only once a month.",
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 100),
                  CustomElevatedButton(
                    label: 'Update Password',
                    onPressed: changePassword, // Call the changePassword function
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
