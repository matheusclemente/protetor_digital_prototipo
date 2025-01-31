import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golpes Comuns'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return const Placeholder(fallbackHeight: 50);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
