import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {

  const Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextFormField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          suffixIconColor: Colors.white70,
          hintText: 'What are you looking for?',
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: const Color.fromRGBO(90, 90, 90, 1),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
