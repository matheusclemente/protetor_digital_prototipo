import 'package:flutter/material.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({super.key, required this.cardIndex});

  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> detalhesCartoes = [
      {
        'textos': [
          {
            'header': 'Características Principais:',
            'body': [
              'Comunicação falsa de instituições financeiras',
              'Solicitação de dados confidenciais',
              'Links para sites clonados'
            ]
          }
        ]
      },
      {
        'textos': [
          {
            'header': 'Métodos Comuns:',
            'body': [
              'E-mails com links maliciosos',
              'Mensagens SMS falsas',
              'Chamadas telefônicas suspeitas'
            ]
          }
        ]
      },
      {
        'textos': [
          {
            'header': 'Indicadores de Risco:',
            'body': [
              'URLs com erros ortográficos',
              'Sites sem cadeado de segurança',
              'Formulários suspeitos'
            ]
          }
        ]
      },
      {
        'textos': [
          {
            'header': 'Prevenção:',
            'body': [
              'Verifique o vendedor antes de comprar',
              'Desconfie de preços muito baixos',
              'Use plataformas seguras de pagamento'
            ]
          }
        ]
      },
    ];

    final String titulo = [
      'Golpes Bancários',
      'Phishing',
      'Falsificação de Sites',
      'Fraudes em Compras Online'
    ][cardIndex];
    const Color cardColor = Color(0xFF1A365D);

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Cabeçalho com cor e ícone
          Container(
            width: double.infinity,
            color: cardColor.withOpacity(0.2),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(
                  [
                    Icons.account_balance,
                    Icons.phishing,
                    Icons.web,
                    Icons.shopping_cart
                  ][cardIndex],
                  size: 60,
                  color: cardColor,
                ),
                const SizedBox(height: 12),
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Conteúdo
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final cardText in detalhesCartoes[cardIndex]['textos'])
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: cardColor.withOpacity(0.3), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cardText['header'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: cardColor,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...cardText['body']
                                  .map<Widget>((item) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.check_circle,
                                                size: 18, color: cardColor),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
