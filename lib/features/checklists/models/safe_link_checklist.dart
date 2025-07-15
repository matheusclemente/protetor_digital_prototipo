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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Links Perigosos"),
      ),
      body: Column(children: [
        Text(
          "Identifique o link real",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        ListView.separated(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            itemCount: listaDeLinks.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: !isButtonPressed[index]
                        ? Colors.grey
                        : pressedButtonColor[index]),
                onPressed: () {
                  setState(() {
                    isButtonPressed[index] = !isButtonPressed[index];
                  });
                },
                child: Text(listaDeLinks[index]),
              );
            })
      ]),
    );
  }
}
