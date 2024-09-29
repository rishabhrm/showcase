import 'package:flutter/material.dart';
import '../widgets/carousel_card.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> carouselItems = [
    {
      'image':
          "assets/lotr.jpg",
      'text': 'LOTR: Rings of Power',
    },
    {
      'image': "assets/pc.jpg",
      'text': 'The Perfect Couple',
    },
    {
      'image':
          "assets/mitb.jpg",
      'text': 'Only Murders in the Building',
    },
  ];

final List<Map<String, String>> mustWatchMovies = [
    {
      'image':
          "assets/tom.jpg",
      'title': 'Tomorrowland',
    },
    {
      'image': "assets/tmwki.jpg",
      'title': 'The Man Who Knew Infinity',
    },
    {
      'image':
          "assets/lll.jpg",
      'title': 'La La Land',
    },
  ];

final List<Map<String, String>> mustWatchTV = [
    {
      'image':
          "assets/himym.jpg",
      'title': 'How I Met Your Mother',
    },
    {
      'image': "assets/sherlock.jpg",
      'title': 'Sherlock',
    },
    {
      'image':
          "assets/shogun.jpg",
      'title': 'Shōgun',
    },
  ];

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
              "WHAT'S TRENDING",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: CarouselCard(carouselItems: carouselItems),
            ),
            const SizedBox(height: 20),
            Text(
              'MUST WATCH MOVIES',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: HorizontalList(items: mustWatchMovies),
            ),
            const SizedBox(height: 17),
            Text(
              'MUST WATCH TV SHOWS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: HorizontalList(items: mustWatchTV),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
