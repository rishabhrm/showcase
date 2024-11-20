import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<Map<String, String>> movies;

  const MovieList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: (movie['image']!.startsWith('http'))
                    ? Image.network(movie['image']!,
                        width: 100, height: 150, fit: BoxFit.cover)
                    : Image.asset(movie['image']!,
                        width: 100, height: 150, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(movie['title']!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 9),
                    Text('Genre: ${movie['genre']!}',
                        style: const TextStyle(fontSize: 13)),
                    const SizedBox(height: 11),
                    Text('Rating: ${movie['rating']!}',
                        style: const TextStyle(fontSize: 14))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
