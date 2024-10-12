import 'package:flutter/material.dart';
import '../widgets/review_list.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final List<Map<String, String>> movieReviews = [
    {
      'title': 'Tomorrowland',
      'review':
          'Tomorrowland dazzles with stunning stages, diverse music, and an electric atmosphere. The vibrant community and unforgettable experience make it a must-visit festival for music lovers and adventurers alike.',
      'dateReviewed': 'Aug 15, 2024',
    },
    {
      'title': 'The Man Who Knew Infinity',
      'review':
          'The Man Who Knew Infinity is an inspiring biopic about mathematician Srinivasa Ramanujan. It beautifully portrays his genius and struggles, highlighting his relationship with mentor G.H. Hardy. A poignant exploration of passion, intellect, and cultural clash.',
      'dateReviewed': 'Aug 18, 2024',
    },
    {
      'title': 'La La Land',
      'review':
          'La La Land is a mesmerizing tribute to classic musicals, blending romance and ambition. Stunning visuals, enchanting music, and captivating performances create an emotional journey that celebrates dreams and the bittersweet nature of love. A modern classic!',
      'dateReviewed': 'Aug 20, 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Reviews',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ReviewList(movieReviews: movieReviews),
            ),
          ],
        ),
      ),
    );
  }
}
