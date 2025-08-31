import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class MessageAnalyzerScreen extends StatefulWidget {
  const MessageAnalyzerScreen({super.key});

  @override
  State<MessageAnalyzerScreen> createState() => _MessageAnalyzerScreenState();
}

class _MessageAnalyzerScreenState extends State<MessageAnalyzerScreen> {
  final TextEditingController _controller = TextEditingController();
  double? _probability;
  String? _error;
  bool _isAnalyzing = false;
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String apiDefaultUrl = 'http://localhost:5000';

  @override
  void initState() {
    super.initState();
    _detectEmulator();
  }

  Future<void> _detectEmulator() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        final isEmulator = !androidInfo.isPhysicalDevice;

        if (isEmulator) {
          // No emulador Android, use 10.0.2.2 para acessar o localhost da máquina host
          setState(() {
            apiDefaultUrl = 'http://10.0.2.2:5000';
          });
          print('Rodando em emulador Android, usando URL: $apiDefaultUrl');
        } else {
          print(
              'Rodando em dispositivo físico Android, usando URL: $apiDefaultUrl');
        }
      }
    } catch (e) {
      print('Erro ao detectar emulador: $e');
    }
  }

  Future<void> _checkMessage() async {
    if (_controller.text.trim().isEmpty) {
      setState(() {
        _error = 'Por favor, insira uma mensagem para análise';
      });
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _error = null;
    });

    try {
      final response = await http.post(
        Uri.parse('$apiDefaultUrl/predict'),
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
          _isAnalyzing = false;
        });
      } else {
        setState(() {
          _error = 'Erro na análise (${response.statusCode})';
          _isAnalyzing = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Erro de conexão: $e';
        _isAnalyzing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1A365D);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisador de Mensagens'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Cabeçalho com cor e ícone
          Container(
            width: double.infinity,
            color: primaryColor.withOpacity(0.2),
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              children: [
                Icon(
                  Icons.security,
                  size: 60,
                  color: primaryColor,
                ),
                SizedBox(height: 12),
                Text(
                  'Verificador de Phishing',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Cole a mensagem suspeita para verificar se é uma tentativa de phishing',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
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
                    Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: primaryColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.message, color: primaryColor),
                                SizedBox(width: 8),
                                Text(
                                  'Mensagem para análise:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 200,
                              child: TextField(
                                controller: _controller,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                expands: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: 'Cole aqui a mensagem suspeita...',
                                  fillColor: Colors.grey[50],
                                  filled: true,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: _isAnalyzing ? null : _checkMessage,
                                icon: _isAnalyzing
                                    ? Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.all(2.0),
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 3,
                                        ),
                                      )
                                    : const Icon(Icons.search),
                                label: Text(_isAnalyzing
                                    ? "Analisando..."
                                    : "Verificar Mensagem"),
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  textStyle: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_error != null)
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 20),
                        color: Colors.red[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.red, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              const Icon(Icons.error_outline,
                                  color: Colors.red),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _error!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (_probability != null)
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 20),
                        color: _probability! > 0.7
                            ? Colors.red[50]
                            : Colors.green[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color:
                                _probability! > 0.7 ? Colors.red : Colors.green,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Icon(
                                _probability! > 0.7
                                    ? Icons.warning
                                    : Icons.check_circle,
                                color: _probability! > 0.7
                                    ? Colors.red
                                    : Colors.green,
                                size: 48,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Resultado da Análise',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: _probability! > 0.7
                                      ? Colors.red[700]
                                      : Colors.green[700],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Probabilidade de phishing: ${(_probability! * 100).toStringAsFixed(1)}%',
                                style: TextStyle(
                                  color: _probability! > 0.7
                                      ? Colors.red[700]
                                      : Colors.green[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                _probability! > 0.7
                                    ? 'Esta mensagem tem alta probabilidade de ser uma tentativa de phishing. Tenha cuidado!'
                                    : 'Esta mensagem parece segura, mas sempre verifique a fonte antes de fornecer informações pessoais.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _probability! > 0.7
                                      ? Colors.red[700]
                                      : Colors.green[700],
                                ),
                                textAlign: TextAlign.center,
                              ),
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
