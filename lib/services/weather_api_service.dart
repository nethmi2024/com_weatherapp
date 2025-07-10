import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherApiService {
  static const String _apiKey = '9d3699a69f65130eb9b895e22a14b87f'; // Replace this!
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> getWeatherByCity(String city) async {
    final url = Uri.parse('$_baseUrl?q=$city&units=metric&appid=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return Weather.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
