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
          'assets/tom.jpg',
      'title': 'Tomorrowland',
      'genre': 'sci-fi, comedy, adventure',
      'rating': '8.2/10',
      'added on': 'Aug 11, 2024',
    },
    {
      'image': 'assets/tmwki.jpg',
      'title': 'The Man Who Knew Infinity',
      'genre': 'sci-fi, comedy, adventure',
      'rating': '8.2/10',
      'added on': 'Aug 11, 2024',
    },
    {
      'image':
          'assets/lll.jpg',
      'title': 'La La Land',
      'genre': 'sci-fi, comedy, adventure',
      'rating': '8.2/10',
      'added on': 'Aug 11, 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Watched',
              style: TextStyle(
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
