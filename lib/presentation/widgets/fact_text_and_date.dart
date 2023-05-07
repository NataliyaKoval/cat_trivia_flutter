import 'package:flutter/material.dart';

class FactTextAndDate extends StatelessWidget {
  const FactTextAndDate({
    Key? key,
    required this.text,
    required this.date,
  }) : super(key: key);

  final String text;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              date,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
