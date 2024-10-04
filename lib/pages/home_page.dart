import 'package:flutter/material.dart';
import 'package:sustainable_farming_advisor/pages/weather_updates_page.dart';
import 'package:sustainable_farming_advisor/pages/market_place_page.dart';
import 'package:sustainable_farming_advisor/pages/community_forum_page.dart';
import 'package:sustainable_farming_advisor/pages/tutorials_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sustainable Farming Advisor"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const WeatherUpdatesPage()),
                );
              },
              child: const Text("Weather Updates ")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MarketplacePage()));
              },
              child: const Text("Market Place ")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommunityForumPage()));
              },
              child: const Text("Community Forum ")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  TutorialsPage()));
              },
              child: const Text("Farming Tutorials ")),
        ],
      ),
    );
  }
}
