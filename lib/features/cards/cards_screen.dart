import 'package:flutter/material.dart';

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
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(['Golpes Bancários', 'Phishing', 'Falsificação de Sites', 'Fraudes em Compras Online'][index]),
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
