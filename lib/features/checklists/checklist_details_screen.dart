import 'package:flutter/material.dart';

class ChecklistDetailsScreen extends StatefulWidget {
  const ChecklistDetailsScreen({super.key, required this.checklistIndex});

  final int checklistIndex;

  @override
  State<ChecklistDetailsScreen> createState() => _ChecklistDetailsScreenState();
}

class _ChecklistDetailsScreenState extends State<ChecklistDetailsScreen> {
  var isButtonPressed = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checklist $widget.checklistIndex"),
      ),
      body: Column(children: [
        Text("Quanto é 2 + 2?"),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: !isButtonPressed[0] ? Colors.white : Colors.red),
          onPressed: () {
            setState(() {
              isButtonPressed[0] = !isButtonPressed[0];
            });
          },
          child: Text("2"),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    !isButtonPressed[1] ? Colors.white : Colors.red),
            onPressed: () {
              setState(() {
                isButtonPressed[1] = !isButtonPressed[1];
              });
            },
            child: Text("3")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    !isButtonPressed[2] ? Colors.white : Colors.green),
            onPressed: () {
              setState(() {
                isButtonPressed[2] = !isButtonPressed[2];
              });
            },
            child: Text("4")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    !isButtonPressed[3] ? Colors.white : Colors.red),
            onPressed: () {
              setState(() {
                isButtonPressed[3] = !isButtonPressed[3];
              });
            },
            child: Text("22"))
      ]),
    );
  }
}
