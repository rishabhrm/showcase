import 'package:flutter/material.dart';

class CastSection extends StatelessWidget {
  final List<Map<String, String>> castData;
  final Function(int index) onTap;

  const CastSection({
    required this.castData,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: castData.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> cast = entry.value;

              return GestureDetector(
                onTap: () => onTap(index), // Trigger onTap when tapped
                child: Container(
                  width: 97,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: cast['imageUrl']!.startsWith('http')
                            ? NetworkImage(cast['imageUrl']!)
                            : AssetImage(cast['imageUrl']!) as ImageProvider,
                        radius: 37,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        cast['name']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
