import 'package:flutter/material.dart';
import '../tmdb_services.dart';
import '../widgets/carousel_card.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/navbar.dart';
//import '../services/tmdb_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TMDBService tmdbService = TMDBService();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              "NOW PLAYING",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: CarouselCard(carouselItems: carouselItems),
            ),
            const SizedBox(height: 20),
            Text(
              'MUST WATCH MOVIES',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: mustWatchMovies.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : HorizontalList(
                      items: mustWatchMovies,
                      onTap: (index) {
                        Navigator.pushNamed(context, '/movie');
                      },
                    ),
            ),
            const SizedBox(height: 17),
            Text(
              'MUST WATCH TV SHOWS',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: mustWatchTV.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : HorizontalList(
                      items: mustWatchTV,
                      onTap: (index) {
                        Navigator.pushNamed(context, '/tv');
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
