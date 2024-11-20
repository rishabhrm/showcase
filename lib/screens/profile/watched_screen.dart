import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../api.dart';
import '../../widgets/movie_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WatchedScreen extends StatefulWidget {
  const WatchedScreen({super.key});

  @override
  State<WatchedScreen> createState() => _WatchedScreenState();
}

class _WatchedScreenState extends State<WatchedScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final APIService _apiService = APIService();

  bool isLoading = true;
  List<Map<String, String>> watchedMovies = [];

  @override
  void initState() {
    super.initState();
    fetchWatchedMovies();
  }

  Future<void> fetchWatchedMovies() async {
  try {
    User? user = _auth.currentUser;
    if (user == null) {
      throw Exception('User is not logged in.');
    }
    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    if (!userDoc.exists) {
      throw Exception('User document not found.');
    }
    final List<dynamic> movieIds = userDoc.data()?['watched'] ?? [];
    print('Fetched ${movieIds.length} watched movies.');
    if (movieIds.isEmpty) {
      print('No watched movies found for this user.');
    }

    List<Map<String, String>> fetchedMovies = [];

    for (var movieId in movieIds) {
      final response = await _apiService.fetchMoviesById(int.parse(movieId.toString()));
      fetchedMovies.add({
        'image': response['image'] ?? '',
        'title': response['title'] ?? 'Unknown',
        'genre': response['genre'] ?? 'Unknown',
        'rating': response['rating'] ?? 'N/A',
        'added on': 'Static Date',
      });
    }

    setState(() {
      watchedMovies = fetchedMovies;
      isLoading = false;
    });
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load watched movies: $e')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : watchedMovies.isEmpty
                ? const Center(
                    child: Text(
                      'No favourite movies found.',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Watched',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Expanded(
                        child: SingleChildScrollView(
                          child: MovieList(movies: watchedMovies),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
