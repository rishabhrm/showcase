import 'package:flutter/material.dart';
import '../api.dart';
import '../widgets/carousel_card.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final APIService tmdbService = APIService();
  List<Map<String, String>> carouselItems = [];
  List<Map<String, String>> mustWatchMovies = [];
  List<Map<String, String>> mustWatchTV = [];

  @override
  void initState() {
    super.initState();
    fetchCarouselItems();
    fetchMustWatchMovies();
    fetchMustWatchTV();
  }

  Future<void> fetchCarouselItems() async {
    carouselItems = await tmdbService.fetchCarouselItems();
    setState(() {});
  }

  Future<void> fetchMustWatchMovies() async {
    mustWatchMovies = await tmdbService.fetchMustWatchMovies();
    setState(() {});
  }

  Future<void> fetchMustWatchTV() async {
    mustWatchTV = await tmdbService.fetchMustWatchTV();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45),
              const Text(
                "NOW PLAYING",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200, // Set a fixed height
                child: CarouselCard(carouselItems: carouselItems),
              ),
              const SizedBox(height: 20),
              const Text(
                'MUST WATCH MOVIES',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 177,
                child: mustWatchMovies.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : HorizontalList(
                        items: mustWatchMovies,
                        onTap: (index) {
                          final movieId = mustWatchMovies[index]['id'];
                          if (movieId != null) {
                            Navigator.pushNamed(
                              context,
                              '/movie',
                              arguments: int.parse(movieId),
                            );
                          }
                        },
                      ),
              ),
              const SizedBox(height: 15),
              const Text(
                'MUST WATCH TV SHOWS',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 177,
                child: mustWatchTV.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : HorizontalList(
                        items: mustWatchTV,
                        onTap: (index) {
                          final tvId = mustWatchTV[index]['id'];
                          if (tvId != null) {
                            Navigator.pushNamed(
                              context,
                              '/tv',
                              arguments: int.parse(tvId),
                            );
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
