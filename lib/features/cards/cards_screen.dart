import 'package:flutter/material.dart';
import 'package:protetor_digital_prototipo/i18n/strings.g.dart';
import 'package:protetor_digital_prototipo/features/cards/card_details_screen.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golpes Comuns'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: t.cardsScreen.details.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(t.cardsScreen.details[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardDetailsScreen(
                              cardIndex: index,
                            )));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
