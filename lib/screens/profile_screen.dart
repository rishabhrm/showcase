import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/profile_button.dart';

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
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, size: 30),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            const Text(
              '@testusername',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: ProfileButton(
                        icon: Icons.image_outlined,
                        label: 'Change Picture',
                        onPressed: () {
                          // Add your change picture logic here
                        })),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileButton(
                    icon: Icons.edit,
                    label: 'Edit Profile',
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile_edit');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'About Me',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet. In quia voluptas hic amet blanditiis est quae minus. '
              'Eos nihil tempora ut pariatur sint aut reiciendis eveniet et Quis eligendi est facere '
              'quasi 33 voluptatem aspernatur est velit voluptas. fvvjnsofvosvnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 15),
            const Text(
              'Member Since: August 21, 2024',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ProfileButton(
                        icon: Icons.check,
                        label: 'Already watched',
                        onPressed: () {
                          Navigator.pushNamed(context, '/watched');
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProfileButton(
                        icon: Icons.bookmark_border,
                        label: 'Want to watch',
                        onPressed: () {
                          Navigator.pushNamed(context, '/planned');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Expanded(
                      child: ProfileButton(
                        icon: Icons.favorite_outline,
                        label: 'Favourites',
                        onPressed: () {
                          Navigator.pushNamed(context, '/favourite');
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProfileButton(
                        icon: Icons.note_alt_outlined,
                        label: 'Reviews',
                        onPressed: () {
                          Navigator.pushNamed(context, '/reviews');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Expanded(
                      child: ProfileButton(
                        icon: Icons.pie_chart_rounded,
                        label: 'Dashboard',
                        onPressed: () {
                          Navigator.pushNamed(context, '/dashboard');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
