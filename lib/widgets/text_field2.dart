import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller; // Use controller instead of initialValue
  final String labelText;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // Increased height for better spacing
      child: TextFormField(
        controller: controller, // Bind the controller here
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        ),
      ),
    );
  }
}
