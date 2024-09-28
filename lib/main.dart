import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/auth_screen.dart';
import '../screens/signup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'showcase',
      home: SplashScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
