import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> carouselItems = [
    {
      'image':
          'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/NNC08YmJFFlLi1prBkK8quk3dp.jpg',
      'text': 'LOTR: Rings of Power'
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/3buRSGVnutw8x4Lww0t70k5dG6R.jpg',
      'text': 'The Perfect Couple'
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/oyZWiPvumwSYMrF2XbZH6yXQZ14.jpg',
      'text': 'Only Murders in the Building'
    },
  ];

  final List<Map<String, String>> mustWatchMovies = [
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/kziYpr5Nfw60P0My8aj1sgCEqed.jpg',
      'title': 'Tomorrowland',
    },
    {
      'image': 'https://media.s-bol.com/R5OoKMBqGn3q/6yk9Rl/550x786.jpg',
      'title': 'The Man Who Knew Infinity',
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg',
      'title': 'La La Land',
    },
  ];

  final List<Map<String, String>> mustWatchTV = [
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/b34jPzmB0wZy7EjUZoleXOl2RRI.jpg',
      'title': 'How I Met Your Mother',
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/7WTsnHkbA0FaG6R9twfFde0I9hl.jpg',
      'title': 'Sherlock',
    },
    {
      'image':
          'https://media.themoviedb.org/t/p/w220_and_h330_face/7O4iVfOMQmdCSxhOg1WnzG1AgYT.jpg',
      'title': 'Shogun',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20.0), // Symmetrical padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              "WHAT'S TRENDING",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Flexible(
              child: Container(
                child: _buildCarousel(),
              ),
            ),
            SizedBox(height: 25),
            Text(
              'MUST WATCH MOVIES',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Flexible(
              child: Container(
                child: _buildHorizontalList(mustWatchMovies),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'MUST WATCH TV SHOWS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Flexible(
              child: Container(
                child: _buildHorizontalList(mustWatchTV),
              ),
            ),
            //SizedBox(height: 5), // Add bottom padding
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

  Widget _buildCarousel() {
    return CarouselSlider(
      items: carouselItems.map((item) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(item['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 3,
              left: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  item['text']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList(),
      options: CarouselOptions(
        height: double.infinity,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        enlargeCenterPage: true,
      ),
    );
  }

  Widget _buildHorizontalList(List<Map<String, String>> items) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          width: 95,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item['image']!,
                  width: 95,
                  height: 142.5,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 7),
              Text(
                item['title']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10),
              ),
            ],
          ),
        );
      },
    );
  }
}
