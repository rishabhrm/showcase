import 'package:flutter/material.dart';

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
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {},
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55)
            .copyWith(top: 50), // Added top padding
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Ensures buttons fill the width
          children: <Widget>[
            Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 55),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(90, 90, 90, 1),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Help and Support',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(90, 90, 90, 1),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Delete My Account',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(90, 90, 90, 1),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.key,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Change Password',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 48,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(90, 90, 90, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.dark_mode,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Dark Mode',
                          style: TextStyle(color: Colors.white),
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
            const SizedBox(height: 130),
            // Logout button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
