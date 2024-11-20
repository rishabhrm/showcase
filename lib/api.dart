import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/actor_data.dart';

class APIService {
  final String apiKey = '7f9aa6577f017c199547b077ae33f882';

  Future<List<Map<String, String>>> fetchMustWatchMovies() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&page=1'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((movie) => {
                'id': movie['id'].toString(),
                'title': movie['title'] as String,
                'image': 'https://image.tmdb.org/t/p/w500${movie['poster_path'] ?? ''}',
              })
          .toList();
    } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  }

  Future<List<Map<String, String>>> fetchMustWatchTV() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/tv/top_rated?api_key=$apiKey&page=1'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((tv) => {
                'id': tv['id'].toString(),
                'title': tv['name'] as String,
                'image': 'https://image.tmdb.org/t/p/w500${tv['poster_path'] ?? ''}',
              })
          .toList();
    } else {
      throw Exception('Failed to load TV shows: ${response.statusCode}');
    }
  }

  Future<List<Map<String, String>>> fetchCarouselItems() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&page=1'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((movie) => {
                'id': movie['id'].toString(),
                'title': movie['title'] as String,
                'image': 'https://image.tmdb.org/t/p/w500${movie['backdrop_path'] ?? ''}',
              })
          .toList();
    } else {
      throw Exception('Failed to load now playing movies: ${response.statusCode}');
    }
  }

  Future<ActorDetails> fetchActorDetails(int actorId) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/person/$actorId?api_key=$apiKey'),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return ActorDetails.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load actor details');
    }
  }

  Future<List<Map<String, String>>> fetchActorKnownForMovies(int actorId) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/person/$actorId/movie_credits?api_key=$apiKey'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['cast'] as List)
          .map((movie) => {
                'id': movie['id'].toString(),
                'title': movie['title'] as String,
                'image': 'https://image.tmdb.org/t/p/w500${movie['poster_path'] ?? ''}',
              })
          .toList();
    } else {
      throw Exception('Failed to load actor movies');
    }
  }

  Future<List<Map<String, dynamic>>> fetchGenres() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['genres'] as List)
          .map((genre) => {
                'id': genre['id'],
                'name': genre['name'],
              })
          .toList();
    } else {
      throw Exception('Failed to load genres');
    }
  }

  Future<Map<String, String>> fetchMoviesById(int movieId) async {
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey'),
  );
  if (response.statusCode == 200) {
    final movie = json.decode(response.body);
    return {
      'image': 'https://image.tmdb.org/t/p/w500${movie['poster_path'] ?? ''}',
      'title': movie['title'] ?? 'Unknown',
      'genre': (movie['genres'] as List)
              .map((genre) => genre['name'])
              .join(', ') ??
          'Unknown',
      'rating': '${movie['vote_average']?.toStringAsFixed(1)}/10',
    };
  } else {
    throw Exception('Failed to fetch movie details for ID $movieId');
  }
}


  Future<List<Map<String, String>>> fetchMoviesByGenre(int genreId) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$genreId'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      return results.map((movie) {
        return {
          'id': movie['id'].toString(),
          'title': movie['title'] as String,
          'image': 'https://image.tmdb.org/t/p/w500${movie['poster_path'] ?? ''}',
        };
      }).toList();
    } else {
      throw Exception('Failed to load movies for genre');
    }
  }
}