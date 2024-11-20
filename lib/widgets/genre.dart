import 'package:flutter/material.dart';

class Genre {
  final int id;
  final String image;
  final String name;
  Genre({required this.id, required this.image, required this.name});
}

class GenreTile extends StatelessWidget {
  final Genre genre;
  final VoidCallback onTap;

  const GenreTile({super.key, required this.genre, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: NetworkImage(genre.image),
              fit: BoxFit.cover,
            ),
            Container(
              color: const Color.fromARGB(100, 0, 0, 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    genre.name,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
