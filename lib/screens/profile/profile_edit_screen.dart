import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field2.dart';
import '../../widgets/text_field3.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Controllers to hold the updated values
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _aboutMeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Fetch user data when the screen loads
  }

  // Fetch user data from Firestore
  Future<void> fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          _nameController.text = userDoc['name'] ?? 'Test Name';
          _usernameController.text = userDoc['username'] ?? 'testusername';
          _emailController.text = userDoc['email'] ?? 'user@testmail.com';
          _aboutMeController.text = userDoc['aboutMe'] ?? 'No description available';
        });
      }
    }
  }

  // Update profile information
  Future<void> updateProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore.collection('users').doc(user.uid).update({
          'name': _nameController.text,
          'username': _usernameController.text,
          'email': _emailController.text,
          'aboutMe': _aboutMeController.text,
        });

        // Show a confirmation message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        Navigator.pop(context); // Go back to profile screen after update
      } catch (e) {
        // Handle any errors
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update profile')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
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
            const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Form(
              child: Column(
                children: [
                  // TextField for name
                  CustomTextField(
                    controller: _nameController,
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                  const SizedBox(height: 20),
                  // TextField for username
                  CustomTextField(
                    controller: _usernameController,
                    labelText: 'Username',
                    hintText: 'Enter your username',
                  ),
                  const SizedBox(height: 20),
                  // TextField for email
                  CustomTextField(
                    controller: _emailController,
                    labelText: 'E-mail address',
                    hintText: 'Enter your e-mail address',
                  ),
                  const SizedBox(height: 20),
                  // TextField for aboutMe
                  CustomTextField3(
                    controller: _aboutMeController,
                    labelText: 'About Me',
                    hintText: 'Something about yourself',
                  ),
                  const SizedBox(height: 50),
                  // Button to update profile
                  CustomElevatedButton(
                    label: 'Update Profile',
                    onPressed: updateProfile,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
