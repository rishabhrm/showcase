import 'package:flutter/material.dart';
import '../../widgets/genre.dart';
import '../../widgets/navbar.dart';
import '../../widgets/searchbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Genre> genres = [
    Genre(image: 'assets/action.jpg', name: 'Action'),
    Genre(image: 'assets/comedy.jpg', name: 'Comedy'),
    Genre(image: 'assets/mystery.jpg', name: 'Mystery'),
    Genre(image: 'assets/adventure.jpg', name: 'Adventure'),
    Genre(image: 'assets/family.jpg', name: 'Family'),
    Genre(image: 'assets/romance.jpg', name: 'Romance'),
    Genre(image: 'assets/scifi.jpg', name: 'Sci-fi'),
    Genre(image: 'assets/animation.jpg', name: 'Animation'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90),
            const Text(
              'Search',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Searchbar(),
            const SizedBox(height: 30),
            const Text(
              'Prefer a specific genre? We’ve got it covered!',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 28 / 16,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 26,
                ),
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  return GenreTile(
                    genre: genre,
                    onTap: () {
                      Navigator.pushNamed(context, '/genre');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
