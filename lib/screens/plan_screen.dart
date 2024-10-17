import 'package:flutter/material.dart';
import '../widgets/movie_list.dart';

class PlannedScreen extends StatefulWidget {
  const PlannedScreen({super.key});

  @override
  _PlannedScreenState createState() => _PlannedScreenState();
}

class _PlannedScreenState extends State<PlannedScreen> {
  final List<Map<String, String>> favouriteMovies = [
    {
      'image':
          'assets/dw.jpg',
      'title': 'Tomorrowland',
      'genre': 'sci-fi, comedy, adventure',
      'rating': '8.2/10',
      'added on': 'Aug 11, 2024',
    },
    {
      'image': 'assets/dw.jpg',
      'title': 'The Man Who Knew Infinity',
      'genre': 'sci-fi, comedy, adventure',
      'rating': '8.2/10',
      'added on': 'Aug 11, 2024',
    },
    {
      'image':
          'assets/dw.jpg',
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
              'Planned to Watch',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
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
