import 'package:flutter/material.dart';
import '../widgets/cast_list.dart';
import '../widgets/horizontal_list.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/cover.jpg',
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_down, size: 40, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'The Man Who Knew Infinity',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Center(
              child: Text(
                '2016 • 1h 48m • English',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow),
                  SizedBox(width: 8),
                  Text('Play Trailer'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Drama | History',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'What does it take to prove the impossible?',
              style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Growing up poor in Madras, India, Srinivasa Ramanujan Iyengar earns admittance to Cambridge University during WWI, '
              'where he becomes a pioneer in mathematical theories with the guidance of his professor, G.H. Hardy.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Add to list',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Want to watch',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Favourite',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'CAST',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CastSection(castData: castData),
            const SizedBox(height: 10),
            Text(
              'REVIEWS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 15),
                Text(
                  "Person 1",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "An exquisite bit of writing of a story worth retelling and revisited again and again. The story of the mathematician Srinivasa Ramanujam, the unschooled genius who became Fellow of the Royal Society, and who has still left us unsolved riddles",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Text(
              'Your Review',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: 4,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Write your review here',
                labelStyle: const TextStyle(color: Colors.white70),
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color.fromRGBO(90, 90, 90, 1),
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 2),
            Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 1 / 2.4,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Post Review',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
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