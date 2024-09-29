import 'package:flutter/material.dart';
import 'package:showcase/widgets/navbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/pfp.jpg'), // Local image
              radius: 55,
            ),
            const SizedBox(height: 10),
            const Text(
              'Test User',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            const Text(
              '@testusername',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(
                    child: ProfileButton(
                        icon: Icons.image_outlined, label: 'Change Picture')),
                        SizedBox(width: 10),
                Expanded(
                    child:
                        ProfileButton(icon: Icons.edit, label: 'Edit Profile')),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'About Me',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet. In quia voluptas hic amet blanditiis est quae minus. '
              'Eos nihil tempora ut pariatur sint aut reiciendis eveniet et Quis eligendi est facere '
              'quasi 33 voluptatem aspernatur est velit voluptas. fvvjnsofvosvnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn',
              style: TextStyle(color: Colors.white70, fontSize: 12),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 15),
            const Text(
              'Member Since: August 21, 2024',
              style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                Expanded(
                    child: ProfileButton(
                        icon: Icons.check, label: 'Already watched')),
                        SizedBox(width: 10),
                Expanded(
                    child: ProfileButton(
                        icon: Icons.bookmark_border, label: 'Want to watch')),
              ],
            ),
            Row(
              children: const [
                Expanded(
                    child: ProfileButton(
                        icon: Icons.favorite_outline, label: 'Favourites')),
                        SizedBox(width: 10),
                Expanded(
                    child: ProfileButton(icon: Icons.note_alt_outlined, label: 'Reviews')),
              ],
            ),
            Row(
              children: const [
                Expanded(
                    child: ProfileButton(icon: Icons.pie_chart_rounded, label: 'Dashboard')),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}

// Unified button widget for action buttons
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
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white, size: 16), // Smaller icon size
      label: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontSize: 10), // Smaller text size
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(color: Colors.white, width: 1),
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
