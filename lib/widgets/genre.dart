import 'package:flutter/material.dart';

class Genre {
  final String image;
  final String name;
  Genre({required this.image, required this.name});
}

class GenreTile extends StatelessWidget {
  final Genre genre;
  const GenreTile({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: _getImageProvider(genre.image),
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

  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.startsWith('http')) {
      return NetworkImage(imagePath);
    } else {
      return AssetImage(imagePath);
    }
  }
}
