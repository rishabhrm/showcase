import 'package:flutter/material.dart';
import '../screens/system/splash_screen.dart';
import '../screens/system/welcome_screen.dart';
import '../screens/system/login_screen.dart';
import '../screens/system/auth_screen.dart';
import '../screens/system/signup_screen.dart';
import '../screens/system/settings_screen.dart';
import '../screens/system/change_pass_screen.dart';
import '../screens/system/delete_acc_screen.dart';
import '../screens/system/error_screen.dart';
import '../screens/profile/profile_edit_screen.dart';
import '../screens/profile/fav_screen.dart';
import '../screens/profile/watched_screen.dart';
import '../screens/profile/plan_screen.dart';
import '../screens/profile/reviews_screen.dart';
import '../screens/profile/dashboard_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/search/genre_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/home/actor_screen.dart';
import '../screens/home/movie_screen.dart';
import '../screens/home/tv_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
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
      splash: (context) => const SplashScreen(),
      welcome: (context) => const WelcomeScreen(), // Get Started Screen
      login: (context) => const LoginScreen(),
      auth: (context) => const AuthScreen(),
      signup: (context) => const SignupScreen(),
      home: (context) => const HomeScreen(),
      movie: (context) {
        final movieId = ModalRoute.of(context)!.settings.arguments as int?;
        if (movieId != null) {
          return MovieDetailScreen(movieId: movieId);
        } else {
          return const ErrorScreen(); // Handle missing argument case
        }
      },
      tv: (context) {
        final tvId = ModalRoute.of(context)!.settings.arguments as int?;
        if (tvId != null) {
          return TVDetailScreen(tvId: tvId);
        } else {
          return const ErrorScreen(); // Handle missing argument case
        }
      },
      actor: (context) {
        final actorId = ModalRoute.of(context)!.settings.arguments as int?;
        if (actorId != null) {
          return ActorProfileScreen(actorId: actorId);
        } else {
          return const ErrorScreen(); // Handle missing argument case
        }
      },
      search: (context) => SearchScreen(),
      genre: (context) {
        final arguments =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
        final genreId = arguments?['id'] as int?;
        final genreName = arguments?['name'] as String?;
        if (genreId != null && genreName != null) {
          return GenreScreen(genreId: genreId, genreName: genreName);
        } else {
          return const ErrorScreen(); // Handle missing argument case
        }
      },
      profile: (context) => ProfileScreen(),
      favourite: (context) => FavouriteScreen(),
      watched: (context) => WatchedScreen(),
      planned: (context) => PlannedScreen(),
      reviews: (context) => ReviewsScreen(),
      dashboard: (context) => DashboardScreen(),
      profileEdit: (context) => EditProfileScreen(),
      settings: (context) => const SettingsScreen(),
      deleteAccount: (context) => const DeleteAccountScreen(),
      changePassword: (context) => const ChangePasswordScreen(),
    };
  }
}
