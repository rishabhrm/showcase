import 'package:flutter/material.dart';

class CustomTextField3 extends StatelessWidget {
  final TextEditingController controller; // Use controller instead of initialValue
  final String labelText;
  final String hintText;

  const CustomTextField3({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TextField(
        controller: controller, // Bind the controller here
        maxLines: null,
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
