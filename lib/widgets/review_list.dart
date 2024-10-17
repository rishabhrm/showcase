import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({
    super.key,
    required this.movieReviews,
  });

  final List<Map<String, String>> movieReviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movieReviews.length,
      itemBuilder: (context, index) {
        final review = movieReviews[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8), // Added horizontal padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: review['review']!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Reviewed on: ${review['dateReviewed']}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
