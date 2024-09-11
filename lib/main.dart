import 'package:flutter/material.dart';
import 'package:showcase/screens/auth_screen.dart';
import 'package:showcase/screens/login_screen.dart';
import 'package:showcase/screens/signup_screen.dart';
import 'package:showcase/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'showcase',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,      
    );
  }
}