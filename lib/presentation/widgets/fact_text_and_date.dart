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
          RichText(
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: text,
              style: const TextStyle(fontSize: 22, color: Colors.black),
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
