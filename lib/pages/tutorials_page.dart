import 'package:flutter/material.dart';
import 'package:sustainable_farming_advisor/pages/tutorial_detail_page.dart';

class TutorialsPage extends StatelessWidget {
  TutorialsPage({super.key});

  final List<Map<String, String>> tutorials = [
    {
      'title': 'Water Conservation in Farming',
      'description':
          'Learn how to conserve water through smart irrigation and rainwater harvesting techniques.',
    },
    {
      'title': 'Crop Rotation Benefits',
      'description':
          'Understand the benefits of rotating crops to improve soil health and reduce pests.',
    },
    {
      'title': 'Organic Farming Basics',
      'description':
          'A beginner`s guide to organic farming, focusing on natural fertilizers and pesticides.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farming Tutorials'),
      ),
      body: ListView.builder(
        itemCount: tutorials.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(tutorials[index]['title']!),
              subtitle: Text(tutorials[index]['description']!),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TutorialDetailPage(
                      title: tutorials[index]['title']!,
                      description: tutorials[index]['description']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
