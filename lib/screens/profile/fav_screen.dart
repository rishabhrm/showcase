import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../api.dart';
import '../../widgets/movie_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final APIService _apiService = APIService();

  bool isLoading = true;
  List<Map<String, String>> favouriteMovies = [];

  @override
  void initState() {
    super.initState();
    fetchFavouriteMovies();
  }

  Future<void> fetchFavouriteMovies() async {
  try {
    User? user = _auth.currentUser;
    if (user == null) {
      throw Exception('User is not logged in.');
    }
    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    if (!userDoc.exists) {
      throw Exception('User document not found.');
    }
    final List<dynamic> movieIds = userDoc.data()?['favourites'] ?? [];
    print('Fetched ${movieIds.length} favourite movies.');
    if (movieIds.isEmpty) {
      print('No favourite movies found for this user.');
    }

    List<Map<String, String>> fetchedMovies = [];

    // Fetch movie details using APIService for each movie ID
    for (var movieId in movieIds) {
      final response = await _apiService.fetchMoviesById(int.parse(movieId.toString()));
      fetchedMovies.add({
        'image': response['image'] ?? '', // Ensure image fallback
        'title': response['title'] ?? 'Unknown',
        'genre': response['genre'] ?? 'Unknown',
        'rating': response['rating'] ?? 'N/A',
        'added on': 'Static Date', // Static placeholder for "added on"
      });
    }

    setState(() {
      favouriteMovies = fetchedMovies;
      isLoading = false;
    });
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load favourite movies: $e')),
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
            : favouriteMovies.isEmpty
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
                        'Favourites',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Expanded(
                        child: SingleChildScrollView(
                          child: MovieList(movies: favouriteMovies),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
