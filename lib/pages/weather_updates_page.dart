import 'package:flutter/material.dart';
import 'package:sustainable_farming_advisor/services/weather.dart';

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
