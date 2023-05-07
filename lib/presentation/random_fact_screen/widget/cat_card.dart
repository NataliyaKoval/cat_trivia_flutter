import 'package:cat_trivia/presentation/widgets/fact_text_and_date.dart';
import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  const CatCard({Key? key, required this.text, required this.date})
      : super(key: key);

  final String text;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const CircularProgressIndicator(),
            Image.network(
              'https://cataas.com/cat?t=${DateTime.now().millisecond}',
              height: 300,
              fit: BoxFit.contain,
            ),
          ],
        ),
        const SizedBox(height: 10),
        FactTextAndDate(
          text: text,
          date: date,
        ),
      ],
    );
  }
}
