import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/movie_data.dart';
import '../../widgets/cast_list.dart';
import '../../widgets/horizontal_list.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailScreen({super.key, required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<Movie> movieDetails;

  @override
  void initState() {
    super.initState();
    movieDetails = fetchMovieDetails(widget.movieId);
  }

  Future<Movie> fetchMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId?api_key=7f9aa6577f017c199547b077ae33f882&append_to_response=credits,recommendations,watch/providers'),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      return Movie(
        title: jsonResponse['title'] ?? 'No Title',
        backdropPath: jsonResponse['backdrop_path'] ?? '',
        releaseDate: jsonResponse['release_date'] ?? 'N/A',
        runtime: jsonResponse['runtime'] ?? 0,
        numberOfSeasons: jsonResponse['numberOfSeasons'] ?? 0,
        language: jsonResponse['original_language'] ?? 'N/A',
        tagline: jsonResponse['tagline'] ?? 'No Tagline available',
        overview: jsonResponse['overview'] ?? 'No Overview available',
        genres: (jsonResponse['genres'] as List<dynamic>?)
                ?.map((genre) => genre['name'].toString())
                .toList() ??
            [],
        cast: (jsonResponse['credits']['cast'] as List<dynamic>?)
                ?.map((castMember) {
              return Cast(
                id: castMember['id'],
                name: castMember['name'],
                profilePath: castMember['profile_path'] ?? '',
              );
            }).toList() ??
            [],
        recommendations:
            (jsonResponse['recommendations']['results'] as List<dynamic>?)
                    ?.map((rec) {
                  return RecommendedMovie(
                    id: rec['id'],
                    title: rec['title'],
                    backdropPath: rec['poster_path'] ?? '',
                  );
                }).toList() ??
                [],
        watchProviders: (jsonResponse['watch/providers']['results']['US']
                        ['flatrate'] as List<dynamic>?)
                    ?.isNotEmpty ??
                false
            ? [
                WatchProvider(
                  name: jsonResponse['watch/providers']['results']['US']
                      ['flatrate'][0]['provider_name'],
                  logoPath: jsonResponse['watch/providers']['results']['US']
                          ['flatrate'][0]['logo_path'] ??
                      '',
                ),
              ]
            : [],
      );
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Movie>(
        future: movieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          }
          Movie movie = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 35),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.backdropPath}', // Backdrop image
                          width: double.infinity,
                          height: 190,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: -4,
                        left: -8,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(Icons.keyboard_arrow_down,
                                size: 40, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Center(
                    child: Text(
                      '${movie.releaseDate.split('-')[0]} • ${movie.runtime} min • ${movie.language}', // Year and duration
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_arrow),
                        SizedBox(width: 8),
                        Text('Play Trailer'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    movie.genres.join(' | '),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    movie.tagline,
                    style: const TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    movie.overview,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check, size: 22),
                            onPressed: () {},
                          ),
                          const Text(
                            'Add to list',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.bookmark_border, size: 22),
                            onPressed: () {},
                          ),
                          const Text(
                            'Want to watch',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border, size: 22),
                            onPressed: () {},
                          ),
                          const Text(
                            'Favourite',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'CAST',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  CastSection(
                    castData: movie.cast
                        .map((cast) => {
                              'imageUrl':
                                  'https://image.tmdb.org/t/p/w500${cast.profilePath}',
                              'name': cast.name,
                            })
                        .toList(),
                    onTap: (index) {
                      Navigator.pushNamed(
                        context,
                        '/actor',
                        arguments: movie.cast[index].id, // Pass the cast id
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'REVIEWS',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Person 1",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "An exquisite bit of writing of a story worth retelling and revisited again and again. The story of the mathematician Srinivasa Ramanujam, the unschooled genius who became Fellow of the Royal Society, and who has still left us unsolved riddles",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Person 2",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "An exquisite bit of writing of a story worth retelling and revisited again and again. The story of the mathematician Srinivasa Ramanujam, the unschooled genius who became Fellow of the Royal Society, and who has still left us unsolved riddles",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your Review',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Write your review here',
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: 1 / 2.4,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Post Review',
                          style: TextStyle(
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'WHERE TO WATCH',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: movie.watchProviders.map((provider) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: provider.logoPath.isNotEmpty
                                ? Image.network(
                                    'https://image.tmdb.org/t/p/w500${provider.logoPath}', // TMDB logo path
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  )
                                : Container(width: 40, height: 40),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const Text(
                                'Now Streaming',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'RECOMMENDATIONS',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 177,
                    child: HorizontalList(
                      items: movie.recommendations.map((recommendedMovie) {
                        return {
                          'image':
                              'https://image.tmdb.org/t/p/w500${recommendedMovie.backdropPath}',
                          'title': recommendedMovie.title,
                        };
                      }).toList(),
                      onTap: (index) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(
                              movieId: movie.recommendations[index]
                                  .id,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
