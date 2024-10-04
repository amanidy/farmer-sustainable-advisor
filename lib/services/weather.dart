// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:dotenv/dotenv.dart';

class WeatherService {
  
  final String? apiKey = env['API_KEY'] ;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final url = '$baseUrl?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
