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
        title: const Text("Checklist"),
      ),
      body: Column(
        children: [
          Text(
            "Identifique a mensagem segura",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            !isButtonPressed[0] ? Colors.grey : Colors.red),
                    onPressed: () {
                      setState(() {
                        isButtonPressed[0] = !isButtonPressed[0];
                      });
                    },
                    child: Text(listaDeMensagens[0].join('\n')),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            !isButtonPressed[1] ? Colors.grey : Colors.red),
                    onPressed: () {
                      setState(() {
                        isButtonPressed[1] = !isButtonPressed[1];
                      });
                    },
                    child: Text(listaDeMensagens[1].join('\n')),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            !isButtonPressed[2] ? Colors.grey : Colors.green),
                    onPressed: () {
                      setState(() {
                        isButtonPressed[2] = !isButtonPressed[2];
                      });
                    },
                    child: Text(listaDeMensagens[2].join('\n')),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              !isButtonPressed[3] ? Colors.grey : Colors.red),
                      onPressed: () {
                        setState(() {
                          isButtonPressed[3] = !isButtonPressed[3];
                        });
                      },
                      child: Text(listaDeMensagens[3].join('\n')))
                ]),
          ),
        ],
      ),
    );
  }
}
