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
      itemCount: movieReviews.length,
      itemBuilder: (context, index) {
        final review = movieReviews[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
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
                SizedBox(height: 8),
                Text(
                  'Reviewed on: ${review['dateReviewed']}',
                  style: TextStyle(
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
