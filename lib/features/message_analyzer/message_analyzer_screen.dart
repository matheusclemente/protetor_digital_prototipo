import 'package:flutter/material.dart';
import 'package:protetor_digital_prototipo/i18n/strings.g.dart';

class MessageAnalyzerScreen extends StatelessWidget {
  const MessageAnalyzerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.messageAnalyzerScreen.title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Cole abaixo a mensagem suspeita:"),
            Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Verificar"),
            )
          ],
        ),
      ),
    );
  }
}
