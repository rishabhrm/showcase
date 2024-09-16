import 'package:flutter/material.dart';
import '../widgets/movie_list.dart';

class WatchedScreen extends StatefulWidget {
  const WatchedScreen({super.key});

  @override
  _WatchedScreenState createState() => _WatchedScreenState();
}

class _WatchedScreenState extends State<WatchedScreen> {
  final List<Map<String, String>> favouriteMovies = [
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/kziYpr5Nfw60P0My8aj1sgCEqed.jpg',
      'title': 'Tomorrowland',
      'genre': 'sci-fi, comedy, adventure',
      'rating': '8.2/10',
      'added on': 'Aug 11, 2024',
    },
    {
      'image': 'https://media.s-bol.com/R5OoKMBqGn3q/6yk9Rl/550x786.jpg',
      'title': 'The Man Who Knew Infinity',
      'genre': 'sci-fi, comedy, adventure',
      'rating': '8.2/10',
      'added on': 'Aug 11, 2024',
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg',
      'title': 'La La Land',
      'genre': 'sci-fi, comedy, adventure',
      'rating': '8.2/10',
      'added on': 'Aug 11, 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        elevation: 0, // Remove the shadow of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45).copyWith(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Watched',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 35),
            Expanded(
              child: MovieList(movies: favouriteMovies),
            ),
          ],
        ),
      ),
    );
  }
}