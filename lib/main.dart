import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'showcase',
      theme: themeNotifier.currentTheme.copyWith(
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme.apply(
              bodyColor:
                  themeNotifier.isDarkMode ? Colors.white : Colors.black),
        ),
        scaffoldBackgroundColor:
            themeNotifier.isDarkMode ? Colors.black : Colors.white,
        appBarTheme: AppBarTheme(
          color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor:
                themeNotifier.isDarkMode ? Colors.black : Colors.white,
            backgroundColor:
                themeNotifier.isDarkMode ? Colors.white : Colors.black,
            minimumSize: const Size(double.infinity, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 12),
            side: BorderSide(
              color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: themeNotifier.isDarkMode ? Colors.black : Colors.white,
          selectedItemColor: themeNotifier.isDarkMode ? Colors.white : Colors.black,
          unselectedItemColor: themeNotifier.isDarkMode ? Colors.white.withOpacity(0.6) : Colors.black.withOpacity(0.6),
        ),
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
