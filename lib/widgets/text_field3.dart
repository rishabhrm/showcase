import 'package:flutter/material.dart';

class CustomTextField3 extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String initialValue;

  const CustomTextField3({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.initialValue,
  }) : super(key: key);

  @override
  _CustomTextField3State createState() => _CustomTextField3State();
}

class _CustomTextField3State extends State<CustomTextField3> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: TextField(
        controller: _controller,
        maxLines: null,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        ),
      ),
    );
  }
}
