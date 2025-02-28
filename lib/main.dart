import 'package:flutter/material.dart';
import 'package:sustainable_farming_advisor/pages/home_page.dart';
import 'package:dotenv/dotenv.dart' as dotenv;

void main() {
  dotenv.load();
  runApp(const AgrisenseApp());
}

class AgrisenseApp extends StatelessWidget {
  const AgrisenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sustainable Farming Advisor",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}
