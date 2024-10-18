import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final Function(String) onSearch;

  const Searchbar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return SizedBox(
      height: 44,
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              onSearch(searchController.text);
            },
          ),
          hintText: 'What are you looking for?',
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        ),
      ),
    );
  }
}
