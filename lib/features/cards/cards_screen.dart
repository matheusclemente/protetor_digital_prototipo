import 'package:flutter/material.dart';

import 'package:protetor_digital_prototipo/features/cards/card_details_screen.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cards = [
      {
        'title': 'Golpes Bancários',
        'icon': Icons.account_balance,
        'color': Colors.red,
        'description': 'Fraudes envolvendo contas bancárias e cartões',
      },
      {
        'title': 'Phishing',
        'icon': Icons.phishing,
        'color': Colors.orange,
        'description': 'Tentativas de obter dados pessoais por engano',
      },
      {
        'title': 'Falsificação de Sites',
        'icon': Icons.web,
        'color': Colors.blue,
        'description': 'Sites falsos que imitam empresas legítimas',
      },
      {
        'title': 'Fraudes em Compras Online',
        'icon': Icons.shopping_cart,
        'color': Colors.green,
        'description': 'Golpes em lojas virtuais e marketplaces',
      },
    ];

    const cardColor = Color(0xFF1A365D);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golpes Comuns'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailsScreen(cardIndex: index),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: cardColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          cards[index]['icon'],
                          color: cardColor,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cards[index]['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              cards[index]['description'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
