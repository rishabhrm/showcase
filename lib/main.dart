import 'package:flutter/material.dart';

import './screens/splash_screen.dart';
import './screens/login_screen.dart';
import './screens/auth_screen.dart';
import './screens/signup_screen.dart';
import './screens/search_screen.dart';
import './screens/home_screen.dart';
import './screens/genre_screen.dart';
import './screens/settings_screen.dart';
import './screens/change_pass_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'showcase',
      home: ChangePasswordScreen(),
      debugShowCheckedModeBanner: false,      
    );
  }
}
