import 'package:flutter/material.dart';
import 'package:sustainable_farming_advisor/models/tool.dart';
import 'package:sustainable_farming_advisor/data/tool_data.dart';

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: ListView.builder(
        itemCount: tools.length,
        itemBuilder: (context, index) {
          final tool = tools[index];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(tool.imageUrl),
              title: Text(tool.name),
              subtitle: Text('${tool.price.toStringAsFixed(2)} USD'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ToolDetailPage(tool: tool),
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

class ToolDetailPage extends StatelessWidget {
  final Tool tool;

  const ToolDetailPage({required this.tool, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tool.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(tool.imageUrl),
            const SizedBox(height: 16.0),
            Text(
              tool.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              '${tool.price.toStringAsFixed(2)} USD',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16.0),
            Text(tool.description),
          ],
        ),
      ),
    );
  }
}
