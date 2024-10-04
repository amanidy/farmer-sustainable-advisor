import 'package:flutter/material.dart';

class CommunityForumPage extends StatelessWidget {
  const CommunityForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Forum'),
      ),
      body: const Center(
        child: Text("Farmers interaction space"),
      ),
    );
  }
}
