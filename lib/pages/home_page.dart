import 'package:flutter/material.dart';
import 'package:sustainable_farming_advisor/pages/weather_updates_page.dart';
import 'package:sustainable_farming_advisor/pages/market_place_page.dart';
import 'package:sustainable_farming_advisor/pages/forum_page.dart';
import 'package:sustainable_farming_advisor/pages/tutorials_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sustainable Farming Advisor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Defines 2 items per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            _buildFeatureCard(
              context,
              icon: Icons.cloud_outlined,
              title: 'Weather Updates',
              description: 'Get real-time weather forecasts',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const WeatherUpdatesPage()),
                );
              },
            ),
            _buildFeatureCard(
              context,
              icon: Icons.store_mall_directory,
              title: 'Market Place',
              description: 'Buy and sell sustainable tools',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MarketplacePage()));
              },
            ),
            _buildFeatureCard(
              context,
              icon: Icons.forum_outlined,
              title: 'Community Forum',
              description: 'Discuss farming tips with others',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ForumPage()));
              },
            ),
            _buildFeatureCard(
              context,
              icon: Icons.book_outlined,
              title: 'Farming Tutorials',
              description: 'Learn sustainable farming practices',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TutorialsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the feature cards
  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15.0),
        splashColor: Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: Colors.green,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

