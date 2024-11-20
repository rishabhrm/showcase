import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../api.dart';
import '../../widgets/movie_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PlannedScreen extends StatefulWidget {
  const PlannedScreen({super.key});

  @override
  State<PlannedScreen> createState() => _PlannedScreenState();
}

class _PlannedScreenState extends State<PlannedScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final APIService _apiService = APIService();

  bool isLoading = true;
  List<Map<String, String>> planToWatchMovies = [];

  @override
  void initState() {
    super.initState();
    fetchplanToWatchMovies();
  }

  Future<void> fetchplanToWatchMovies() async {
  try {
    User? user = _auth.currentUser;
    if (user == null) {
      throw Exception('User is not logged in.');
    }
    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    if (!userDoc.exists) {
      throw Exception('User document not found.');
    }
    final List<dynamic> movieIds = userDoc.data()?['planToWatch'] ?? [];
    print('Fetched ${movieIds.length} planned movies.');
    if (movieIds.isEmpty) {
      print('No planned movies found for this user.');
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
      planToWatchMovies = fetchedMovies;
      isLoading = false;
    });
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load planned movies: $e')),
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
            : planToWatchMovies.isEmpty
                ? const Center(
                    child: Text(
                      'No planned movies found.',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Planned to watch',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Expanded(
                        child: SingleChildScrollView(
                          child: MovieList(movies: planToWatchMovies),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
