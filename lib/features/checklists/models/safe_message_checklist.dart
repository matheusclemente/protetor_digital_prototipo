import 'package:flutter/material.dart';

class SafeMessageChecklistScreen extends StatefulWidget {
  const SafeMessageChecklistScreen({super.key, required this.checklistIndex});

  final int checklistIndex;

  @override
  State<SafeMessageChecklistScreen> createState() =>
      _SafeMessageChecklistScreenState();
}

class _SafeMessageChecklistScreenState
    extends State<SafeMessageChecklistScreen> {
  var isButtonPressed = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final List<List<String>> listaDeMensagens = [
      [
        'Querido usuário',
        'Sua caixa de correio excedeu o limite de armazenamento de <ID> GB definido pelo administrador, você está executando atualmente em <ID> GB, você não pode enviar ou receber novas mensagens até que varify você caixa de correio. Re-validar sua conta por e-mail, preencha e envie os dados abaixo para verificar e atualizar sua conta:',
        '(1) e-mail:',
        '(2) Nome:',
        '(3) senha:',
        '(4) Re-senha:',
        'obrigado',
        'administrador do sistema'
      ],
      [
        'Endereço de e-mail expirando <ID>',
        ':;::',
        'Seu e-mail precisa ser validado para que não haja o bloqueio da sua conta. Isso acontece pelo tempo de uso e quantidade de e-mails enviados ou recebidos.',
        'Fique atento(a), a não confirmação do cadastro pode bloquear sua conta e impedir o envio e recebimento de novas mensagens.',
        'VALIDE seu WEBMAIL'
      ],
      [
        'BB: NINGUEM do BB vai te pedir esse codigo. Nao compartilhe',
        'Gerado codigo para liberacao: XXXX, em xx/xx/xxxx'
      ],
      [
        'Notificação de NF-e',
        'Nota Fiscal Eletrônica Gerada',
        '\n',
        'Olá,',
        '\n',
        'Sua NF-e nº <ID> foi gerada com sucesso em <ID>.',
        '\n',
        'Exibir NF-e',
        '\n',
        'Atenciosamente,',
        'Equipe Financeira],',
      ]
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mensagens Seguras"),
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
                  "Identifique a mensagem segura",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Selecione a mensagem que você considera segura",
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
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildMessageCard(0, listaDeMensagens[0], Colors.red),
                  _buildMessageCard(1, listaDeMensagens[1], Colors.red),
                  _buildMessageCard(2, listaDeMensagens[2], Colors.green),
                  _buildMessageCard(3, listaDeMensagens[3], Colors.red),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageCard(
      int index, List<String> message, Color correctColor) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color:
          isButtonPressed[index] ? correctColor.withOpacity(0.2) : Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            isButtonPressed[index] = !isButtonPressed[index];
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mensagem ${index + 1}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  isButtonPressed[index]
                      ? Icon(Icons.check_circle, color: correctColor)
                      : const Icon(Icons.circle_outlined, color: Colors.grey),
                ],
              ),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    message.join('\n'),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
