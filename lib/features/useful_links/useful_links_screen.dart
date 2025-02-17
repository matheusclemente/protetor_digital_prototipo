import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UsefulLinksScreen extends StatelessWidget {
  const UsefulLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sites Úteis"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          const Text(
              "Clique nos links abaixo para ter acesso a sites com mais informações"),
          ElevatedButton(
              onPressed: () => _launchUrlString("https://www.google.com/"),
              child: const Text("Google")),
          ElevatedButton(
              onPressed: () => _launchUrlString("https://www.youtube.com/"),
              child: const Text("YouTube")),
        ]),
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
