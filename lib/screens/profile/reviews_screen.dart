import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../widgets/review_list.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late Future<List<Map<String, String>>> reviewsFuture;

  final String tmdbApiKey = '7f9aa6577f017c199547b077ae33f882';
  final String tmdbBaseUrl = 'https://api.themoviedb.org/3/movie/';

  @override
  void initState() {
    super.initState();
    reviewsFuture = fetchReviews();
  }

  Future<List<Map<String, String>>> fetchReviews() async {
    try {
      // Fetch current user's UID using FirebaseAuth
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }
      
      final userId = user.uid; // Get the UID of the current user

      final reviewsSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('reviews')
          .get();

      // Map Firestore data to List<Map<String, String>>
      List<Map<String, String>> reviews = [];
      for (var doc in reviewsSnapshot.docs) {
        final data = doc.data();
        final movieId = data['movieId']?.toString();
        final reviewText = data['reviewText']?.toString();
        final timestamp = (data['timestamp'] as Timestamp?)
                ?.toDate()
                .toString() ??
            'No Date';

        if (movieId != null) {
          // Fetch movie name from TMDb API
          final movieName = await getMovieName(movieId);

          reviews.add({
            'title': movieName,
            'review': reviewText ?? 'No Review',
            'timestamp': timestamp,
          });
        }
      }
      return reviews;
    } catch (error) {
      print('Error fetching reviews: $error');
      return [];
    }
  }

  // Fetch movie name from TMDb API
  Future<String> getMovieName(String movieId) async {
    try {
      final response = await http.get(Uri.parse('$tmdbBaseUrl$movieId?api_key=$tmdbApiKey&language=en-US'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['title'] ?? 'Unknown Movie';
      } else {
        throw Exception('Failed to load movie data');
      }
    } catch (error) {
      print('Error fetching movie name: $error');
      return 'Error fetching movie name';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Reviews',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: FutureBuilder<List<Map<String, String>>>(
                future: reviewsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No reviews found.'));
                  } else {
                    return SingleChildScrollView(
                      child: ReviewList(movieReviews: snapshot.data!),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
