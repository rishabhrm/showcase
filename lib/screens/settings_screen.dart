import 'package:flutter/material.dart';
import '../widgets/elevated_button.dart';
import '../widgets/icon_label.dart';
import '../widgets/navbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
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
            Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            IconLabelButton(
              icon: Icons.email,
              label: 'Help and Support',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            IconLabelButton(
              icon: Icons.delete,
              label: 'Delete My Account',
              onPressed: () {
                Navigator.pushNamed(context, '/delete_acc');
              },
            ),
            const SizedBox(height: 20),
            IconLabelButton(
              icon: Icons.key,
              label: 'Change Password',
              onPressed: () {
                Navigator.pushNamed(context, '/change_psw');
              },
            ),
            const SizedBox(height: 20),
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(90, 90, 90, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.dark_mode,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Dark Mode',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _isDarkMode,
                    onChanged: (bool value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                    },
                    activeColor: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 140),
            CustomElevatedButton(
              label: 'Log Out',
              onPressed: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
