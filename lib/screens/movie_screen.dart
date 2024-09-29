import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(            Icons.keyboard_arrow_down, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster and Title
            Container(
              alignment: Alignment.center,
              child: Image.network(
                'https://media.themoviedb.org/t/p/w220_and_h330_face/6y6R7DW8CVy15jI4Z3YbDypvA61.jpg', // replace with the actual movie image URL
                height: 300,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The Man Who Knew Infinity',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '2016 • 1h 48m • English',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            // Play Trailer Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text('Play Trailer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            // Movie Description
            const Text(
              'Drama/History\n\n'
              'Growing up poor in Madras, India, Srinivasa Ramanujan earns admittance to '
              'Cambridge University during WWI, where he becomes a pioneer in mathematical '
              'theories with the guidance of his professor, G.H. Hardy.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            // Cast Section
            const Text(
              'CAST',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CastItem(
                    imageUrl: 'https://via.placeholder.com/100x100',
                    name: 'Dev Patel',
                  ),
                  CastItem(
                    imageUrl: 'https://via.placeholder.com/100x100',
                    name: 'Jeremy Irons',
                  ),
                  CastItem(
                    imageUrl: 'https://via.placeholder.com/100x100',
                    name: 'Devika Bhise',
                  ),
                  CastItem(
                    imageUrl: 'https://via.placeholder.com/100x100',
                    name: 'Toby Jones',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Reviews Section
            const Text(
              'REVIEWS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Person 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'An exceptional telling of a story...',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Your Review Section
            const Text(
              'Your Review',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Write your review here',
                hintStyle: const TextStyle(color: Colors.white70),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Post Review'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            // Bottom Recommendations
            const Text(
              'RECOMMENDATIONS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  RecommendationItem(
                    imageUrl: 'https://via.placeholder.com/150x200',
                    title: 'Movie 1',
                  ),
                  RecommendationItem(
                    imageUrl: 'https://via.placeholder.com/150x200',
                    title: 'Movie 2',
                  ),
                  RecommendationItem(
                    imageUrl: 'https://via.placeholder.com/150x200',
                    title: 'Movie 3',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CastItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CastItem({
    required this.imageUrl,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 30,
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class RecommendationItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RecommendationItem({
    required this.imageUrl,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
