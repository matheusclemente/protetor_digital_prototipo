import 'package:flutter/material.dart';
import 'package:protetor_digital_prototipo/i18n/strings.g.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MessageAnalyzerScreen extends StatefulWidget {
  const MessageAnalyzerScreen({super.key});

  @override
  State<MessageAnalyzerScreen> createState() => _MessageAnalyzerScreenState();
}

class _MessageAnalyzerScreenState extends State<MessageAnalyzerScreen> {
  final TextEditingController _controller = TextEditingController();
  double? _probability;
  String? _error;

  Future<void> _checkMessage() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:5000/predict'),
        body: jsonEncode({'message': _controller.text}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('API Response: ${response.body}'); // Debug logging
        final data = jsonDecode(response.body);
        print('Parsed data: $data'); // Debug logging
        setState(() {
          _probability = data['phishing_probability']?.toDouble();
          _error = null;
        });
      } else {
        setState(() {
          _error = 'Erro na análise (${response.statusCode})';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Erro de conexão: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.messageAnalyzerScreen.title),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Text("Cole abaixo a mensagem suspeita:"),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 200,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      expands: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _checkMessage,
                  child: const Text("Verificar"),
                ),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      _error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                if (_probability != null)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'Probabilidade de phishing: ${(_probability! * 100).toStringAsFixed(1)}%',
                        style: TextStyle(
                          color: _probability! > 0.7 ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
