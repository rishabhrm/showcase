import 'package:flutter/material.dart';
import '../widgets/horizontal_list.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Map<String, String>> newMovies = [
    {
      'image': 'assets/hoc.jpg',
      'title': 'House of Cards',
    },
    {
      'image': 'assets/td.jpg',
      'title': 'True Detective',
    },
    {
      'image': 'assets/drw.jpg',
      'title': 'Doctor Who',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              const Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/pfp.jpg'),
                ),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Watched", style: TextStyle(fontSize: 12)),
                      Text("7",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Planned", style: TextStyle(fontSize: 12)),
                      Text("70",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Favourites", style: TextStyle(fontSize: 12)),
                      Text("4",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text('TIME SPENT WATCHING',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Months', style: TextStyle(fontSize: 12)),
                      Text('12',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Days', style: TextStyle(fontSize: 12)),
                      Text('25',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Hours', style: TextStyle(fontSize: 12)),
                      Text('50',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Episodes', style: TextStyle(fontSize: 12)),
                      Text('100',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text('MOST WATCHED SHOWS',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: HorizontalList(
                  items: newMovies,
                  onTap: (index) {
                    Navigator.pushNamed(context, '/movie');
                  },
                ),
              ),
              Text('GENRE BREAKDOWN',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              genreBar("Comedy", 0.8),
              genreBar("Action", 0.6),
              genreBar("Adventure", 0.5),
              genreBar("Mystery", 0.4),
              genreBar("Sci-fi", 0.4),
              genreBar("Drama", 0.3),
              genreBar("Romance", 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget genreBar(String genre, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              genre,
              style: TextStyle(fontSize: 12.5),
            ),
          ),
          Expanded(
            flex: 7,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.black,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
