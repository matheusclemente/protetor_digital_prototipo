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
        title: const Text("Links Seguros"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  "Identifique o link seguro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Selecione o link que você considera seguro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: listaDeLinks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
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
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isButtonPressed[index]
                                    ? pressedButtonColor[index].withOpacity(0.2)
                                    : Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.link,
                                color: isButtonPressed[index]
                                    ? pressedButtonColor[index]
                                    : Colors.grey,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listaDeLinks[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  isButtonPressed[index]
                                      ? Text(
                                          linkDescriptions[index],
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: pressedButtonColor[index],
                                          ),
                                        )
                                      : const Text(
                                          "Clique para selecionar",
                                          style: TextStyle(
                                            fontSize: 14,
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
                                  )
                                : const Icon(Icons.circle_outlined,
                                    color: Colors.grey),
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
