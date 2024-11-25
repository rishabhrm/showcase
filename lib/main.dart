import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'routes.dart';
import 'theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor:
                    themeNotifier.isDarkMode ? Colors.white : Colors.black,
                decorationColor:
                    themeNotifier.isDarkMode ? Colors.white : Colors.black,
              ),
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
        iconTheme: IconThemeData(
          color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor:
              themeNotifier.isDarkMode ? Colors.black : Colors.white,
          selectedItemColor:
              themeNotifier.isDarkMode ? Colors.white : Colors.black,
          unselectedItemColor: themeNotifier.isDarkMode
              ? Colors.white.withOpacity(0.6)
              : Colors.black.withOpacity(0.6),
        ),
        cardTheme: CardTheme(
          color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: themeNotifier.isDarkMode ? Colors.white70 : Colors.black87,
          ),
          hintStyle: TextStyle(
            color: themeNotifier.isDarkMode ? Colors.white70 : Colors.black54,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          suffixIconColor:
              themeNotifier.isDarkMode ? Colors.white70 : Colors.black54,
          fillColor: themeNotifier.isDarkMode
              ? const Color.fromRGBO(90, 90, 90, 1)
              : const Color.fromRGBO(230, 230, 230, 1),
        ),
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
