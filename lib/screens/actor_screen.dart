import 'package:flutter/material.dart';
import '../widgets/horizontal_list.dart';

class ActorProfileScreen extends StatefulWidget {
  const ActorProfileScreen({super.key});

  @override
  State<ActorProfileScreen> createState() => _ActorProfileScreenState();
}

class _ActorProfileScreenState extends State<ActorProfileScreen> {
  final List<Map<String, String>> mustWatchMovies = [
    {
      'image': "assets/ds.jpg",
      'title': 'Doctor Strange',
    },
    {
      'image': "assets/tig.jpg",
      'title': 'The Imitation Game',
    },
    {
      'image': "assets/courier.jpg",
      'title': 'The Courier',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
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
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 170,
                  height: 260,
                  child: Image.asset(
                    'assets/ben.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Text(
                'Benedict Cumberbatch',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'PERSONAL INFO',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 7),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 14, color: Colors.white70),
                children: [
                  TextSpan(
                      text: 'Birthday: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'July 19, 1976 (48 Years Old)\n'),
                  TextSpan(
                      text: 'Place of Birth: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'London, England, UK'),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'KNOWN FOR',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: HorizontalList(items: mustWatchMovies),
            ),
            Text(
              'BIOGRAPHY',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "Benedict Cumberbatch is an English actor. Known for his roles on the screen and stage, he has received various accolades throughout his career, including a Primetime Emmy Award, a British...",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
