import 'package:flutter/material.dart';

class SafeLinkChecklistScreen extends StatefulWidget {
  const SafeLinkChecklistScreen({super.key});

  @override
  State<SafeLinkChecklistScreen> createState() =>
      _SafeLinkChecklistScreenState();
}

class _SafeLinkChecklistScreenState extends State<SafeLinkChecklistScreen> {
  var isButtonPressed = [false, false, false];
  final List<String> listaDeLinks = [
    'https://itaucardfaturadigital.app/',
    'https://www.itau.com.br/',
    'https://itaubrasil.com/'
  ];

  final pressedButtonColor = [Colors.red, Colors.green, Colors.red];
  final List<String> linkDescriptions = [
    'Link suspeito com domínio não oficial',
    'Site oficial do banco',
    'Domínio similar mas não oficial'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Links Seguros",
            style: TextStyle(fontSize: 22.0)), // Aumentado tamanho da fonte
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            padding: const EdgeInsets.all(20), // Aumentado de 16 para 20
            child: Column(
              children: [
                const Text(
                  "Identifique o link seguro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26, // Aumentado de 22 para 26
                  ),
                ),
                const SizedBox(height: 10), // Aumentado de 8 para 10
                Text(
                  "Selecione o link que você considera seguro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20, // Aumentado de 16 para 20
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20), // Aumentado de 16 para 20
              child: ListView.builder(
                itemCount: listaDeLinks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.only(
                        bottom: 20), // Aumentado de 16 para 20
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: isButtonPressed[index]
                        ? pressedButtonColor[index].withOpacity(0.2)
                        : Colors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          isButtonPressed[index] = !isButtonPressed[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listaDeLinks[index],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  isButtonPressed[index]
                                      ? Text(
                                          linkDescriptions[index],
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: pressedButtonColor[index],
                                          ),
                                        )
                                      : const Text(
                                          "Clique para selecionar",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            isButtonPressed[index]
                                ? Icon(
                                    index == 1
                                        ? Icons.check_circle
                                        : Icons.cancel,
                                    color: pressedButtonColor[index],
                                    size: 28,
                                  )
                                : const Icon(Icons.circle_outlined,
                                    color: Colors.grey, size: 28),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
