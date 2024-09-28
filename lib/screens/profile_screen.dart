import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Action for settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Profile Picture
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150x150'), // Placeholder image URL
              radius: 60,
            ),
            const SizedBox(height: 20),
            // Username and handle
            const Text(
              'Test User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '@testusername',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            // Buttons: Change Picture and Edit Profile
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  label: const Text('Change Picture'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // About Me Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet. In quia voluptas hic amet blanditiis est quae minus. '
              'Eos nihil tempora ut pariatur sint aut reiciendis eveniet et Quis eligendi est facere '
              'quasi 33 voluptatem aspernatur est velit voluptas.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            // Member Since Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Member Since: August 21, 2024',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Buttons: Already Watched, Want to Watch, Dashboard, Reviews
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                ProfileButton(
                  label: 'Already watched',
                  icon: Icons.check,
                ),
                ProfileButton(
                  label: 'Want to watch',
                  icon: Icons.bookmark_border,
                ),
                ProfileButton(
                  label: 'Dashboard',
                  icon: Icons.dashboard_outlined,
                ),
                ProfileButton(
                  label: 'Reviews',
                  icon: Icons.reviews_outlined,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Button: Favourites
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border, color: Colors.white),
              label: const Text('Favourites'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(color: Colors.white, width: 1),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
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

// Custom button widget for profile page
class ProfileButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const ProfileButton({
    required this.label,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1),
        minimumSize: const Size(150, 40),
      ),
    );
  }
}
