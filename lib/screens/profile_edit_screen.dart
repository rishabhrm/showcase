import 'package:flutter/material.dart';
import '../widgets/elevated_button.dart';
import '../widgets/text_field2.dart';
import '../widgets/text_field3.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
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
            const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Form(
              child: Column(
                children: [
                  const CustomTextField(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    initialValue: 'Test Name',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextField(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    initialValue: 'testusername',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextField(
                    labelText: 'E-mail address',
                    hintText: 'Enter your e-mail address',
                    initialValue: 'user@testmail.com',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextField3(
                    labelText: 'About Me',
                    hintText: 'Something about yourself',
                    initialValue:
                        'Lorem ipsum dolor sit amet. In quia voluptas hic amet blanditiis est quae minus. Eos nihil tempora ut pariatur sint aut reiciendis eveniet et Quis eligendi est facere quasi 33 voluptatem aspernatur est velit voluptas.',
                  ),
                  const SizedBox(height: 50),
                  CustomElevatedButton(
                    label: 'Update Profile',
                    onPressed: () {},
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
