import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/tv_data.dart';
import '../widgets/cast_list.dart';
import '../widgets/horizontal_list.dart';

class TVDetailScreen extends StatefulWidget {
  final int tvId;
  const TVDetailScreen({super.key, required this.tvId});

  @override
  State<TVDetailScreen> createState() => _TVDetailScreenState();
}

class _TVDetailScreenState extends State<TVDetailScreen> {
  late Future<TV> tvDetails;

  @override
  void initState() {
    super.initState();
    tvDetails = fetchTVDetails(widget.tvId); // Fetch TV details based on tvId
  }

  Future<TV> fetchTVDetails(int tvId) async {
    final response = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/tv/$tvId?api_key=7f9aa6577f017c199547b077ae33f882&append_to_response=credits,recommendations,watch/providers',
      ),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      return TV(
        title: jsonResponse['name'] as String,
        backdropPath: jsonResponse['backdrop_path'] as String? ??
            '', // If you still want to keep this as nullable
        releaseDate: jsonResponse['first_air_date'] as String? ?? 'N/A',
        numberOfSeasons: jsonResponse['number_of_seasons'] as int? ?? 0,
        language: jsonResponse['original_language'] as String,
        tagline: jsonResponse['tagline'] as String? ?? 'No Tagline available',
        overview:
            jsonResponse['overview'] as String? ?? 'No Overview available',
        genres: (jsonResponse['genres'] as List<dynamic>?)
                ?.map((genre) => genre['name'].toString())
                .toList() ??
            [],
        cast: (jsonResponse['credits']['cast'] as List<dynamic>?)
                ?.map((castMember) => Cast(
                      id: castMember['id'] as int,
                      name: castMember['name'] as String,
                      profilePath: castMember['profile_path'] as String? ?? '',
                    ))
                .toList() ??
            [],
        recommendations:
            (jsonResponse['recommendations']['results'] as List<dynamic>?)
                    ?.map((rec) {
                  return RecommendedMovie(
                    id: rec['id'],
                    title: rec['name'],
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
      throw Exception('Failed to load TV details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<TV>(
        // Change to TV
        future: tvDetails, // Change to tvDetails
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          }

          TV tv = snapshot.data!; // Change movie to tv
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
                          'https://image.tmdb.org/t/p/w500${tv.backdropPath}', // Backdrop image
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
                            icon: const Icon(Icons.keyboard_arrow_down,
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
                      tv.title,
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
                      '${tv.releaseDate.split('-')[0]} • ${tv.numberOfSeasons} Seasons • ${tv.language}', // Year and duration
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {}, // Implement your trailer logic here
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
                    tv.genres.join(' | '),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    tv.tagline,
                    style: const TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    tv.overview,
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
                            onPressed: () {}, // Implement your logic here
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
                            onPressed: () {}, // Implement your logic here
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
                            onPressed: () {}, // Implement your logic here
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
                    castData: tv.cast.map((cast) {
                      return {
                        'imageUrl':
                            'https://image.tmdb.org/t/p/w500${cast.profilePath}',
                        'name': cast.name,
                      };
                    }).toList(),
                    onTap: (index) {
                      Navigator.pushNamed(
                        context,
                        '/actor',
                        arguments: tv.cast[index].id, // Pass the cast id
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
                    children: tv.watchProviders.map((provider) {
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
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 177,
                    child: HorizontalList(
                      items: tv.recommendations.map((recommendedMovie) {
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
                            builder: (context) => TVDetailScreen(
                              tvId: tv.recommendations[index].id,
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