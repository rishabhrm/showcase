import 'package:flutter/material.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/navbar.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  final List<Map<String, String>> popularMovies = [
    {
      'image':
          'assets/tm.jpg',
      'title': 'The Terminal',
    },
    {
      'image':
          'assets/ti.jpg',
      'title': 'The Intern',
    },
    {
      'image':
          'assets/wm.jpg',
      'title': 'The Secret Life of Walter Mitty',
    },
  ];

  final List<Map<String, String>> newMovies = [
    {
      'image':
          'assets/jp.jpg',
      'title': 'Jackpot!',
    },
    {
      'image':
          'assets/dw.jpg',
      'title': 'Deadpool & Wolverine',
    },
    {
      'image':
          'assets/fg.jpg',
      'title': 'Fall Guy',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.theater_comedy,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Comedy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                'Find lots of laugh from classic slapsticks to the in-too-deep cult classics.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'NEW',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: HorizontalList(items: newMovies),
            ),
            //const SizedBox(height: 1),
            Text(
              'POPULAR',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: HorizontalList(items: popularMovies),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
