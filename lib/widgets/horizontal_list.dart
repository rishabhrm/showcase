import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    super.key,
    required this.items,
  });

  final List<Map<String, String>> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          width: 95,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item['image']!,
                  width: 95,
                  height: 142.5,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 7),
              Text(
                item['title']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10),
              ),
            ],
          ),
        );
      },
    );
  }
}