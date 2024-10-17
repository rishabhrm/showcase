import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/actor_data.dart';

class APIService {
  final String apiKey = '7f9aa6577f017c199547b077ae33f882';

  Future<List<Map<String, String>>> fetchMustWatchMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((movie) => {
                'image':
                    'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                'title': movie['title'] as String,
                'id': movie['id'].toString(),
              })
          .toList()
          .cast<Map<String, String>>();
    } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  }

  Future<List<Map<String, String>>> fetchMustWatchTV() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/tv/top_rated?api_key=$apiKey&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((tv) => {
                'image': 'https://image.tmdb.org/t/p/w500${tv['poster_path']}',
                'title': tv['name'] as String,
                'id': tv['id'].toString(),
              })
          .toList()
          .cast<Map<String, String>>();
    } else {
      throw Exception('Failed to load TV shows: ${response.statusCode}');
    }
  }

  Future<List<Map<String, String>>> fetchCarouselItems() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((movie) => {
                'image':
                    'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}',
                'title': movie['title'] as String,
                'id': movie['id'].toString(),
              })
          .toList()
          .cast<Map<String, String>>();
    } else {
      throw Exception(
          'Failed to load now playing movies: ${response.statusCode}');
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
      Uri.parse(
          'https://api.themoviedb.org/3/person/$actorId/movie_credits?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['cast'] as List)
          .map((movie) => {
                'image':
                    'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                'title': movie['title'] as String,
                'id': movie['id'].toString(),
              })
          .toList()
          .cast<Map<String, String>>();
    } else {
      throw Exception('Failed to load actor movies');
    }
  }
}
