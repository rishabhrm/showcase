import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/navbar.dart';
import '../../widgets/profile_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String name = '';
  String username = '';
  String aboutMe = '';
  String profilePicture = '';
  String memberSince = '';

  Future<void> fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          name = userDoc['name'] ?? 'Test User';
          username = userDoc['username'] ?? '@testusername';
          aboutMe = userDoc['aboutMe'] ?? 'No description available';
          profilePicture = userDoc['profilePicture'] ?? 'assets/pfp.jpg'; // Default image
          memberSince = userDoc['userSince']?.toDate() != null
              ? userDoc['userSince'].toDate().toString()
              : 'No date available';
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

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
              backgroundImage: NetworkImage(profilePicture),
              radius: 55,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Text(
              '@$username',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // Expanded(
                //     child: ProfileButton(
                //         icon: Icons.image_outlined,
                //         label: 'Change Picture',
                //         onPressed: () {})),
                // const SizedBox(width: 10),
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
            Text(
              aboutMe,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 15),
            Text(
              'Member Since: $memberSince',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
      bottomNavigationBar: const Navbar(),
    );
  }
}
