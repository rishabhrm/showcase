import 'package:flutter/material.dart';
import '../../widgets/movie_list.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<Map<String, String>> favouriteMovies = [
    {
      'image': 'assets/dw.jpg',
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
      'image': 'assets/dw.jpg',
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
          icon: const Icon(
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
            const SizedBox(height: 20),
            const Text(
              'Favourites',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 35),
            Expanded(
              child: SingleChildScrollView(
                child: MovieList(movies: favouriteMovies),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
