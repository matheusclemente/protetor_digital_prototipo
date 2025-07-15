import 'package:flutter/material.dart';
import 'package:protetor_digital_prototipo/features/checklists/models/safe_message_checklist.dart';
import 'package:protetor_digital_prototipo/features/checklists/models/safe_link_checklist.dart';

class ChecklistScreen extends StatelessWidget {
  const ChecklistScreen({super.key});

  static const checklists = [
    SafeMessageChecklistScreen(checklistIndex: 0),
    SafeLinkChecklistScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklists'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("Checklist ${index + 1}"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => checklists[index]));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
