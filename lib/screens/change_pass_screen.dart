import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import '../widgets/elevated_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {},
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
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Form(
              child: Column(
                children: [
                  const CustomTextField(
                    labelText: 'Old password',
                    hintText: 'Enter your old password',
                  ),
                  const SizedBox(height: 15),
                  const CustomTextField(
                    labelText: 'New password',
                    hintText: 'Enter your new password',
                  ),
                  const SizedBox(height: 15),
                  const CustomTextField(
                    labelText: 'Re-enter new password',
                    hintText: 'Re-enter your new password',
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Note: You can change your password only once a month.",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 100),
                  CustomElevatedButton(
                    label: 'Update Password',
                    onPressed: () {},
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
