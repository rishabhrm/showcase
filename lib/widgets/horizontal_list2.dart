import 'package:flutter/material.dart';

class HorizontalList2 extends StatelessWidget {
  const HorizontalList2({
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
        final imageUrl = item['image']!;
        final isAssetImage = imageUrl.startsWith('assets/');

        return Container(
          height: 120,
          width: 200,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: isAssetImage
                    ? Image.asset(
                        imageUrl,
                        width: 200,
                        height: 120,
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
                    fontSize: 10),
              ),
            ],
          ),
        );
      },
    );
  }
}
