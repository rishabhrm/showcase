import 'package:flutter/material.dart';

class HorizontalList2 extends StatelessWidget {
  const HorizontalList2({
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
      width: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, String> item = entry.value;

          // Use null-aware operators and provide default values
          final imageUrl = item['image'] ?? ''; // Provide a default empty string
          final title = item['title'] ?? 'No Title'; // Provide a default title
          final isAssetImage = imageUrl.startsWith('assets/');

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              width: 95,
              margin: const EdgeInsets.symmetric(horizontal: 8),
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
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 95,
                                height: 142.5,
                                color: Colors.grey, // Fallback color
                                child: const Icon(Icons.error, color: Colors.red), // Error icon
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title, // Use the title variable with a fallback
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
