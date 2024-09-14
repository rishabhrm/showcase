import 'package:flutter/material.dart';
import '../widgets/genre.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Genre> genres = [
    Genre(
        image:
            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/3IzR3VhZAyhxVnuRRUHFLkfK4hT.jpg',
        name: 'Action'),
    Genre(
        image:
            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/5Z0xJLURPiN8zSvhMLa3qBojleK.jpg',
        name: 'Comedy'),
    Genre(
        image:
            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/lWNASscWXn32Asr9vkB1wq6cKvD.jpg',
        name: 'Mystery'),
    Genre(
        image:
            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/mvyERNa0oNsBjbHqn5qSGMHk2FM.jpg',
        name: 'Adventure'),
    Genre(
        image:
            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/pkxPkHOPJjOvzfQOclANEBT8OfK.jpg',
        name: 'Family'),
    Genre(
        image:
            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/sDH1LkdFOkQmTJaF1sIIniQyFOk.jpg',
        name: 'Romance'),
    Genre(
        image:
            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/a2n6bKD7qhCPCAEALgsAhWOAQcc.jpg',
        name: 'Sci-fi'),
    Genre(
        image:
            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/uT5G4fA7jKxlJNfwYPMm353f5AI.jpg',
        name: 'Animation'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Search',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'What do you want to look for?',
                  filled: true,
                  fillColor: Color.fromRGBO(90, 90, 90, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                'Prefer a specific genre? We’ve got it covered!',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 28 / 16,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    final genre = genres[index];
                    return GenreTile(genre: genre);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
