import 'package:flutter/material.dart';
import 'package:protetor_digital_prototipo/features/checklists/models/safe_message_checklist.dart';

class ChecklistScreen extends StatelessWidget {
  const ChecklistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklists'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("Checklist $index"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SafeMessageChecklistScreen(
                              checklistIndex: index,
                            )));
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
