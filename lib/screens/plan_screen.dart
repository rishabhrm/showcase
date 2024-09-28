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
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Planned to Watch',
              style: TextStyle(
                color: Colors.white,
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
