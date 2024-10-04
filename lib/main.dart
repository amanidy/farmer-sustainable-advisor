import 'package:flutter/material.dart';
import 'package:sustainable_farming_advisor/services/weather.dart';

void main() {
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ignore: empty_constructor_bodies
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
                  MaterialPageRoute(builder: (context) => const WeatherUpdatesPage()),
                );
              },
              child: const Text("Weather Updates ")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MarketPlacePage()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TutorialsPage()));
              },
              child: const Text("Farming Tutorials ")),
        ],
      ),
    );
  }
}

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

class WeatherUpdatesPage extends StatefulWidget {
  const WeatherUpdatesPage({super.key});
  
  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherUpdatesPage> {
  final _cityController = TextEditingController();
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? _weatherData;

  Future<void> _getWeather() async {
    try {
      final data = await _weatherService.fetchWeather(_cityController.text);
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching weather: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Updates'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getWeather,
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            _weatherData != null
                ? Column(
                    children: [
                      Text(
                        'Temperature: ${_weatherData!['main']['temp']}°C',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Condition: ${_weatherData!['weather'][0]['description']}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

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
