import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenreScreen extends StatefulWidget {
  final int genreId;
  final String genreName;

  const GenreScreen({required this.genreId, required this.genreName, Key? key})
      : super(key: key);

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  final String apiKey = '7f9aa6577f017c199547b077ae33f882';
  List<Map<String, String>> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMoviesByGenre();
  }

  Future<void> fetchMoviesByGenre() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=${widget.genreId}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      setState(() {
        movies = results
            .map((movie) {
              return {
                'title': movie['title'] as String,
                'image':
                    'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
                        as String,
              };
            })
            .toList()
            .cast<Map<String, String>>();
      });
    } else {
      throw Exception('Failed to load movies for genre');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 38),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 55),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.movie, size: 40),
                  const SizedBox(width: 20),
                  Text(
                    widget.genreName,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Center(
              child: Text(
                'Explore movies of the ${widget.genreName} genre.',
                style:
                    const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            if (movies.isEmpty)
              const Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: VerticalList(movies: movies),
              ),
          ],
        ),
      ),
    );
  }
}

class VerticalList extends StatelessWidget {
  const VerticalList({
    super.key,
    required this.movies,
  });

  final List<Map<String, String>> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.57,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        final imageUrl = movie['image'] ?? '';
        final title = movie['title'] ?? 'No Title';

        return GestureDetector(
          onTap: () {
            final movieId = movies[index]['id'];
            if (movieId != null) {
              Navigator.pushNamed(
                context,
                '/movie',
                arguments: int.parse(movieId),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 95,
                  height: 142.5,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 95,
                      height: 142.5,
                      color: Colors.grey,
                      child: const Icon(Icons.error, color: Colors.red),
                    );
                  },
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
