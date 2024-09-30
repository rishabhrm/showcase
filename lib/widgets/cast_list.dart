import 'package:flutter/material.dart';

class CastSection extends StatelessWidget {
  final List<Map<String, String>> castData;

  const CastSection({
    required this.castData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: castData.map((cast) {
              return Container(
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
                      style: const TextStyle(color: Colors.white70, fontSize: 11),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
