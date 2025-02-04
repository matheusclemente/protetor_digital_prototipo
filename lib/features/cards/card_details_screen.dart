import 'package:flutter/material.dart';
import 'package:protetor_digital_prototipo/i18n/strings.g.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({super.key, required this.cardIndex});

  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.cardsScreen.details[cardIndex].title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(t.cardsScreen.details[cardIndex].body.join("\n\n")),
        ),
      ),
    );
  }
}
