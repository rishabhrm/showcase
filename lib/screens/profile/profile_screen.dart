import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/navbar.dart';
import '../../widgets/profile_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _user;
  String? _name;
  String? _username;
  String? _aboutMe;
  String? _profilePicture;
  String? _memberSince;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  // Fetch the user data from Firestore
  Future<void> _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Fetch user data from Firestore
      final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      setState(() {
        _user = user;
        _name = userData['name'];
        _username = userData['username'];
        _aboutMe = userData['aboutMe'];
        _profilePicture = userData['profilePicture'];
        _memberSince = userData['memberSince'];
      });
    }
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
        child: _user == null // Check if the user data is loaded
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  CircleAvatar(
                    backgroundImage: _profilePicture != null
                        ? NetworkImage(_profilePicture!) // Display profile picture from URL
                        : const AssetImage('assets/pfp.jpg') as ImageProvider, 
                    radius: 55,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _name ?? 'Loading...', // Show name if available
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    _username ?? '@username', // Show username if available
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: ProfileButton(
                              icon: Icons.image_outlined,
                              label: 'Change Picture',
                              onPressed: () {})),
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
                  Text(
                    _aboutMe ?? 'No information available', // Show about me text
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Member Since: ${_memberSince ?? 'Loading...'}', // Show member since date
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
