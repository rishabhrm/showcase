import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../movie_data.dart';
import '../widgets/cast_list.dart';
import '../widgets/horizontal_list.dart';

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
    movieDetails = fetchMovieDetails(
        widget.movieId); // Fetch movie details based on movieId
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
        language: jsonResponse['original_language'] ?? 'N/A',
        overview: jsonResponse['overview'] ?? 'No Overview available',
        genres: (jsonResponse['genres'] as List<dynamic>?)
                ?.map((genre) => genre['name'].toString())
                .toList() ??
            [],
        cast: (jsonResponse['credits']['cast'] as List<dynamic>?)
                ?.map((castMember) {
              return Cast(
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
                    backdropPath: rec['backdrop_path'] ?? '',
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
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          }

          Movie movie = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.backdropPath}', // Backdrop image
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: -12,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: Icon(Icons.keyboard_arrow_down,
                                size: 40, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${movie.releaseDate.split('-')[0]} • ${movie.runtime} min • ${movie.language}', // Year and duration
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
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
                    movie.genres.join(' | '), // Display genres
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    movie.overview,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.check, size: 22),
                            onPressed: () {},
                          ),
                          Text(
                            'Add to list',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.bookmark_border, size: 22),
                            onPressed: () {},
                          ),
                          Text(
                            'Want to watch',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border, size: 22),
                            onPressed: () {},
                          ),
                          Text(
                            'Favourite',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'CAST',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  CastSection(
                    castData: movie.cast
                        .map((cast) => {
                              'imageUrl':
                                  'https://image.tmdb.org/t/p/w500${cast.profilePath}',
                              'name': cast.name,
                            })
                        .toList(),
                    onTap: (index) {
                      Navigator.pushNamed(context, '/actor');
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'REVIEWS',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
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
                  SizedBox(height: 8),
                  Text(
                    "An exquisite bit of writing of a story worth retelling and revisited again and again. The story of the mathematician Srinivasa Ramanujam, the unschooled genius who became Fellow of the Royal Society, and who has still left us unsolved riddles",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 15),
                  Row(
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
                  SizedBox(height: 8),
                  Text(
                    "An exquisite bit of writing of a story worth retelling and revisited again and again. The story of the mathematician Srinivasa Ramanujam, the unschooled genius who became Fellow of the Royal Society, and who has still left us unsolved riddles",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Your Review',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    maxLines: 4,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Write your review here',
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: 1 / 2.4,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Post Review',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'WHERE TO WATCH',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
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
                                : Container(
                                    width: 40,
                                    height: 40), // Placeholder if logo is empty
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.name,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
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
                  const SizedBox(height: 25),
                  // Recommendations section
                  Text(
                    'RECOMMENDATIONS',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: HorizontalList(
                      items: movie.recommendations.map((recommendedMovie) {
                        return {
                          'image':
                              'https://image.tmdb.org/t/p/w500${recommendedMovie.backdropPath}',
                          'title': recommendedMovie.title,
                        };
                      }).toList(),
                      onTap: (index) {
                        // Navigate to the selected movie's detail page
                        //Navigator.pushNamed(context, '/movie', arguments: movie.recommendations[index].id);
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
