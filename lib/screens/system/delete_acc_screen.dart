import 'package:flutter/material.dart';
import '../../widgets/text_field.dart';
import '../../widgets/elevated_button.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
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
              'Delete Account',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              "Are you sure you want to delete your account? This will erase all of your account data from this app. To delete your account enter your password below:",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              child: Column(
                children: [
                  const CustomTextField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  const SizedBox(height: 100),
                  CustomElevatedButton(
                    label: 'Delete Account',
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