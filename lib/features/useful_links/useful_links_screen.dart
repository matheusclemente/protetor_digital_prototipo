import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'models/emergency_contact_model.dart';

class UsefulLinksScreen extends StatelessWidget {
  UsefulLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sites Úteis"),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Contatos de Emergência',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Obtenha ajuda quando necessário',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _emergencyContacts.length,
              itemBuilder: (context, index) {
                final contact = _emergencyContacts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(contact.iconData, size: 40, color: Theme.of(context).primaryColor),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                contact.description,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                contact.phone,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.call),
                          color: Theme.of(context).primaryColor,
                          onPressed: () => _launchUrlString('tel:${contact.phone}'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _buildReminderSection(context),
        ],
      ),
    );
  }

  final List<EmergencyContact> _emergencyContacts = EmergencyContactModel.emergencyContacts;

Widget _buildReminderSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Card(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lembre-se:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor
              ),
            ),
            const SizedBox(height: 8),
            _buildReminderItem('• Aja rapidamente se for vítima de golpe'),
            _buildReminderItem('• Contate seu banco imediatamente'),
            _buildReminderItem('• Mantenha registros das comunicações'),
          ],
        ),
      ),
    ),
  );
}

Widget _buildReminderItem(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: TextStyle(
            color: Colors.blue[700],
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14
            ),
          ),
        ),
      ],
    ),
  );
}


void _launchUrlString(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
