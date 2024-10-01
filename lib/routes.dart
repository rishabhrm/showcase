import 'package:flutter/material.dart';
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
import '../screens/reviews_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/genre_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/actor_screen.dart';
import '../screens/movie_screen.dart';
import '../screens/tv_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String auth = '/auth';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String movie = '/movie';
  static const String tv = '/tv';
  static const String actor = '/actor';
  static const String search = '/search';
  static const String genre = '/genre';
  static const String profile = '/profile';
  static const String favourite = '/favourite';
  static const String watched = '/watched';
  static const String planned = '/planned';
  static const String reviews = '/reviews';
  static const String dashboard = '/dashboard';
  static const String profileEdit = '/profile_edit';
  static const String settings = '/settings';
  static const String deleteAccount = '/delete_acc';
  static const String changePassword = '/change_psw';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => SplashScreen(),
      login: (context) => LoginScreen(),
      auth: (context) => AuthScreen(),
      signup: (context) => SignupScreen(),
      home: (context) => HomeScreen(),
      movie: (context) => MovieDetailScreen(),
      tv: (context) => TVDetailScreen(),
      actor: (context) => ActorProfileScreen(),
      search: (context) => SearchScreen(),
      genre: (context) => GenreScreen(),
      profile: (context) => ProfileScreen(),
      favourite: (context) => FavouriteScreen(),
      watched: (context) => WatchedScreen(),
      planned: (context) => PlannedScreen(),
      reviews: (context) => ReviewsScreen(),
      dashboard: (context) => DashboardScreen(),
      profileEdit: (context) => EditProfileScreen(),
      settings: (context) => SettingsScreen(),
      deleteAccount: (context) => DeleteAccountScreen(),
      changePassword: (context) => ChangePasswordScreen(),
    };
  }
}
