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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/cover.jpg',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: -12,
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
              Center(
                child: Text(
                  'The Man Who Knew Infinity',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '2016 • 1h 48m • English',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
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
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'What does it take to prove the impossible?',
                style: TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Growing up poor in Madras, India, Srinivasa Ramanujan Iyengar earns admittance to Cambridge University during WWI, '
                'where he becomes a pioneer in mathematical theories with the guidance of his professor, G.H. Hardy.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.check, size: 22),
                        onPressed: () {},
                      ),
                      Text(
                        'Add to list',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.bookmark_border, size: 22),
                        onPressed: () {},
                      ),
                      Text(
                        'Want to watch',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border, size: 22),
                        onPressed: () {},
                      ),
                      Text(
                        'Favourite',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'CAST',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CastSection(
                castData: castData,
                onTap:  (index) {
                    Navigator.pushNamed(context, '/actor');
                  }, // Pass the onTap callback here
              ),
              Text(
                'REVIEWS',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  CircleAvatar(radius: 18, child: Icon(Icons.person)),
                  SizedBox(width: 15),
                  Text("Person 1", style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "An exquisite bit of writing of a story worth retelling and revisited again and again. The story of the mathematician Srinivasa Ramanujam, the unschooled genius who became Fellow of the Royal Society, and who has still left us unsolved riddles",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 15),
              Text(
                'Your Review',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                maxLines: 4,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Write your review here',
                  filled: true,
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
                    child: Text('Post Review', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'WHERE TO WATCH',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/netflix.png',
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
                        'Now Streaming',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Watch Now',
                        style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                'RECOMMENDATIONS',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                height: 200,
                child: HorizontalList(
                  items: favouriteMovies,
                  onTap: (index) {
                    Navigator.pushNamed(context, '/movie');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
