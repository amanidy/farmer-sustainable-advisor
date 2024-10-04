import 'package:flutter/material.dart';

class MarketPlacePage extends StatelessWidget {
  const MarketPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Place'),
      ),
      body: const Center(
        child: Text("Interact with your local market here"),
      ),
    );
  }
}
