import 'package:flutter/material.dart';
import 'package:protetor_digital_prototipo/features/checklists/models/safe_message_checklist.dart';
import 'package:protetor_digital_prototipo/features/checklists/models/safe_link_checklist.dart';

class ChecklistScreen extends StatelessWidget {
  const ChecklistScreen({super.key});

  static const checklists = [
    SafeMessageChecklistScreen(checklistIndex: 0),
    SafeLinkChecklistScreen()
  ];
  
  static const List<Map<String, dynamic>> checklistData = [
    {
      'title': 'Mensagens Seguras',
      'icon': Icons.message,
      'description': 'Aprenda a identificar mensagens seguras e fraudulentas',
      'color': Color(0xFF1A365D),
    },
    {
      'title': 'Links Seguros',
      'icon': Icons.link,
      'description': 'Verifique se os links são confiáveis antes de clicar',
      'color': Color(0xFF1A365D),
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklists de Segurança'),
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
                const Icon(
                  Icons.security,
                  size: 48,
                  color: Color(0xFF1A365D),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Verifique sua Segurança',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Complete os checklists para garantir sua proteção digital',
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
                itemCount: checklistData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => checklists[index],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: checklistData[index]['color'].withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                checklistData[index]['icon'],
                                color: checklistData[index]['color'],
                                size: 32,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    checklistData[index]['title'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    checklistData[index]['description'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 16),
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
