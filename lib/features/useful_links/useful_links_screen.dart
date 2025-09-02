import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'models/emergency_contact_model.dart';

class UsefulLinksScreen extends StatelessWidget {
  UsefulLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos Úteis", style: TextStyle(fontSize: 22.0)),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Contatos de Emergência',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Obtenha ajuda quando necessário',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9), fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _emergencyContacts.length,
              itemBuilder: (context, index) {
                final contact = _emergencyContacts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(contact.iconData,
                            size: 48, color: Theme.of(context).primaryColor),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: 22,
                                    ),
                              ),
                              Text(
                                contact.description,
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 18),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                contact.phone,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.call, size: 28),
                          color: Theme.of(context).primaryColor,
                          onPressed: () =>
                              _launchUrlString('tel:${contact.phone}'),
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

  final List<EmergencyContact> _emergencyContacts =
      EmergencyContactModel.emergencyContacts;

  Widget _buildReminderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        color: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lembre-se:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
              ),
              const SizedBox(height: 10),
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
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•',
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[800], fontSize: 18),
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
