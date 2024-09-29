import 'package:flutter/material.dart';

import '../widgets/cast_list.dart';
import '../widgets/horizontal_list.dart'; // Ensure this imports the correct path to HorizontalList

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final List<Map<String, String>> favouriteMovies = [
    {
      'image': 'assets/cai.jpg',
      'title': 'Cezanne and I',
    },
    {
      'image': 'assets/toe.jpg',
      'title': 'The Theory of Everything',
    },
    {
      'image': 'assets/abm.jpg',
      'title': 'A Beautiful Mind',
    },
  ];

  final List<Map<String, String>> castData = [
    {'imageUrl': 'assets/dev.webp', 'name': 'Dev Patel'},
    {'imageUrl': 'assets/jeremy.webp', 'name': 'Jeremy Irons'},
    {'imageUrl': 'assets/devika.webp', 'name': 'Devika Bhise'},
    {'imageUrl': 'assets/toby.webp', 'name': 'Toby Jones'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Pop the screen when the back button is pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster and Title
            // const SizedBox(height: 20),
            // const Text(
            //   'The Man Who Knew Infinity',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const SizedBox(height: 10),
            // const Text(
            //   '2016 • 1h 48m • English',
            //   style: TextStyle(
            //     color: Colors.white70,
            //     fontSize: 14,
            //   ),
            // ),
            // const SizedBox(height: 20),
            // Play Trailer Button
            ElevatedButton.icon(
              onPressed: () {
                // Implement trailer play functionality here
              },
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
              'Growing up poor in Madras, Ind.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'CAST',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CastSection(castData: castData),
            const SizedBox(height: 15),
            Text(
              'REVIEWS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Your Review',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write your review here',
              ),
            ),
            //SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Post Review'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'WHERE TO WATCH',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Watch Now!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Subscription required',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              'RECOMMENDATIONS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: HorizontalList(items: favouriteMovies),
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
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: imageUrl.startsWith('http')
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            radius: 37,
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
