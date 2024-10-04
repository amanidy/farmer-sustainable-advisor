import 'package:flutter/material.dart';

class TutorialDetailPage extends StatelessWidget {
  final String title;
  final String description;

  const TutorialDetailPage(
      {required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(description, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
