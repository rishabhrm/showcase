import 'package:flutter/material.dart';
import '../widgets/horizontal_list.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  final List<Map<String, String>> popularMovies = [
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/cPB3ZMM4UdsSAhNdS4c7ps5nypY.jpg',
      'title': 'The Terminal',
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/1QVZXQQHCEIj8lyUhdBYd2qOYtq.jpg',
      'title': 'Ted',
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/8mBuLCOcpWnmYtZc4aqtvDXslv6.jpg',
      'title': 'Trading Places',
    },
  ];

  final List<Map<String, String>> newMovies = [
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/fOsamTFIyGxjw1jLSKdZYxQBJOT.jpg',
      'title': 'Jackpot!',
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
      'title': 'Deadpool & Wolverine',
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/tSz1qsmSJon0rqjHBxXZmrotuse.jpg',
      'title': 'Fall Guy',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {},
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 55),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.theater_comedy,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(width: 10),
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
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                child: Text(
                  'Find lots of laugh from classic slapsticks to the in-too-deep cult classics.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 55),
            Text(
              'NEW',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Flexible(
              child: Container(
                child: HorizontalList(items: newMovies),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'POPULAR',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Flexible(
              child: Container(
                child: HorizontalList(items: popularMovies),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
