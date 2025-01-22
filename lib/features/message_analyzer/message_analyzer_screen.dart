import 'package:flutter/material.dart';

class MessageAnalyzerScreen extends StatelessWidget {
  const MessageAnalyzerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Análise de Mensagens'),
      ),
      body: const Center(
        child: Placeholder(),
      ),
    );
  }
}
