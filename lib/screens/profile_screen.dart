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
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150x150'),
              radius: 60,
            ),
            const SizedBox(height: 10),
            const Text(
              'Test User',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            const Text(
              '@testusername',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ProfileButton(icon: Icons.camera_alt, label: 'Change Picture'),
                ProfileButton(icon: Icons.edit, label: 'Edit Profile'),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              'About Me',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet. In quia voluptas hic amet blanditiis est quae minus. '
              'Eos nihil tempora ut pariatur sint aut reiciendis eveniet et Quis eligendi est facere '
              'quasi 33 voluptatem aspernatur est velit voluptas.',
              style: TextStyle(color: Colors.white70, fontSize: 11),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 15),
            const Text(
              'Member Since: August 21, 2024',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ProfileButton(icon: Icons.visibility, label: 'Already watched'),
                ProfileButton(icon: Icons.star, label: 'Want to'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ProfileButton(icon: Icons.dashboard, label: 'Dashboard'),
                ProfileButton(icon: Icons.rate_review, label: 'Reviews'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(child: ProfileButton(icon: Icons.favorite, label: 'Favourites')),
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
        style: const TextStyle(color: Colors.white, fontSize: 10), // Smaller text size
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(color: Colors.white, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(0, 30), // Allow buttons to take equal space
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10), // Adjusted padding
      ),
    );
  }
}
