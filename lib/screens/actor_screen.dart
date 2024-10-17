import 'package:flutter/material.dart';
import 'package:showcase/api.dart';
import '../models/actor_data.dart';
import '../widgets/horizontal_list.dart';


class ActorProfileScreen extends StatefulWidget {
  final int actorId;
  const ActorProfileScreen({super.key, required this.actorId});
  @override
  State<ActorProfileScreen> createState() => _ActorProfileScreenState();
}

class _ActorProfileScreenState extends State<ActorProfileScreen> {
  late Future<ActorDetails> actorDetails;
  late Future<List<Map<String, String>>> knownForMovies;

  @override
  void initState() {
    super.initState();
    actorDetails = APIService().fetchActorDetails(widget.actorId);
    knownForMovies = APIService().fetchActorKnownForMovies(widget.actorId);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<ActorDetails>(
            future: actorDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No data found'));
              }

              final actor = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 170,
                        height: 260,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: Icon(Icons.error));
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Text(
                      actor.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'PERSONAL INFO',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Birthday:',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        actor.birthday ?? 'Unknown',
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Place of Birth:',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        actor.placeOfBirth ?? 'Unknown',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'KNOWN FOR',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<List<Map<String, String>>>(
                    future: knownForMovies,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      final movies = snapshot.data ?? [];

                      return SizedBox(
                        height: 177,
                        child: HorizontalList(
                          items: movies,
                          onTap: (index) {
                            final movieId = movies[index]['id'];
                            if (movieId != null) {
                              Navigator.pushNamed(
                                context,
                                '/movie',
                                arguments: int.parse(movieId),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'BIOGRAPHY',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    actor.biography ?? 'No biography available',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
