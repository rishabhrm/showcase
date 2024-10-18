import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../widgets/navbar.dart';
import '../../widgets/searchbar.dart';
import '../../widgets/genre.dart';
import '../search/genre_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final String apiKey = '7f9aa6577f017c199547b077ae33f882';
  List<Genre> genres = [];

  @override
  void initState() {
    super.initState();
    fetchGenres();
  }

 Future<void> fetchGenres() async {
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US'),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<dynamic> genreList = data['genres'];

    // Sample mapping of genres to image URLs. Update with actual images as needed.
    Map<int, String> genreImages = {
      28: 'https://image.tmdb.org/t/p/original/u9tWvLMKCRryraFCoLhDdLC0gP1.jpg', // Action
      12: 'https://image.tmdb.org/t/p/original/8hSjOHRY4OUEpqxszYbMdem8z9C.jpg', // Adventure
      16: 'https://image.tmdb.org/t/p/original/s3FiHTdpQVpqIqdBxLLiy40wGut.jpg', // Animation
      35: 'https://image.tmdb.org/t/p/original/5ESxsJ7oiNJ5PZM4fqDMGQbcK2e.jpg', //com
      80, //crime
      99, //documentry
      18, //drama
      10751: 'https://image.tmdb.org/t/p/original/79nTeB7ciywvWdv9Uyl6JBQpDZm.jpg', //family
      14 //fantasy
      36, //history
      27, //horror
      10402, //music
      9648, //mystery
      10749: 'https://image.tmdb.org/t/p/original/AjoaBmNAmEPkAcQyhOk08u0mCcu.jpg', //rom
      878: 'https://image.tmdb.org/t/p/original/r8FD6CC3GgjWaGVkZh00AcedfpA.jpg', //sci-fi
      10770, //tv movie
      53, //thriller
      10752, //war
      37, //western
    };

    setState(() {
      genres = genreList.map((genre) {
        return Genre(
          id: genre['id'],
          name: genre['name'],
          image: genreImages[genre['id']] ?? '',
        );
      }).toList();
    });
  } else {
    throw Exception('Failed to load genres');
  }
}


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
              child: genres.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GenreScreen(
                                  genreId: genre.id,
                                  genreName: genre.name,
                                ),
                              ),
                            );
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
