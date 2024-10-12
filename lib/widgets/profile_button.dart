import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const ProfileButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 16,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(0, 30),
        padding: const EdgeInsets.symmetric(
            vertical: 5, horizontal: 10), // Horizontal padding
      ),
    );
  }
}
