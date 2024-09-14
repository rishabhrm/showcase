import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.carouselItems,
  });

  final List<Map<String, String>> carouselItems;

  @override
  Widget build(BuildContext context) {
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
}