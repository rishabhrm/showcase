import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../widgets/navbar.dart';
import '../../widgets/genre.dart';
import '../../widgets/searchbar.dart';
import '../search/genre_screen.dart';
import '../search/search_result_screen.dart'; // Import the SearchResultsScreen

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
        35: 'https://image.tmdb.org/t/p/original/5ESxsJ7oiNJ5PZM4fqDMGQbcK2e.jpg', // Comedy
        80: 'https://image.tmdb.org/t/p/original/vJ8H8skNbNzXWVyDNSgxTZMTPA6.jpg', // Crime
        99: 'https://image.tmdb.org/t/p/original/6S159wVNvQfwoQh5yBxWKCsI1YL.jpg', // Documentary
        18: 'https://image.tmdb.org/t/p/original/52AfXWuXCHn3UjD17rBruA9f5qb.jpg', // Drama
        10751: 'https://image.tmdb.org/t/p/original/79nTeB7ciywvWdv9Uyl6JBQpDZm.jpg', // Family
        14: 'https://image.tmdb.org/t/p/original/8BeMLO3VRBNbGMj5h6F7raoMLYq.jpg', // Fantasy
        36: 'https://image.tmdb.org/t/p/original/eHMh7kChaNeD4VTdMCXLJbRTzcI.jpg', // History
        27: 'https://image.tmdb.org/t/p/original/aQCCpAIdWAp6wyFgjMry4okwrZo.jpg', // Horror
        10402: 'https://image.tmdb.org/t/p/original/abVpQWJ1pLoR3IPWG94Ed6oKnrH.jpg', // Music
        9648: 'https://image.tmdb.org/t/p/original/g1eZwt1uXQupUY1WpU8iQXkcaK6.jpg', // Mystery
        10749: 'https://image.tmdb.org/t/p/original/AjoaBmNAmEPkAcQyhOk08u0mCcu.jpg', // Romance
        878: 'https://image.tmdb.org/t/p/original/r8FD6CC3GgjWaGVkZh00AcedfpA.jpg', // Sci-Fi
        10770: 'https://image.tmdb.org/t/p/original/6gvocf4kU9qJyUVZEDveOtLkaMu.jpg', // TV Movie
        53: 'https://image.tmdb.org/t/p/original/8xt8AMb1OKC63AdhNSaYBWxB4Iq.jpg', // Thriller
        10752: 'https://image.tmdb.org/t/p/original/ut4ALkOwEl01nqODS3s6q4C2uWp.jpg', // War
        37: 'https://image.tmdb.org/t/p/original/cpkvb8y35zNTb20ym09ohkoB157.jpg', // Western
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

  // Function to handle search
  void handleSearch(String query) {
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(searchQuery: query), // Navigate to SearchResultsScreen
        ),
      );
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
            Searchbar(onSearch: handleSearch),
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