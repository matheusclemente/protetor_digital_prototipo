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
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (final cardText in t.cardsScreen.details[cardIndex].text)
                    RichText(
                      text: TextSpan(
                        text: cardText.header + '\n',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        children: <TextSpan>[
                          for (final cardTextBody in cardText.body)
                            TextSpan(
                                text: "• $cardTextBody\n",
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                )),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
