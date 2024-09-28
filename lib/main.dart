import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:showcase/screens/profile_screen.dart';
//import 'package:showcase/screens/actor_screen.dart';
//import 'package:showcase/screens/movie_screen.dart';
//import 'package:showcase/screens/tv_screen.dart';
//import 'package:showcase/screens/dashboard_screen.dart';
//import 'package:showcase/screens/reviews_screen.dart';

//import 'package:showcase/screens/home_screen.dart';
//import 'package:showcase/screens/search_screen.dart';
//import 'package:showcase/screens/genre_screen.dart';

import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/auth_screen.dart';
import '../screens/signup_screen.dart';

import '../screens/settings_screen.dart';
import '../screens/change_pass_screen.dart';
import '../screens/delete_acc_screen.dart';
import '../screens/profile_edit_screen.dart';

import '../screens/fav_screen.dart';
import '../screens/watched_screen.dart';
import '../screens/plan_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'showcase',
      home: PlannedScreen(),
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
