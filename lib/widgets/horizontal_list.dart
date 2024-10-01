import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    super.key,
    required this.items,
    required this.onTap, // Add onTap parameter
  });

  final List<Map<String, String>> items;
  final void Function(int index) onTap; // Define the type for the callback

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final imageUrl = item['image']!;
        final isAssetImage = imageUrl.startsWith('assets/');

        return InkWell(
          onTap: () => onTap(index), // Call the passed onTap function
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
                SizedBox(height: 7),
                Text(
                  item['title']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
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
