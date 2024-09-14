import 'package:flutter/material.dart';

import './screens/splash_screen.dart';
import './screens/login_screen.dart';
import './screens/auth_screen.dart';
import './screens/signup_screen.dart';
import './screens/search_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'showcase',
      home: SearchScreen(),
      debugShowCheckedModeBanner: false,      
    );
  }
}
