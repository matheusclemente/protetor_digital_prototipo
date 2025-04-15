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
    return Scaffold(
      appBar: AppBar(
        title: Text(['Golpes Bancários', 'Phishing', 'Falsificação de Sites', 'Fraudes em Compras Online'][cardIndex]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final cardText in detalhesCartoes[cardIndex]['textos'])
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: cardText['header'] + '\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                          ...cardText['body'].map<TextSpan>((item) => TextSpan(
                            text: '• $item\n',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                          )).toList(),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
