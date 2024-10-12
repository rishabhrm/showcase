import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    super.key,
    required this.items,
    required this.onTap,
  });

  final List<Map<String, String>> items;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, String> item = entry.value;
          final imageUrl = item['image']!;
          final isAssetImage = imageUrl.startsWith('assets/');

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              width: 95,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: isAssetImage
                        ? Image.asset(
                            imageUrl,
                            width: 95,
                            height: 142.5,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            imageUrl,
                            width: 95,
                            height: 142.5,
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
