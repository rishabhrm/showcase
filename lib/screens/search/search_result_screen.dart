import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../routes.dart'; // Import your AppRoutes

class SearchResultsScreen extends StatefulWidget {
  final String searchQuery;

  const SearchResultsScreen({super.key, required this.searchQuery});

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final String apiKey = '7f9aa6577f017c199547b077ae33f882';
  List<Map<String, dynamic>> searchResults = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    searchItems(widget.searchQuery);
  }

  Future<void> searchItems(String query) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/search/multi?api_key=$apiKey&query=$query'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];

        setState(() {
          searchResults = results.map((result) {
            return {
              'id': result['id'],
              'title': result['title'] ?? result['name'],
              'image': result['poster_path'] != null
                  ? 'https://image.tmdb.org/t/p/w500${result['poster_path']}'
                  : '',
              'media_type': result['media_type'],
            };
          }).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      // You may want to show an error message or log it
      print(error);
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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Search Results for "${widget.searchQuery}"',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : searchResults.isEmpty
                      ? const Center(child: Text('No results found.'))
                      : ListView.builder(
                          itemCount: searchResults.length,
                          itemBuilder: (context, index) {
                            final result = searchResults[index];
                            return ListTile(
                              leading: result['image'].isNotEmpty
                                  ? Image.network(result['image'], width: 50, fit: BoxFit.cover)
                                  : const Icon(Icons.image_not_supported),
                              title: Text(result['title']),
                              subtitle: Text(
                                'Type: ${result['media_type'] == 'movie' ? 'Movie' : result['media_type'] == 'tv' ? 'TV Series' : 'Actor'}',
                              ),
                              onTap: () {
                                if (result['media_type'] == 'movie') {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.movie,
                                    arguments: result['id'],
                                  );
                                } else if (result['media_type'] == 'tv') {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.tv,
                                    arguments: result['id'],
                                  );
                                } else if (result['media_type'] == 'person') {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.actor,
                                    arguments: result['id'],
                                  );
                                }
                              },
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
